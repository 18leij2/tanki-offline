// structs

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int xVelocity;
    int yVelocity;
    int width;
    int height;
    int lives;
    int iframes;
    int direction;
    int fired;
    int powered;
    int speed;
    unsigned short color;
} PLAYER;

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int xVelocity;
    int yVelocity;
    int width;
    int height;
    int fired;
    unsigned short color;
    int active;
    int erased;
} ENEMY;

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int xVelocity;
    int yVelocity;
    int width;
    int height;
    int direction;
    int speed;
    int playerBullet;
    unsigned short color;
    int active;
    int erased;
} BULLET;

// constants
#define ENEMYCOUNT 5
#define BULLETCOUNT 10

// variables;
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern ENEMY enemies[ENEMYCOUNT];
extern int score;
extern int time;
extern int lives;

// function prototypes
void initGame();
void initPlayer();
void initBullets();
void initEnemies();
void updateGame();
void updatePlayer();
void updateEnemies(ENEMY* e);
void updateBullets(BULLET* b);
void drawStart();
void drawGame();
void drawPlayer();
void drawEnemies(ENEMY* e);
void drawBullets(BULLET* b);
void drawLives();
void drawTankIcon();
void newBullet();