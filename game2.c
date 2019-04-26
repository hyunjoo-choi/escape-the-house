#include <stdlib.h>
#include "myLib.h"
#include "game2.h"
#include "collisionmap2.h"
#include "sound.h"
#include "hit.h"
#include "shoot.h"
#include "playerhit.h"


// Variables
PLAYER2 player2;
BULLET2 bullets2[BULLETCOUNT];
BULLET2 eBullets2[BULLETCOUNT];
ENEMY2 enemyL2[5];
ITEM2 key2;
STAIR2 stair2;

int tooClose2;
int hOff;
int vOff;
int numOfKeys;
int gameGameLevel2 = 0;
int hits2 = 0;
int cheat2;

enum {PLAYERFRONT, PLAYERBACK, PLAYERLEFT, PLAYERRIGHT};

// Initialize the game
void initGame2() {

	// Placing the screen on the map
	vOff = 48;
	hOff = 8;

	initPlayer2();
    initBullets2();
    initEnemy2();
    initItem2();
    initStair2();

    // Initialize the score

    
}

// Updates the game each frame
void updateGame2() {

	updatePlayer2();

	// Update all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		updateBullet2(&bullets2[i]);
	for (int i = 0; i < BULLETCOUNT; i++)
		updateBullet2(&eBullets2[i]);

	// Update all the enemies
	for (int i = 0; i < 3; i++) {
		updateEnemy2(&enemyL2[i]);
	}

	updateItem2();
	updateStair2();
}

// Draws the game each frame
void drawGame2() {

	drawPlayer2();

	// Draw all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		drawBullet2(&bullets2[i]);
	for (int i = 0; i < BULLETCOUNT; i++)
		drawBullet2(&eBullets2[i]);

	// Draw all the enemies
	for (int i = 0; i < 3; i++) {
	    drawEnemyL2(&enemyL2[i], 12 + i);
	}

	drawItem2();
	drawStair2();

	REG_BG0HOFF = hOff;
	REG_BG0VOFF = vOff;

}


// Initialize the player
void initPlayer2() {

	player2.row = SCREENHEIGHT/2-player2.height/2 + vOff;
	player2.col = SCREENWIDTH/2-player2.width/2 + hOff;
	player2.cdel = 1;
	player2.rdel = 1;
	player2.height = 15;
	player2.width = 10;
	player2.bulletTimer = 20;
	player2.cDirection = 0;
	player2.rDirection = 0;
	player2.curState = PLAYERFRONT;
	player2.prevState = PLAYERFRONT;
	player2.curFrame = 0;
	player2.hasKey = 0;
}

// Handle every-frame actions of the player
void updatePlayer2() {

	// Move the player
	if (BUTTON_HELD(BUTTON_LEFT)
		&& (player2.row < 256) && (player2.row >= 0) && (player2.col <= 256) && (player2.col > 0)
        && (collisionmap2Bitmap[OFFSET(player2.row, player2.col - 1, 256)])
        && (collisionmap2Bitmap[OFFSET(player2.row + player2.height - 1, player2.col - 1, 256)])) {

		player2.col -= player2.cdel;
        player2.cDirection = -1;
        player2.curState = PLAYERLEFT;
        if ((hOff > 0) && (player2.screenCol <= SCREENWIDTH/2)) {
        	hOff--;
        }
    }
	if (BUTTON_HELD(BUTTON_RIGHT)
		&& (player2.row < 256) && (player2.row >= 0) && (player2.screenCol + player2.width - 1 < SCREENWIDTH) && (player2.col >= 0)
        && (collisionmap2Bitmap[OFFSET(player2.row, player2.col + player2.width, 256)])
        && (collisionmap2Bitmap[OFFSET(player2.row + player2.height - 1, player2.col + player2.width, 256)])) {

		player2.col += player2.cdel;
        player2.cDirection = 1;
        player2.curState = PLAYERRIGHT;

        if ((hOff < 256-SCREENWIDTH) && (player2.screenCol + player2.width - 1 >= SCREENWIDTH/2)) {
        	hOff++;
        }
    }
    if (BUTTON_HELD(BUTTON_UP) 
    	    && (player2.row + player2.height - 1 <= 256) && (player2.row > 0) && (player2.col < 256) && (player2.col >= 0)
        	&& (collisionmap2Bitmap[OFFSET(player2.row - 1, player2.col, 256)])
        	&& (collisionmap2Bitmap[OFFSET(player2.row - 1, player2.col + player2.width - 1, 256)])
        	) {
    	player2.row -= player2.rdel;
    	player2.rDirection = -1;
    	player2.curState = PLAYERBACK;
    	if ((vOff > 0) && (player2.screenRow <= SCREENHEIGHT/2)) {
    		vOff--;
    	}
    }
    if (BUTTON_HELD(BUTTON_DOWN) 
    	    && (player2.row + player2.height - 1 < 256) && (player2.row >= 0) && (player2.col < 256) && (player2.col >= 0)
        	&& (collisionmap2Bitmap[OFFSET(player2.row + player2.height, player2.col, 256)])
        	&& (collisionmap2Bitmap[OFFSET(player2.row + player2.height, player2.col + player2.width - 1, 256)])) {
    	player2.row += player2.rdel;
        player2.rDirection = 1;
    	player2.curState = PLAYERFRONT;
        if ((vOff < 256-SCREENHEIGHT) && (player2.screenRow + player2.height-1 >= SCREENHEIGHT/2)) {
        	vOff++;
        }
    }
        	
	else {
        player2.cDirection = 0;
        player2.rDirection = 0;
    }
    player2.screenRow = player2.row - vOff;
    player2.screenCol = player2.col - hOff;

	// Fire bullets
	if (BUTTON_PRESSED(BUTTON_A) && player2.bulletTimer >= 13) {

		playSoundB(shoot, SHOOTLEN, SHOOTFREQ, 0);
		fireBullet2();
		player2.bulletTimer = 0;

	}

	player2.bulletTimer++;

	animatePlayer2();
}

