// Player Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;
	int bulletTimer;
	int cDirection; // So the bullet knows which cdel to take
	int rDirection;
	int curState;
	int prevState;
	int curFrame;
	int screenRow;
	int screenCol;
	int hasKey;
	int aniCounter;
} PLAYER2;

// Bullet Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;
	int active;
	int dir;
	int players;    // If it's the player's bullet
	int screenRow;
	int screenCol;
} BULLET2;

// Enemy Struct
typedef struct {
	int row;
	int col;
	int cdel;
	int height;
	int width;
	int bulletTimer;
	int cDirection; // So the bullet knows which cdel to take
	int active;
	int isLastRow;  // So we know which enemies are on the last row
	int aniCounter;
	int curFrame;
	int numFrames;
	int screenRow;
	int screenCol;
} ENEMY2;

// Item Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	int active;
} ITEM2;

// Stairs Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	int active;
} STAIR2;

// Constants
#define BULLETCOUNT 5
#define ENEMYCOUNT 3

// Variables
extern PLAYER2 player2;
extern BULLET2 bullets2[BULLETCOUNT];
extern ENEMY2 enemyL2[5];
extern ITEM2 key2;
extern STAIR2 stair2;
extern BULLET2 eBullets2[BULLETCOUNT];

extern int enemyRemaining;
extern int tooClose2;
extern int hOff;
extern int vOff;
extern int numOfKeys;
extern int gameGameLevel2;
extern int hits2;
extern int cheat2;


// Prototypes
void initGame2();
void updateGame2();
void drawGame2();
void initPlayer2();
void updatePlayer2();
void drawPlayer2();
void initBullets2();
void fireBullet2();
void fireEBullet2();
void updateBullet2(BULLET2 *);
void drawBullet2(BULLET2 *);
void initEnemy2();
void updateEnemy2(ENEMY2 *);
void drawEnemyL2(ENEMY2 *, int i);
void initItem2();
void updateItem2();
void drawItem2();
void initStair2();
void updateStair2();
void drawStair2();
void resetGameLevel2();
void resetHealth2();
void animatePlayer2();
void cheatToggle2();
int getCheat2();
void resetCheat2();
