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
} PLAYER;

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
} BULLET;

// Enemy Struct
typedef struct {
	int row;
	int col;
	int cdel;
	int rdel;
	int sideways;
	int height;
	int width;
	int bulletTimer;
	int cDirection; // So the bullet knows which cdel to take
	int active;
	int aniCounter;
	int curFrame;
	int numFrames;
} ENEMY;

// Item Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	int active;
} ITEM;

// Stairs Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	int active;
} STAIR;


// Constants
#define BULLETCOUNT 5
#define ENEMYCOUNT 3

// Variables
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern ENEMY enemyL1[3];
extern ITEM key1;
extern STAIR stair1;

extern int enemyRemaining;
extern int tooClose;
extern int hOff;
extern int vOff;
extern int numOfKeys;
extern int gameGameLevel;
extern int hits;
extern int cheat;


// Prototypes
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void drawPlayer();
void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);
void initEnemy();
void updateEnemy(ENEMY *);
void drawEnemyL1(ENEMY *, int i);
void initItem();
void updateItem();
void drawItem();
void initStair();
void updateStair();
void drawStair();
void resetGameLevel();
void resetHealth();
void animatePlayer();
void cheatToggle();
int getCheat();
void resetCheat();

