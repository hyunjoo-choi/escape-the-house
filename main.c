/*
To play the game, collect the keys on each floor to advance to the next floor using the stairs/door.
Getting to the door on the last level means you win the game.
If you get hit, you lose a life. You have 4 lives in total.
You can't use the door/stairs without finding the key in that floor.
*/

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "startBG.h"
#include "winBG.h"
#include "loseBG.h"
#include "pauseBG.h"
#include "gameBG.h"
#include "game.h"
#include "game2.h"
#include "game3.h"
#include "instructionsBG.h"
#include "spritesheet.h"
#include "room1.h"
#include "basement.h"
#include "hallway.h"
#include "sound.h"
#include "thecarnival.h"
#include "hit.h"
#include "shoot.h"
#include "playerhit.h"
#include "cheer.h"
#include "sky.h"


OBJ_ATTR shadowOAM[128];


// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToGame2();
void game2();
void goToGame3();
void game3();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
void drawHealth(int lives, int gameCheat);

// States
enum {START, INSTRUCTIONS, GAME, GAME2, GAME3, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Current level
int gameLevel;

// Health Struct
typedef struct {
    int lives;
    int row;
    int col;
} HEALTH;

// Current health
HEALTH health;

// SOUNDS
SOUND soundA;
SOUND soundB;


// Cheat
int gameCheat = 0;

int main() {

    initialize();

    setupSounds();
    setupInterrupts();


    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case GAME:
                game();
                break;
            case GAME2:
                game2();
                break;
            case GAME3:
                game3();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
               
    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    // Set up the first state
    goToStart();
}

// Sets up the start state
void goToStart() {

    stopSound();
    playSoundA(thecarnival,THECARNIVALLEN,THECARNIVALFREQ, 1);

	numOfKeys = 0;
    gameLevel = 0;

    // Initialize health
    health.lives = 4;
    health.row = 0;
    health.col = 0;

    resetGameLevel();
    resetGameLevel2();
    resetGameLevel3();
    resetHealth();
    resetHealth2();
    resetHealth3();
    resetCheat();
    resetCheat2();
    resetCheat3();

    DMANow(3, startBGPal, PALETTE, startBGPalLen/2);
    DMANow(3, startBGTiles, &CHARBLOCK[0], startBGTilesLen/2);
    DMANow(3, startBGMap, &SCREENBLOCK[20], startBGMapLen/2);
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(20);
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    
    waitForVBlank();
    state = START;

}

// Runs every frame of the start state
void start() {


    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        initGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
    	goToInstructions();
    }
}

// Sets up the instructions state
void goToInstructions() {
	// DMA stuff
	DMANow(3, instructionsBGPal, PALETTE, instructionsBGPalLen/2);
    DMANow(3, instructionsBGTiles, &CHARBLOCK[0], instructionsBGTilesLen/2);
    DMANow(3, instructionsBGMap, &SCREENBLOCK[26], instructionsBGMapLen/2);
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(26);
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

	waitForVBlank();
	state = INSTRUCTIONS;
}

// Runs instruction state
void instructions() {

	waitForVBlank();
	
	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		goToStart();
	}
	if (BUTTON_PRESSED(BUTTON_START)) {
		goToGame();
		initGame();
	}
}

// Sets up the game state
void goToGame() {

	gameLevel = 0;

    health.lives = 4;
    hits = 0;

    DMANow(3, skyPal, PALETTE, skyPalLen/2);
    DMANow(3, room1Tiles, &CHARBLOCK[0], room1TilesLen/2);
    DMANow(3, room1Map, &SCREENBLOCK[25], room1MapLen/2);

    DMANow(3, skyTiles, &CHARBLOCK[2], skyTilesLen/2);
    DMANow(3, skyMap, &SCREENBLOCK[20], skyMapLen/2);


    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);

    hideSprites();
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    REG_BG0CNT = BG_8BPP| BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(25);
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    REG_BG1CNT = BG_8BPP| BG_SIZE_SMALL | BG_CHARBLOCK(2) | BG_SCREENBLOCK(20);
    REG_BG1HOFF = hOff / 2;
    REG_BG1VOFF = vOff / 2;



    state = GAME;
}

// Runs every frame of the game state
void game() {

	gameLevel = gameGameLevel;
	gameCheat = getCheat();
    
    health.lives = 4 - hits;

    updateGame();
    drawGame();

    drawHealth(health.lives, gameCheat);


    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
        goToPause();
    if (BUTTON_PRESSED(BUTTON_SELECT))
    	cheatToggle();
    else if (tooClose)
        goToLose();
    if (gameLevel == 1) {
    	goToGame2();
    }

    //Copy shadowOAM to OAM
    DMANow(3, &shadowOAM, OAM, 128*4);

}

void goToGame2() {
	initGame2();

    hits2 = hits;
    health.lives = 4 - hits;

    DMANow(3, basementPal, PALETTE, basementPalLen/2);
    DMANow(3, basementTiles, &CHARBLOCK[0], basementTilesLen/2);
    DMANow(3, basementMap, &SCREENBLOCK[26], basementMapLen/2);

    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);

    hideSprites();
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    REG_BG0CNT = BG_8BPP| BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(26);
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    state = GAME2;
}

void game2() {
	updateGame2();
    drawGame2();
    gameLevel = gameGameLevel2;
    health.lives = 4 - hits2;

    gameCheat = getCheat2();

    // Draw health
    drawHealth(health.lives, gameCheat);

    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
        goToPause();
    if (BUTTON_PRESSED(BUTTON_SELECT))
    	cheatToggle2();
    else if (tooClose2)
        goToLose();
    if (gameLevel == 2) {
    	goToGame3();
    }

    //Copy shadowOAM to OAM
    DMANow(3, &shadowOAM, OAM, 128*4);
}

