#include <stdlib.h>
#include "myLib.h"
#include "game3.h"
#include "collisionmap3.h"
#include "sound.h"
#include "hit.h"
#include "shoot.h"
#include "playerhit.h"


// Variables
PLAYER3 player3;
BULLET3 bullets3[BULLETCOUNT];
BULLET3 eBullets3[BULLETCOUNT];
ENEMY3 enemyL3[5];
ITEM3 key3;
STAIR3 stair3;

int tooClose3;
int hOff;
int vOff;
int numOfKeys;
int gameGameLevel3 = 0;
int hits3 = 0;
int cheat3;

enum {PLAYERFRONT, PLAYERBACK, PLAYERLEFT, PLAYERRIGHT};

// Initialize the game
void initGame3() {

	// Placing the screen on the map
	vOff = 48;
	hOff = 8;

	initPlayer3();
    initBullets3();
    initEnemy3();
    initItem3();
    initStair3();

    // Initialize the score

    
}

// Updates the game each frame
void updateGame3() {

	updatePlayer3();

	// Update all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		updateBullet3(&bullets3[i]);
	for (int i = 0; i < BULLETCOUNT; i++)
		updateBullet3(&eBullets3[i]);

	// Update all the enemies
	for (int i = 0; i < 3; i++) {
		updateEnemy3(&enemyL3[i]);
	}

	updateItem3();
	updateStair3();
}

// Draws the game each frame
void drawGame3() {

	drawPlayer3();

	// Draw all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		drawBullet3(&bullets3[i]);
	for (int i = 0; i < BULLETCOUNT; i++)
		drawBullet3(&eBullets3[i]);

	// Draw all the enemies
	for (int i = 0; i < 3; i++) {
	    drawEnemyL3(&enemyL3[i], 12 + i);
	}

	drawItem3();
	drawStair3();

	REG_BG0HOFF = hOff;
	REG_BG0VOFF = vOff;

}


// Initialize the player
void initPlayer3() {

	player3.row = SCREENHEIGHT/2-player3.height/2 + vOff;
	player3.col = SCREENWIDTH/2-player3.width/2 + hOff;
	player3.cdel = 1;
	player3.rdel = 1;
	player3.height = 15;
	player3.width = 10;
	player3.bulletTimer = 20;
	player3.cDirection = 0;
	player3.rDirection = 0;
	player3.curState = PLAYERFRONT;
	player3.prevState = PLAYERFRONT;
	player3.curFrame = 0;
	player3.hasKey = 0;
}

// Handle every-frame actions of the player
void updatePlayer3() {

	// Move the player
	if (BUTTON_HELD(BUTTON_LEFT)
		&& (player3.row < 256) && (player3.row >= 0) && (player3.col <= 256) && (player3.col > 0)
        && (collisionmap3Bitmap[OFFSET(player3.row, player3.col - 1, 256)])
        && (collisionmap3Bitmap[OFFSET(player3.row + player3.height - 1, player3.col - 1, 256)])) {

		player3.col -= player3.cdel;
        player3.cDirection = -1;
        player3.curState = PLAYERLEFT;
        if ((hOff > 0) && (player3.screenCol <= SCREENWIDTH/2)) {
        	hOff--;
        }
    }
	if (BUTTON_HELD(BUTTON_RIGHT)
		&& (player3.row < 256) && (player3.row >= 0) && (player3.screenCol + player3.width - 1 < SCREENWIDTH) && (player3.col >= 0)
        && (collisionmap3Bitmap[OFFSET(player3.row, player3.col + player3.width, 256)])
        && (collisionmap3Bitmap[OFFSET(player3.row + player3.height - 1, player3.col + player3.width, 256)])) {

		player3.col += player3.cdel;
        player3.cDirection = 1;
        player3.curState = PLAYERRIGHT;

        if ((hOff < 256-SCREENWIDTH) && (player3.screenCol + player3.width - 1 >= SCREENWIDTH/2)) {
        	hOff++;
        }
    }
    if (BUTTON_HELD(BUTTON_UP) 
    	    && (player3.row + player3.height - 1 <= 256) && (player3.row > 0) && (player3.col < 256) && (player3.col >= 0)
        	&& (collisionmap3Bitmap[OFFSET(player3.row - 1, player3.col, 256)])
        	&& (collisionmap3Bitmap[OFFSET(player3.row - 1, player3.col + player3.width - 1, 256)])
        	) {
    	player3.row -= player3.rdel;
    	player3.rDirection = -1;
    	player3.curState = PLAYERBACK;
    	if ((vOff > 0) && (player3.screenRow <= SCREENHEIGHT/2)) {
    		vOff--;
    	}
    }
    if (BUTTON_HELD(BUTTON_DOWN) 
    	    && (player3.row + player3.height - 1 < 256) && (player3.row >= 0) && (player3.col < 256) && (player3.col >= 0)
        	&& (collisionmap3Bitmap[OFFSET(player3.row + player3.height, player3.col, 256)])
        	&& (collisionmap3Bitmap[OFFSET(player3.row + player3.height, player3.col + player3.width - 1, 256)])) {
    	player3.row += player3.rdel;
        player3.rDirection = 1;
    	player3.curState = PLAYERFRONT;
        if ((vOff < 256-SCREENHEIGHT) && (player3.screenRow + player3.height-1 >= SCREENHEIGHT/2)) {
        	vOff++;
        }
    }
        	
	else {
        player3.cDirection = 0;
        player3.rDirection = 0;
    }
    player3.screenRow = player3.row - vOff;
    player3.screenCol = player3.col - hOff;

	// Fire bullets
	if (BUTTON_PRESSED(BUTTON_A) && player3.bulletTimer >= 13) {

		playSoundB(shoot, SHOOTLEN, SHOOTFREQ, 0);
		fireBullet3();
		player3.bulletTimer = 0;

	}

	player3.bulletTimer++;

	animatePlayer3();
}