// Player sprite animations
void animatePlayer2() {

    // Set previous state to current state
    player2.prevState = player2.curState;

    
    // Control movement and change animation state
    if(BUTTON_HELD(BUTTON_UP)) {
        player2.curState = PLAYERBACK;
        if(player2.aniCounter % 20 == 0) {
        	player2.curFrame = (player2.curFrame + 1) % 2;
        }
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        player2.curState = PLAYERFRONT;
        if(player2.aniCounter % 20 == 0) {
        	player2.curFrame = (player2.curFrame + 1) % 2;
        }
    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        player2.curState = PLAYERLEFT;
        if(player2.aniCounter % 20 == 0) {
        	player2.curFrame = (player2.curFrame + 1) % 2;
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        player2.curState = PLAYERRIGHT;
        if(player2.aniCounter % 20 == 0) {
        	player2.curFrame = (player2.curFrame + 1) % 2;
        }
    }

    player2.aniCounter++;
}

// Draw the player
void drawPlayer2() {

	shadowOAM[0].attr0 = (player2.screenRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (player2.screenCol & COLMASK) | ATTR1_SMALL;

    if (player2.curState == PLAYERFRONT) {
    	shadowOAM[0].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(4*2, player2.curFrame*2);
    } else if (player2.curState == PLAYERBACK) {
    	shadowOAM[0].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(4*2, (player2.curFrame + 2)*2);
    } else if (player2.curState == PLAYERLEFT) {
    	shadowOAM[0].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(2*2, player2.curFrame*2);
    } else if (player2.curState == PLAYERRIGHT) {
    	shadowOAM[0].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(2*2, (player2.curFrame + 2)*2);
    }

}

// Initialize the pool of bullets
void initBullets2() {

	for (int i = 0; i < BULLETCOUNT; i++) {
		bullets2[i].height = 4; 
		bullets2[i].width = 4;
		bullets2[i].row = -bullets2[i].height;
		bullets2[i].col = 0;
		bullets2[i].rdel = 2;
		bullets2[i].cdel = 2;
		bullets2[i].active = 0;
		bullets2[i].dir = 0;
		bullets2[i].players = 1;
	}

	for (int j = 0; j < BULLETCOUNT; j++) {
		eBullets2[j].height = 6;
		eBullets2[j].width = 6;
		eBullets2[j].row = -bullets2[j].height;
		eBullets2[j].col = 0;
		eBullets2[j].rdel = 2;
		eBullets2[j].cdel = 2;
		eBullets2[j].active = 0;
		eBullets2[j].dir = 0;
		eBullets2[j].players = 0;
	}
}

// Spawn a bullet
void fireBullet2() {

	// Find the first inactive bullet
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (!bullets2[i].active) {

			// Position the new bullet
			if (player2.curState == PLAYERFRONT) {
				bullets2[i].row = player2.row;
			    bullets2[i].col = player2.col;
			    bullets2[i].dir = 0;
			} else if (player2.curState == PLAYERLEFT) {
				bullets2[i].row = player2.row + 2;
			    bullets2[i].col = player2.col;
			    bullets2[i].dir = 1;
			} else if (player2.curState == PLAYERRIGHT) {
				bullets2[i].row = player2.row + 2;
			    bullets2[i].col = player2.col;
			    bullets2[i].dir = 2;
			} else if (player2.curState == PLAYERBACK) {
				bullets2[i].row = player2.row;
			    bullets2[i].col = player2.col;
			    bullets2[i].dir = 3;
			}

			// Take the bullet out of the pool
			bullets2[i].active = 1;
		}
		// Break out of the loop
		break;
	}
}

// Spawn enemy bullet
void fireEBullet2() {

	// Find the first inactive bullet
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (!eBullets2[i].active) {

			// Position the new bullet
			eBullets2[i].row = enemyL2[0].row;
			eBullets2[i].col = enemyL2[0].col;

			// Take the bullet out of the pool
			eBullets2[i].active = 1;
		}
		// Break out of the loop
		break;
	}
}