void goToGame3() {
	initGame3();

	hits3 = hits2;
	health.lives = 4 - hits3;

    DMANow(3, hallwayPal, PALETTE, hallwayPalLen/2);
    DMANow(3, hallwayTiles, &CHARBLOCK[0], hallwayTilesLen/2);
    DMANow(3, hallwayMap, &SCREENBLOCK[26], hallwayMapLen/2);

    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);

    hideSprites();
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    REG_BG0CNT = BG_8BPP| BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(26);
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    state = GAME3;
}

void game3() {
	updateGame3();
    drawGame3();
    gameLevel = gameGameLevel3;
    health.lives = 4 - hits3;

    gameCheat = getCheat3();

    // Draw health
    drawHealth(health.lives, gameCheat);

    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
        goToPause();
    if (BUTTON_PRESSED(BUTTON_SELECT))
    	cheatToggle3();
    else if (gameLevel == 3)
        goToWin();
    else if (tooClose3)
        goToLose();

    //Copy shadowOAM to OAM
    DMANow(3, &shadowOAM, OAM, 128*4);
}

// Sets up the pause state
void goToPause() {

    DMANow(3, pauseBGPal, PALETTE, pauseBGPalLen/2);
    DMANow(3, pauseBGTiles, &CHARBLOCK[0], pauseBGTilesLen/2);
    DMANow(3, pauseBGMap, &SCREENBLOCK[26], pauseBGMapLen/2);
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(26);
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    waitForVBlank();

    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
    	if (gameLevel == 0) {
    		goToGame();
    	} else if (gameLevel == 1) {
    		goToGame2();
    	} else if (gameLevel == 2) {
    		goToGame3();
    	}
    }
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Sets up the win state
void goToWin() {
	stopSound();
    playSoundA(cheer,CHEERLEN,CHEERFREQ, 0);

    DMANow(3, winBGPal, PALETTE, winBGPalLen/2);
    DMANow(3, winBGTiles, &CHARBLOCK[0], winBGTilesLen/2);
    DMANow(3, winBGMap, &SCREENBLOCK[26], winBGMapLen/2);
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(26);
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    waitForVBlank();


    state = WIN;
}

// Runs every frame of the win state
void win() {
    
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Sets up the lose state
void goToLose() {

    DMANow(3, loseBGPal, PALETTE, loseBGPalLen/2);
    DMANow(3, loseBGTiles, &CHARBLOCK[0], loseBGTilesLen/2);
    DMANow(3, loseBGMap, &SCREENBLOCK[26], loseBGMapLen/2);
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(26);
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    waitForVBlank();

    

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
     
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
        goToStart();
}

// Draw health
void drawHealth(int lives, int gameCheat) {
    if (lives == 4) {
        shadowOAM[4].attr0 = health.row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[4].attr1 = health.col | ATTR1_SMALL;
        shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3*2, (1-gameCheat)*2);
        
        shadowOAM[5].attr0 = health.row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[5].attr1 = (health.col + 12) | ATTR1_SMALL;
        shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3*2, (1-gameCheat)*2);
        
        shadowOAM[6].attr0 = health.row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[6].attr1 = (health.col + 24) | ATTR1_SMALL;
        shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3*2, (1-gameCheat)*2);
        
        shadowOAM[7].attr0 = health.row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[7].attr1 = (health.col + 36) | ATTR1_SMALL;
        shadowOAM[7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3*2, (1-gameCheat)*2);
    } else if (lives == 3) {
        shadowOAM[4].attr0 = health.row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[4].attr1 = health.col | ATTR1_SMALL;
        shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3*2, (1-gameCheat)*2);
        
        shadowOAM[5].attr0 = health.row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[5].attr1 = (health.col + 12) | ATTR1_SMALL;
        shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3*2, (1-gameCheat)*2);
        
        shadowOAM[6].attr0 = health.row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[6].attr1 = (health.col + 24) | ATTR1_SMALL;
        shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3*2, (1-gameCheat)*2);

        shadowOAM[7].attr0 = ATTR0_HIDE;
    } else if (lives == 2) {
        shadowOAM[4].attr0 = health.row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[4].attr1 = health.col | ATTR1_SMALL;
        shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3*2, (1-gameCheat)*2);
        
        shadowOAM[5].attr0 = health.row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[5].attr1 = (health.col + 12) | ATTR1_SMALL;
        shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3*2, (1-gameCheat)*2);

        shadowOAM[7].attr0 = ATTR0_HIDE;
        shadowOAM[6].attr0 = ATTR0_HIDE;
    } else if (lives == 1) {
        shadowOAM[4].attr0 = health.row | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[4].attr1 = health.col | ATTR1_SMALL;
        shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3*2, (1-gameCheat)*2);

        shadowOAM[7].attr0 = ATTR0_HIDE;
        shadowOAM[6].attr0 = ATTR0_HIDE;
        shadowOAM[5].attr0 = ATTR0_HIDE;
    } else {
        shadowOAM[7].attr0 = ATTR0_HIDE;
        shadowOAM[6].attr0 = ATTR0_HIDE;
        shadowOAM[5].attr0 = ATTR0_HIDE;
        shadowOAM[4].attr0 = ATTR0_HIDE;
    }
}