// Player sprite animations
void animatePlayer3() {

    // Set previous state to current state
    player3.prevState = player3.curState;

    
    // Control movement and change animation state
    if(BUTTON_HELD(BUTTON_UP)) {
        player3.curState = PLAYERBACK;
        if(player3.aniCounter % 20 == 0) {
        	player3.curFrame = (player3.curFrame + 1) % 2;
        }
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        player3.curState = PLAYERFRONT;
        if(player3.aniCounter % 20 == 0) {
        	player3.curFrame = (player3.curFrame + 1) % 2;
        }
    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        player3.curState = PLAYERLEFT;
        if(player3.aniCounter % 20 == 0) {
        	player3.curFrame = (player3.curFrame + 1) % 2;
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        player3.curState = PLAYERRIGHT;
        if(player3.aniCounter % 20 == 0) {
        	player3.curFrame = (player3.curFrame + 1) % 2;
        }
    }

    player3.aniCounter++;
}

// Draw the player
void drawPlayer3() {

	shadowOAM[0].attr0 = (player3.screenRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (player3.screenCol & COLMASK) | ATTR1_SMALL;

    if (player3.curState == PLAYERFRONT) {
    	shadowOAM[0].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(4*2, player3.curFrame*2);
    } else if (player3.curState == PLAYERBACK) {
    	shadowOAM[0].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(4*2, (player3.curFrame + 2)*2);
    } else if (player3.curState == PLAYERLEFT) {
    	shadowOAM[0].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(2*2, player3.curFrame*2);
    } else if (player3.curState == PLAYERRIGHT) {
    	shadowOAM[0].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(2*2, (player3.curFrame + 2)*2);
    }

}

// Initialize the pool of bullets
void initBullets3() {

	for (int i = 0; i < BULLETCOUNT; i++) {
		bullets3[i].height = 4; 
		bullets3[i].width = 4;
		bullets3[i].row = -bullets3[i].height;
		bullets3[i].col = 0;
		bullets3[i].rdel = 2;
		bullets3[i].cdel = 2;
		bullets3[i].active = 0;
		bullets3[i].dir = 0;
		bullets3[i].players = 1;
	}

	for (int j = 0; j < BULLETCOUNT; j++) {
		eBullets3[j].height = 4;
		eBullets3[j].width = 4;
		eBullets3[j].row = -eBullets3[j].height;
		eBullets3[j].col = 0;
		eBullets3[j].rdel = 2;
		eBullets3[j].cdel = 2;
		eBullets3[j].active = 0;
		eBullets3[j].dir = 0;
		eBullets3[j].players = 0;
	}
}

// Spawn a bullet
void fireBullet3() {

	// Find the first inactive bullet
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (!bullets3[i].active) {

			// Position the new bullet
			if (player3.curState == PLAYERFRONT) {
				bullets3[i].row = player3.screenRow + player3.height - 1;
			    bullets3[i].col = player3.screenCol + (player3.width/2) - 5;
			    bullets3[i].dir = 0;
			} else if (player3.curState == PLAYERLEFT) {
				bullets3[i].row = player3.screenRow + (player3.height/2) - 5;
			    bullets3[i].col = player3.screenCol + (player3.width/2) - 5;
			    bullets3[i].dir = 1;
			} else if (player3.curState == PLAYERRIGHT) {
				bullets3[i].row = player3.screenRow + (player3.height/2) - 5;
			    bullets3[i].col = player3.screenCol + (player3.width/2) - 5;
			    bullets3[i].dir = 2;
			} else if (player3.curState == PLAYERBACK) {
				bullets3[i].row = player3.screenRow;
			    bullets3[i].col = player3.screenCol + (player3.width/2) - 5;
			    bullets3[i].dir = 3;
			}

			// Take the bullet out of the pool
			bullets3[i].active = 1;
		}
		// Break out of the loop
		break;
	}
}

// Spawn enemy bullet
void fireEBullet3() {

	// Find the first inactive bullet
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (!eBullets3[i].active) {

			// Position the new bullet
			eBullets3[i].row = enemyL3[0].row;
			eBullets3[i].col = enemyL3[0].col;

			// Take the bullet out of the pool
			eBullets3[i].active = 1;
		}
		// Break out of the loop
		break;
	}
}

