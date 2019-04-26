#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "collisionmap1.h"
#include "sound.h"
#include "hit.h"
#include "shoot.h"


// Variables
PLAYER player;
BULLET bullets[BULLETCOUNT];
ENEMY enemyL1[3];
ITEM key1;
STAIR stair1;

int enemyRemaining;
int tooClose;
int hOff;
int vOff;
int numOfKeys;
int gameGameLevel = 0;
int hits = 0;
int cheat;

enum {PLAYERFRONT, PLAYERBACK, PLAYERLEFT, PLAYERRIGHT};

// Initialize the game
void initGame() {

	// Placing the screen on the map
	vOff = 48;
	hOff = 8;

	initPlayer();
    initBullets();
    initEnemy();
    initItem();
    initStair();

    
}

// Updates the game each frame
void updateGame() {

	updatePlayer();

	// Update all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		updateBullet(&bullets[i]);

	// Update all the enemies
	for (int i = 0; i < 3; i++) {
		updateEnemy(&enemyL1[i]);
	}

	updateItem();
	updateStair();
}

// Draws the game each frame
void drawGame() {

	drawPlayer();

	// Draw all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		drawBullet(&bullets[i]);

	// Draw all the enemies
	for (int i = 0; i < 3; i++) {
	    drawEnemyL1(&enemyL1[i], 12 + i);
	}

	drawItem();
	drawStair();

	REG_BG0HOFF = hOff;
	REG_BG0VOFF = vOff;

	REG_BG1HOFF = hOff/3;
	REG_BG1VOFF = vOff/3;

}


// Initialize the player
void initPlayer() {

	player.row = SCREENHEIGHT/2-player.height/2 + vOff;
	player.col = SCREENWIDTH/2-player.width/2 + hOff;
	player.cdel = 1;
	player.rdel = 1;
	player.height = 15;
	player.width = 10;
	player.bulletTimer = 20;
	player.cDirection = 0;
	player.rDirection = 0;
	player.curState = PLAYERFRONT;
	player.prevState = PLAYERFRONT;
	player.curFrame = 0;
	player.hasKey = 0;
}

// Handle every-frame actions of the player
void updatePlayer() {

	// Move the player
	if (BUTTON_HELD(BUTTON_LEFT)
		&& (player.row < 256) && (player.row >= 0) && (player.col <= 256) && (player.col > 0)
        && (collisionmap1Bitmap[OFFSET(player.row, player.col - 1, 256)])
        && (collisionmap1Bitmap[OFFSET(player.row + player.height - 1, player.col - 1, 256)])) {

		player.col -= player.cdel;
        player.cDirection = -1;
        player.curState = PLAYERLEFT;
        if ((hOff > 0) && (player.screenCol <= SCREENWIDTH/2)) {
        	hOff--;
        }
    }
	if (BUTTON_HELD(BUTTON_RIGHT)
		&& (player.row < 256) && (player.row >= 0) && (player.screenCol + player.width - 1 < SCREENWIDTH) && (player.col >= 0)
        && (collisionmap1Bitmap[OFFSET(player.row, player.col + player.width, 256)])
        && (collisionmap1Bitmap[OFFSET(player.row + player.height - 1, player.col + player.width, 256)])) {

		player.col += player.cdel;
        player.cDirection = 1;
        player.curState = PLAYERRIGHT;

        if ((hOff < 256-SCREENWIDTH) && (player.screenCol + player.width - 1 >= SCREENWIDTH/2)) {
        	hOff++;
        }
    }
    if (BUTTON_HELD(BUTTON_UP) 
    	    && (player.row + player.height - 1 <= 256) && (player.row > 0) && (player.col < 256) && (player.col >= 0)
        	&& (collisionmap1Bitmap[OFFSET(player.row - 1, player.col, 256)])
        	&& (collisionmap1Bitmap[OFFSET(player.row - 1, player.col + player.width - 1, 256)])
        	) {
    	player.row -= player.rdel;
    	player.rDirection = -1;
    	player.curState = PLAYERBACK;
    	if ((vOff > 0) && (player.screenRow <= SCREENHEIGHT/2)) {
    		vOff--;
    	}
    }
    if (BUTTON_HELD(BUTTON_DOWN) 
    	    && (player.row + player.height - 1 < 256) && (player.row >= 0) && (player.col < 256) && (player.col >= 0)
        	&& (collisionmap1Bitmap[OFFSET(player.row + player.height, player.col, 256)])
        	&& (collisionmap1Bitmap[OFFSET(player.row + player.height, player.col + player.width - 1, 256)])) {
    	player.row += player.rdel;
        player.rDirection = 1;
    	player.curState = PLAYERFRONT;
        if ((vOff < 256-SCREENHEIGHT) && (player.screenRow + player.height-1 >= SCREENHEIGHT/2)) {
        	vOff++;
        }
    }
        	
	else {
        player.cDirection = 0;
        player.rDirection = 0;
    }
    player.screenRow = player.row - vOff;
    player.screenCol = player.col - hOff;

	// Fire bullets
	if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 13) {

		fireBullet();
		player.bulletTimer = 0;

	}

	player.bulletTimer++;

	animatePlayer();
}

