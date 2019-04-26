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
} PLAYER3;

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
} BULLET3;

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
} ENEMY3;

// Item Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	int active;
} ITEM3;

// Stairs Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	int active;
} STAIR3;

// Constants
#define BULLETCOUNT 5
#define ENEMYCOUNT 3

// Variables
extern PLAYER3 player3;
extern BULLET3 bullets3[BULLETCOUNT];
extern ENEMY3 enemyL3[5];
extern ITEM3 key3;
extern STAIR3 stair3;
extern BULLET3 eBullets3[BULLETCOUNT];

extern int enemyRemaining;
extern int tooClose3;
extern int hOff;
extern int vOff;
extern int numOfKeys;
extern int gameGameLevel3;
extern int hits3;
extern int cheat3;


// Prototypes
void initGame3();
void updateGame3();
void drawGame3();
void initPlayer3();
void updatePlayer3();
void drawPlayer3();
void initBullets3();
void fireBullet3();
void fireEBullet3();
void updateBullet3(BULLET3 *);
void drawBullet3(BULLET3 *);
void initEnemy3();
void updateEnemy3(ENEMY3 *);
void drawEnemyL3(ENEMY3 *, int i);
void initItem3();
void updateItem3();
void drawItem3();
void initStair3();
void updateStair3();
void drawStair3();
void resetGameLevel3();
void resetHealth3();
void animatePlayer3();
void cheatToggle3();
int getCheat3();
void resetCheat3();