// Handle every-frame actions of a bullet
void updateBullet2(BULLET2* b) {

	// If active and player's bullet, update; otherwise ignore
	if (b->active && b->players) {
		if (b->dir == 0 && b->row < 256) {
			b->row += b->rdel;
		} else if (b->dir == 1 && b->col + b->width > 0) {
			b->col -= b->cdel;
		} else if (b->dir == 2 && b->col < 256) {
			b->col += b->cdel;
		} else if (b->dir == 3 && b->row + b->height > 0) {
			b->row -= b->rdel;
		} else {
			b->active = 0;
			shadowOAM[1].attr0 = ATTR0_HIDE;
		}

		b->screenRow = b->row - vOff;
		b->screenCol = b->col - hOff;
	
	// If active and enemy's bullet, update; otherwise ignore
	} else if (b->active && (!b->players)) {
		if (b->row + b->height > 0) {
			b->row -= b->rdel;

			// Handle eBullet-player collisions
			if (collision(player2.screenRow, player2.screenCol, player2.height, player2.width,
				b->screenRow, b->screenCol, b->height, b->width)) {
				// Put bullet back in the pool
				b->active = 0;
			    shadowOAM[120].attr0 = ATTR0_HIDE;
			    if (cheat2 == 0) {
			    	hits2++;
			    	playSoundB(playerhit, PLAYERHITLEN, PLAYERHITFREQ, 0);
			        if (hits2 == 4) {
			    	    tooClose2 = 1;
			        }
			    }
			}
		} else {
			b->active = 0;
			shadowOAM[120].attr0 = ATTR0_HIDE;
		}
		b->screenRow = b->row - vOff;
		b->screenCol = b->col - hOff;
	}
}

// Draw a bullet
void drawBullet2(BULLET2* b) {

	if(b->active && b->players) {
		shadowOAM[1].attr0 = (b->screenRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[1].attr1 = (b->screenCol & COLMASK) | ATTR1_SMALL;
		shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1*2, 2*2);
	} else if(b->active && (!b->players)) {
		shadowOAM[120].attr0 = (b->screenRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[120].attr1 = (b->screenCol & COLMASK) | ATTR1_SMALL;
		shadowOAM[120].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3*2, 2*2);
	}
}

// Initialize the enemies
void initEnemy2() {
	enemyL2[0].row = 185;
	enemyL2[0].col = SCREENWIDTH/2-enemyL2[0].height/2 + hOff;
	enemyL2[0].cdel = 1;
	enemyL2[0].height = 16;
	enemyL2[0].width = 16;
	enemyL2[0].bulletTimer = 20;
	enemyL2[0].cDirection = 0;
	enemyL2[0].active = 1;
	enemyL2[0].isLastRow = 0;
	enemyL2[0].aniCounter = 0;
	enemyL2[0].curFrame = 0;
	enemyL2[0].numFrames = 2;

}