// Handle every-frame actions of a bullet
void updateBullet3(BULLET3* b) {

	// If active and player's bullet, update; otherwise ignore
	if (b->active && b->players) {
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
	
	// If active and enemy's bullet, update; otherwise ignore
	} else if (b->active && (!b->players)) {
		if (b->row + b->height > 0) {
			b->row -= b->rdel;

			// Handle eBullet-player collisions
			if (collision(player3.screenRow, player3.screenCol, player3.height, player3.width,
				b->row-vOff, b->col-hOff, b->height, b->width)) {
				// Put bullet back in the pool
				b->active = 0;
			    shadowOAM[120].attr0 = ATTR0_HIDE;
			    if (cheat3 == 0) {
			        hits3 += 2;
			        playSoundB(playerhit, PLAYERHITLEN, PLAYERHITFREQ, 0);
			        if (hits3 == 4) {
			    	    tooClose3 = 1;
			        }
			    }
			}
		} else {
			b->active = 0;
			shadowOAM[120].attr0 = ATTR0_HIDE;
		}
	} 
}

// Draw a bullet
void drawBullet3(BULLET3* b) {

	if(b->active && b->players) {
		shadowOAM[1].attr0 = (b->row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[1].attr1 = (b->col & COLMASK) | ATTR1_SMALL;
		shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1*2, 2*2);
	} else if(b->active && (!b->players)) {
		shadowOAM[120].attr0 = ((b->row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[120].attr1 = ((b->col - hOff) & COLMASK) | ATTR1_SMALL;
		shadowOAM[120].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(3*2, 3*2);
	}
}

// Initialize the enemies
void initEnemy3() {
	enemyL3[0].row = 160;
	enemyL3[0].col = 120;
	enemyL3[0].cdel = 1;
	enemyL3[0].height = 16;
	enemyL3[0].width = 16;
	enemyL3[0].bulletTimer = 20;
	enemyL3[0].cDirection = 0;
	enemyL3[0].active = 1;
	enemyL3[0].isLastRow = 0;
	enemyL3[0].aniCounter = 0;
	enemyL3[0].curFrame = 0;
	enemyL3[0].numFrames = 2;

}

// Handle every-frame actions of the enemy
void updateEnemy3(ENEMY3* b) {

	if (b->active) {

		// Bounce the enemy off the sides of the walls
		if (((collisionmap3Bitmap[OFFSET(b->row, b->col + b->width, 256)]) && (collisionmap3Bitmap[OFFSET(b->row + b->height - 1, b->col + b->width, 256)]))) {
			b->cdel *= -1;
		}
		if (((collisionmap3Bitmap[OFFSET(b->row, b->col - 1, 256)]) && (collisionmap3Bitmap[OFFSET(b->row + b->height - 1, b->col - 1, 256)]))) {
			b->cdel *= -1;
		}

		// Move the enemy sideways
		b->col += b->cdel;

		// Handle enemy-bullet collisions
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (bullets3[i].active && collision(b->row-vOff, b->col-hOff, b->height, b->width,
				bullets3[i].row, bullets3[i].col, bullets3[i].height, bullets3[i].width)) {

				// Put bullet and enemy back in the pool
				bullets3[i].active = 0;
			    shadowOAM[1].attr0 = ATTR0_HIDE;
				b->active = 0;

			}
		}

		// Handle enemy-player collision
		if (collision(b->row, b->col, b->height, b->width, player3.row, player3.col, player3.height, player3.width)) {
			if (cheat3 == 0) {
				hits3++;
			    if (hits3 == 4) {
				    tooClose3 = 1;
			    }
			}

			if (b->col < player3.col) {
				player3.col += 4;
			} else if (b->col > player3.col) {
				player3.col -= 4;
			} else if (b->row < player3.row) {
				player3.row += 4;
			} else if (b->row > player3.row) {
				player3.row -= 4;
			}
	    }

	    // Sprite alternation and firing bullets from enemy to player
		b->aniCounter++;
		if(b->aniCounter % 20 == 0) {
			b->curFrame++;
			b->curFrame = b->curFrame % b->numFrames;
			fireEBullet3();
		}
	}
}

// Draw enemy
void drawEnemyL3(ENEMY3* b, int i) {
	if(b->active) {
		shadowOAM[i].attr0 = ((b->row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[i].attr1 = ((b->col - hOff) & COLMASK) | ATTR1_SMALL;
		shadowOAM[i].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(1*2, b->curFrame * 2);
	} else {
		shadowOAM[i].attr0 = ATTR0_HIDE;
	}
}

// Initialize items in first level
void initItem3() {
	key3.row = 75;
	key3.col = 62;
	key3.height = 11;
	key3.width = 11;
	key3.active = 1;
}

// Update item
void updateItem3() {
	if (key3.active) {
		// Item-Player collision handling
		if (collision(key3.row, key3.col, key3.height, key3.width, player3.row, player3.col, player3.height, player3.width)) {

				// Inactivate & hide item
				key3.active = 0;
			    shadowOAM[2].attr0 = ATTR0_HIDE;

				// Update the number of keys
				numOfKeys++;
				player3.hasKey = 2;

		}
	}
}


// Draw item
void drawItem3() {
	if(key3.active) {
		shadowOAM[2].attr0 = ((key3.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[2].attr1 = ((key3.col - hOff) & COLMASK) | ATTR1_SMALL;
		shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1*2, 3*2);
	} else {
		shadowOAM[2].attr0 = ATTR0_HIDE;
	}

}

// Init stairs for level 1
void initStair3() {
	stair3.row = 93;
	stair3.col = 120;
	stair3.height = 16;
	stair3.width = 16;
	stair3.active = 1;
}


// Update stairs
void updateStair3() {
	if (stair3.active) {
		// Stair-Player collision handling
		if (collision(stair3.row, stair3.col, stair3.height, stair3.width, player3.row, player3.col, player3.height, player3.width) && player3.hasKey) {

				// Inactivate & hide stairs
				stair3.active = 0;
			    shadowOAM[3].attr0 = ATTR0_HIDE;

				// Update game level
				gameGameLevel3 = 3;



		}
	}
}

// Draw stairs
void drawStair3() {
	if(stair3.active) {
		shadowOAM[3].attr0 = ((stair3.row - vOff) & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[3].attr1 = ((stair3.col - hOff) & COLMASK) | ATTR1_SMALL;
		shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(5*2, 0);
	} else {
		shadowOAM[3].attr0 = ATTR0_HIDE;
	}

}

// Reset game level after start state so you start at level 1 after restarting
void resetGameLevel3() {
	gameGameLevel3 = 0;
}

// Reset health
void resetHealth3() {
	tooClose3 = 0;
	hits3 = 0;
}

// Turn on/off cheat, making you invincible
void cheatToggle3() {
	if (cheat3) {
		cheat3 = 0;
	} else {
		cheat3 = 1;
	}
}
int getCheat3() {
	return cheat3;
}
void resetCheat3() {
	cheat3 = 0;
}