// Player sprite animations
void animatePlayer() {

    // Set previous state to current state
    player.prevState = player.curState;

    
    // Control movement and change animation state
    if(BUTTON_HELD(BUTTON_UP)) {
        player.curState = PLAYERBACK;
        if(player.aniCounter % 20 == 0) {
        	player.curFrame = (player.curFrame + 1) % 2;
        }
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        player.curState = PLAYERFRONT;
        if(player.aniCounter % 20 == 0) {
        	player.curFrame = (player.curFrame + 1) % 2;
        }
    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        player.curState = PLAYERLEFT;
        if(player.aniCounter % 20 == 0) {
        	player.curFrame = (player.curFrame + 1) % 2;
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        player.curState = PLAYERRIGHT;
        if(player.aniCounter % 20 == 0) {
        	player.curFrame = (player.curFrame + 1) % 2;
        }
    }

    player.aniCounter++;
}

// Draw the player
void drawPlayer() {

	shadowOAM[0].attr0 = (player.screenRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (player.screenCol & COLMASK) | ATTR1_SMALL;

    if (player.curState == PLAYERFRONT) {
    	shadowOAM[0].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(4*2, player.curFrame*2);
    } else if (player.curState == PLAYERBACK) {
    	shadowOAM[0].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(4*2, (player.curFrame + 2)*2);
    } else if (player.curState == PLAYERLEFT) {
    	shadowOAM[0].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(2*2, player.curFrame*2);
    } else if (player.curState == PLAYERRIGHT) {
    	shadowOAM[0].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(2*2, (player.curFrame + 2)*2);
    }

}

// Initialize the pool of bullets
void initBullets() {

	for (int i = 0; i < BULLETCOUNT; i++) {

		bullets[i].height = 4; 
		bullets[i].width = 4;
		bullets[i].row = -bullets[i].height;
		bullets[i].col = 0;
		bullets[i].rdel = 2;
		bullets[i].cdel = 2;
		bullets[i].active = 0;
		bullets[i].dir = 0;
	}
}

// Spawn a bullet
void fireBullet() {
	playSoundB(shoot, SHOOTLEN, SHOOTFREQ, 0);

	// Find the first inactive bullet
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (!bullets[i].active) {

			// Position the new bullet
			if (player.curState == PLAYERFRONT) {
				bullets[i].row = player.screenRow + player.height - 1;
			    bullets[i].col = player.screenCol + (player.width/2) - 5;
			    bullets[i].dir = 0;
			} else if (player.curState == PLAYERLEFT) {
				bullets[i].row = player.screenRow + (player.height/2) - 5;
			    bullets[i].col = player.screenCol + (player.width/2) - 5;
			    bullets[i].dir = 1;
			} else if (player.curState == PLAYERRIGHT) {
				bullets[i].row = player.screenRow + (player.height/2) - 5;
			    bullets[i].col = player.screenCol + (player.width/2) - 5;
			    bullets[i].dir = 2;
			} else if (player.curState == PLAYERBACK) {
				bullets[i].row = player.screenRow;
			    bullets[i].col = player.screenCol + (player.width/2) - 5;
			    bullets[i].dir = 3;
			}

			// Take the bullet out of the pool
			bullets[i].active = 1;
		}
		// Break out of the loop
		break;
	}
}

// Handle every-frame actions of a bullet
void updateBullet(BULLET* b) {

	// If active, update; otherwise ignore
	if (b->active) {
		if (b->dir == 0 && b->row < SCREENHEIGHT) {
			b->row += b->rdel;
		} else if (b->dir == 1 && b->col + b->width > 0) {
			b->col -= b->cdel;
		} else if (b->dir == 2 && b->col < SCREENWIDTH) {
			b->col += b->cdel;
		} else if (b->dir == 3 && b->row + b->height > 0) {
			b->row -= b->rdel;
		} else {
			b->active = 0;
			shadowOAM[1].attr0 = ATTR0_HIDE;
		}
	}
}

// Draw a bullet
void drawBullet(BULLET* b) {

	if(b->active) {
		shadowOAM[1].attr0 = (b->row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[1].attr1 = (b->col & COLMASK) | ATTR1_SMALL;
		shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1*2, 2*2);
	}
}

// Initialize the enemies
void initEnemy() {
	enemyL1[0].row = 181;
	enemyL1[0].col = SCREENWIDTH/2-enemyL1[0].height/2 + hOff;
	enemyL1[0].cdel = 1;
	enemyL1[0].height = 16;
	enemyL1[0].width = 16;
	enemyL1[0].bulletTimer = 20;
	enemyL1[0].cDirection = 0;
	enemyL1[0].active = 1;
	enemyL1[0].aniCounter = 0;
	enemyL1[0].curFrame = 0;
	enemyL1[0].numFrames = 2;
	enemyL1[0].sideways = 1;

	enemyL1[1].row = 130;
	enemyL1[1].col = 70;
	enemyL1[1].rdel = 1;
	enemyL1[1].height = 16;
	enemyL1[1].width = 16;
	enemyL1[1].bulletTimer = 20;
	enemyL1[1].cDirection = 0;
	enemyL1[1].active = 1;
	enemyL1[1].aniCounter = 0;
	enemyL1[1].curFrame = 0;
	enemyL1[1].numFrames = 2;
	enemyL1[1].sideways = 0;

}

// Handle every-frame actions of the enemy
void updateEnemy(ENEMY* b) {

	if (b->active && b->sideways) {

		// Bounce the enemy off the sides of the walls
		if (((collisionmap1Bitmap[OFFSET(b->row, b->col + b->width, 256)]) && (collisionmap1Bitmap[OFFSET(b->row + b->height - 1, b->col + b->width, 256)]))) {
			b->cdel *= -1;
		}
		if (((collisionmap1Bitmap[OFFSET(b->row, b->col - 1, 256)]) && (collisionmap1Bitmap[OFFSET(b->row + b->height - 1, b->col - 1, 256)]))) {
			b->cdel *= -1;
		}

		// Move the enemy sideways
		b->col += b->cdel;

		// Handle enemy-bullet collisions
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (bullets[i].active && collision(b->row-vOff, b->col-hOff, b->height, b->width,
				bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {

				// Put bullet and enemy back in the pool
				bullets[i].active = 0;
			    shadowOAM[1].attr0 = ATTR0_HIDE;
				b->active = 0;

				// Update the score
				enemyRemaining--;
			}
		}

		// Handle enemy-player collision
		if (collision(b->row, b->col, b->height, b->width, player.row, player.col, player.height, player.width)) {
			if (cheat == 0) {
			    hits++;
			    if (hits == 4) {
			    	tooClose = 1;
			    }
			}

			if (b->col < player.col) {
				player.col += 4;
			} else if (b->col > player.col) {
				player.col -= 4;
			} else if (b->row < player.row) {
				player.row += 4;
			} else if (b->row > player.row) {
				player.row -= 4;
			}
	    }

		b->aniCounter++;
		if(b->aniCounter % 20 == 0) {
			b->curFrame++;
			b->curFrame = b->curFrame % b->numFrames;
		}
	} else if (b->active && (!b->sideways)) {

		// Bounce the enemy off the sides of the walls
		if ((collisionmap1Bitmap[OFFSET(b->row - 1, b->col, 256)]) && (collisionmap1Bitmap[OFFSET(b->row - 1, b->col + b->width - 1, 256)])) {
			b->rdel *= -1;
		}
		if ((collisionmap1Bitmap[OFFSET(b->row + b->height, b->col, 256)]) && (collisionmap1Bitmap[OFFSET(b->row + b->height, b->col + b->width - 1, 256)])) {
			b->rdel *= -1;
		}

		// Move the enemy sideways
		b->row += b->rdel;

		// Handle enemy-bullet collisions
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (bullets[i].active && collision(b->row-vOff, b->col-hOff, b->height, b->width,
				bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {

				// Put bullet and enemy back in the pool
				bullets[i].active = 0;
			    shadowOAM[1].attr0 = ATTR0_HIDE;
				b->active = 0;

				// Update the score
				enemyRemaining--;
			}
		}

		// Handle enemy-player collision
		if (collision(b->row, b->col, b->height, b->width, player.row, player.col, player.height, player.width)) {
			if (cheat == 0) {
				hits++;
				if (hits == 4) {
					tooClose = 1;
				}
			}
	
			if (b->col < player.col) {
				player.col += 4;
			} else if (b->col > player.col) {
				player.col -= 4;
			} else if (b->row < player.row) {
				player.row += 4;
			} else if (b->row > player.row) {
				player.row -= 4;
			}
	    }

		b->aniCounter++;
		if(b->aniCounter % 20 == 0) {
			b->curFrame++;
			b->curFrame = b->curFrame % b->numFrames;
		}
	}
}

// Draw enemy
void drawEnemyL1(ENEMY* b, int i) {
	if(b->active) {
		shadowOAM[i].attr0 = ((b->row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[i].attr1 = ((b->col - hOff) & COLMASK) | ATTR1_SMALL;
		shadowOAM[i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, b->curFrame * 2);
	} else {
		shadowOAM[i].attr0 = ATTR0_HIDE;
	}
}

// Initialize items in first level
void initItem() {
	key1.row = 100;
	key1.col = 72;
	key1.height = 11;
	key1.width = 11;
	key1.active = 1;
}

// Update item
void updateItem() {
	if (key1.active) {
		// Item-Player collision handling
		if (collision(key1.row, key1.col, key1.height, key1.width, player.row, player.col, player.height, player.width)) {

				// Inactivate & hide item
				key1.active = 0;
			    shadowOAM[2].attr0 = ATTR0_HIDE;

				// Update the number of keys
				numOfKeys++;
				player.hasKey = 1;
		}
	}
}


// Draw item
void drawItem() {
	if(key1.active) {
		shadowOAM[2].attr0 = ((key1.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[2].attr1 = ((key1.col - hOff) & COLMASK) | ATTR1_SMALL;
		shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1*2, 3*2);
	} else {
		shadowOAM[2].attr0 = ATTR0_HIDE;
	}

}

// Init stairs for level 1
void initStair() {
	stair1.row = 185;
	stair1.col = 155;
	stair1.height = 16;
	stair1.width = 16;
	stair1.active = 1;
}


// Update stairs
void updateStair() {
	if (stair1.active) {
		// Stair-Player collision handling
		if (collision(stair1.row, stair1.col, stair1.height, stair1.width, player.row, player.col, player.height, player.width) && player.hasKey) {

				// Inactivate & hide stairs
				stair1.active = 0;
			    shadowOAM[3].attr0 = ATTR0_HIDE;

				// Update game level
				gameGameLevel = 1;



		}
	}
}

// Draw stairs
void drawStair() {
	if(stair1.active) {
		shadowOAM[3].attr0 = ((stair1.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[3].attr1 = ((stair1.col - hOff) & COLMASK) | ATTR1_SMALL;
		shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(5*2, 0);
	} else {
		shadowOAM[3].attr0 = ATTR0_HIDE;
	}

}


// Reset game level after start state so you start at level 1 after restarting
void resetGameLevel() {
	gameGameLevel = 0;
}

// Reset player health so you don't automatically lose when restarting a game
void resetHealth() {
	tooClose = 0;
	hits = 0;
}

// Turn on/off cheat, making you invincible
void cheatToggle() {
	if (cheat) {
		cheat = 0;
	} else {
		cheat = 1;
	}
}
int getCheat() {
	return cheat;
}
void resetCheat() {
	cheat = 0;
}