// Handle every-frame actions of the enemy
void updateEnemy2(ENEMY2* b) {

	if (b->active) {

		// Bounce the enemy off the sides of the walls
		if (((collisionmap2Bitmap[OFFSET(b->row, b->col + b->width, 256)]) && (collisionmap2Bitmap[OFFSET(b->row + b->height - 1, b->col + b->width, 256)]))) {
			b->cdel *= -1;
		}
		if (((collisionmap2Bitmap[OFFSET(b->row, b->col - 1, 256)]) && (collisionmap2Bitmap[OFFSET(b->row + b->height - 1, b->col - 1, 256)]))) {
			b->cdel *= -1;
		}

		// Move the enemy sideways
		b->col += b->cdel;

		// Handle enemy-bullet collisions
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (bullets2[i].active && collision(b->screenRow-5, b->screenCol, b->height, b->width,
				bullets2[i].screenRow, bullets2[i].screenCol, bullets2[i].height, bullets2[i].width)) {

				// Put bullet and enemy back in the pool
				bullets2[i].active = 0;
			    shadowOAM[1].attr0 = ATTR0_HIDE;
				b->active = 0;

			}
		}

		// Handle enemy-player collision
		if (collision(b->screenRow, b->screenCol, b->height, b->width, player2.screenRow, player2.screenCol, player2.height, player2.width)) {
			if (cheat2 == 0) {
				hits2++;
				if (hits2 == 4) {
					tooClose2 = 1;
				}
			}
			if (b->col < player2.col) {
				player2.col += 4;
			} else if (b->col > player2.col) {
				player2.col -= 4;
			} else if (b->row < player2.row) {
				player2.row += 4;
			} else if (b->row > player2.row) {
				player2.row -= 4;
			}
	    }

	    // Sprite alternation and firing bullets from enemy to player
		b->aniCounter++;
		if(b->aniCounter % 20 == 0) {
			b->curFrame++;
			b->curFrame = b->curFrame % b->numFrames;
			fireEBullet2();
		}

		b->screenRow = b->row - vOff;
        b->screenCol = b->col - hOff;
	}
}

// Draw enemy
void drawEnemyL2(ENEMY2* b, int i) {
	if(b->active) {
		shadowOAM[i].attr0 = (b->screenRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[i].attr1 = (b->screenCol & COLMASK) | ATTR1_SMALL;
		shadowOAM[i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, (b->curFrame+2) * 2);
	} else {
		shadowOAM[i].attr0 = ATTR0_HIDE;
	}
}

// Initialize items in first level
void initItem2() {
	key2.row = 103;
	key2.col = 48;
	key2.height = 11;
	key2.width = 11;
	key2.active = 1;
}

// Update item
void updateItem2() {
	if (key2.active) {
		// Item-Player collision handling
		if (collision(key2.row, key2.col, key2.height, key2.width, player2.row, player2.col, player2.height, player2.width)) {

				// Inactivate & hide item
				key2.active = 0;
			    shadowOAM[2].attr0 = ATTR0_HIDE;

				// Update the number of keys
				numOfKeys++;
				player2.hasKey = 2;
		}
	}
}


// Draw item
void drawItem2() {
	if(key2.active) {
		shadowOAM[2].attr0 = ((key2.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[2].attr1 = ((key2.col - hOff) & COLMASK) | ATTR1_SMALL;
		shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1*2, 3*2);
	} else {
		shadowOAM[2].attr0 = ATTR0_HIDE;
	}

}

// Init stairs for level 1
void initStair2() {
	stair2.row = 80;
	stair2.col = 118;
	stair2.height = 16;
	stair2.width = 16;
	stair2.active = 1;
}


// Update stairs
void updateStair2() {
	if (stair2.active) {
		// Stair-Player collision handling
		if (collision(stair2.row, stair2.col, stair2.height, stair2.width, player2.row, player2.col, player2.height, player2.width) && player2.hasKey) {

				// Inactivate & hide stairs
				stair2.active = 0;
			    shadowOAM[3].attr0 = ATTR0_HIDE;

				// Update game level
				gameGameLevel2 = 2;



		}
	}
}

// Draw stairs
void drawStair2() {
	if(stair2.active) {
		shadowOAM[3].attr0 = ((stair2.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[3].attr1 = ((stair2.col - hOff) & COLMASK) | ATTR1_SMALL;
		shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(5*2, 0);
	} else {
		shadowOAM[3].attr0 = ATTR0_HIDE;
	}

}

// Reset game level after start state so you start at level 1 after restarting
void resetGameLevel2() {
	gameGameLevel2 = 0;
}

// Reset health
void resetHealth2() {
	tooClose2 = 0;
	hits2 = 0;
}

// Turn on/off cheat, making you invincible
void cheatToggle2() {
	if (cheat2) {
		cheat2 = 0;
	} else {
		cheat2 = 1;
	}
}
int getCheat2() {
	return cheat2;
}
void resetCheat2() {
	cheat2 = 0;
}
