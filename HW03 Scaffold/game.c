#include "gba.h"
#include "game.h"
#include <stdlib.h>

// structs on the screen
PLAYER player;
BULLET bullets[BULLETCOUNT];
ENEMY enemies[ENEMYCOUNT];

// score
int score;
int spawned;

// initialize game
void initGame() {
    score = 0;

    // initializing structs
    initPlayer();
    initEnemies();
    initBullets();
}

// initialize player
void initPlayer() {
    player.x = 117;
    player.y = 154;
    player.oldX = player.x;
    player.oldY = player.y;
    player.xVelocity = 0;
    player.yVelocity = 0;
    player.height = 10;
    player.width = 10;
    player.color = CYAN;
}

void initEnemies() {
    for (int i; i < ENEMYCOUNT; i++) {
        enemies[i].x = 10 + (i * 15);
        enemies[i].y = 30;
        enemies[i].width = 15;
        enemies[i].height = 10;
        enemies[i].active = 1;

        int colorPicker = rand() % 3;
        switch (colorPicker) {
            case 0:
                enemies[i].color = GREEN;
                break;
            case 1:
                enemies[i].color = RED;
                break;
            case 2:
                enemies[i].color = YELLOW;
                break;
        }
    }
}

void initBullets() {
    for (int i; i < BULLETCOUNT; i++) {
        bullets[i].x = 10 + (i * 15);
        bullets[i].y = 30;
        bullets[i].width = 15;
        bullets[i].height = 10;
        bullets[i].active = 1;
        bullets[i].color = RED;
    }
}