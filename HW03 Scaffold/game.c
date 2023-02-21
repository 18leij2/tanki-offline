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
int time;
int lives;

// initialize
void initGame() {
    score = 0;

    initPlayer();
    initEnemies();
    initBullets();
    lives = player.lives;
}

void initPlayer() {
    player.x = 117;
    player.y = 130;
    player.oldX = player.x;
    player.oldY = player.y;
    player.xVelocity = 0;
    player.yVelocity = 0;
    player.height = 11;
    player.width = 11;
    player.lives = 3;
    player.direction = 0;
    player.color = TANKWHEEL;
}

void initEnemies() {
    for (int i; i < ENEMYCOUNT; i++) {
        enemies[i].x = 10 + (i * 30);
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
        bullets[i].y = 100;
        bullets[i].width = 15;
        bullets[i].height = 10;
        bullets[i].active = 0;
        bullets[i].color = RED;
    }
}

// update
void updateGame() {
    updatePlayer();
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (i < ENEMYCOUNT) {
            updateEnemies(&enemies[i]);
        }
        updateBullets(&bullets[i]);
    }
}

void updatePlayer() {
    if (BUTTON_HELD(BUTTON_LEFT) && (player.x - 1 > -1)) {
        player.x -= 1;
        player.direction = 6;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && (player.x + player.width < SCREENWIDTH)) {
        player.x += 1;
        player.direction = 2;
    }
    if (BUTTON_HELD(BUTTON_UP) && (player.y - 1 > 17)) {
        player.y -= 1;
        player.direction = 0;

        if (BUTTON_HELD(BUTTON_LEFT) && !BUTTON_HELD(BUTTON_RIGHT)) {
            player.direction = 7;
        } else if (BUTTON_HELD(BUTTON_RIGHT) && !BUTTON_HELD(BUTTON_LEFT)) {
            player.direction = 1;
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN) && (player.y + player.height < SCREENHEIGHT)) {
        player.y += 1;
        player.direction = 4;

        if (BUTTON_HELD(BUTTON_LEFT) && !BUTTON_HELD(BUTTON_RIGHT)) {
            player.direction = 5;
        } else if (BUTTON_HELD(BUTTON_RIGHT) && !BUTTON_HELD(BUTTON_LEFT)) {
            player.direction = 3;
        }
    }
    mgba_printf("%d", player.direction);
}

void updateEnemies(ENEMY* e) {
    if (e->active) {

    }
}

void updateBullets(BULLET* b) {
    if (b->active) {

    }
}

void drawStart() {
    if (time >= 40 && time < 80) {
        drawRect(59, 90, 120, 8, GRAY);
    } else if (time >= 80) {
        time = 0;
        drawString(59, 90, "Press Enter to Start", GREEN);
    }
    time++;
}

// draw
void drawGame() {
    drawLives();
    drawPlayer();
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (i < ENEMYCOUNT) {
            drawEnemies(&enemies[i]);
        }
        drawBullets(&bullets[i]);
    }
}

void drawPlayer() {
    drawRect(player.oldX, player.oldY, player.width, player.height, GRAY);
    drawRect(player.x, player.y, player.width, player.height, player.color);
    drawRect(player.x + 1, player.y + 1, 9, 9, TANKGREEN);
    drawRect(player.x + 3, player.y + 3, 5, 5, TANKLIGHTGREEN);
    switch (player.direction) {
        case 0:
            drawRect(player.x + 5, player.y, 1, 3, TANKLIGHTGREEN);
            break;
        case 1:
            setPixel(player.x + 10, player.y, TANKLIGHTGREEN);
            setPixel(player.x + 9, player.y + 1, TANKLIGHTGREEN);
            setPixel(player.x + 8, player.y + 2, TANKLIGHTGREEN);
            break;
        case 2:
            drawRect(player.x + 8, player.y + 5, 3, 1, TANKLIGHTGREEN);
            break;
        case 3:
            setPixel(player.x + 8, player.y + 8, TANKLIGHTGREEN);
            setPixel(player.x + 9, player.y + 9, TANKLIGHTGREEN);
            setPixel(player.x + 10, player.y + 10, TANKLIGHTGREEN);
            break;
        case 4:
            drawRect(player.x + 5, player.y + 8, 1, 3, TANKLIGHTGREEN);
            break;
        case 5:
            setPixel(player.x + 2, player.y + 8, TANKLIGHTGREEN);
            setPixel(player.x + 1, player.y + 9, TANKLIGHTGREEN);
            setPixel(player.x, player.y + 10, TANKLIGHTGREEN);
            break;
        case 6:
            drawRect(player.x, player.y + 5, 3, 1, TANKLIGHTGREEN);
            break;
        case 7:
            setPixel(player.x + 2, player.y + 2, TANKLIGHTGREEN);
            setPixel(player.x + 1, player.y + 1, TANKLIGHTGREEN);
            setPixel(player.x, player.y, TANKLIGHTGREEN);
            break;
    }
    player.oldX = player.x;
    player.oldY = player.y;
}

void drawEnemies(ENEMY* e) {
    if (e->active) {
        drawRect(e->x, e->y, e->width, e->height, e->color);
    } else if (!e->erased) {

    }
}

void drawBullets(BULLET* b) {
    if (b->active) {
        drawRect(b->x, b->y, b->width, b->height, b->color);
    } else if (!b->erased) {

    }
}

void drawLives() {
    for (int i = 0; i < lives; i++) {
        drawTankIcon(5 + (i * 18), 5);
    }
}

// icon is 13 x 8
void drawTankIcon(int x, int y) {
    drawRect(x + 3, y, 6, 3, TANKGREEN);
    drawRect(x + 9, y + 1, 4, 1, TANKGREEN);
    drawRect(x + 1, y + 3, 11, 1, TANKGREEN);
    setPixel(x, y + 4, TANKGREEN);
    setPixel(x + 12, y + 4, TANKGREEN);
    drawRect(x + 1, y + 4, 11, 1, TANKWHEEL);
    drawRect(x, y + 5, 13, 2, TANKWHEEL);
    drawRect(x + 1, y + 7, 11, 1, TANKWHEEL);
    setPixel(x + 1, y + 5, TANKLIGHTWHEEL);
    setPixel(x + 3, y + 5, TANKLIGHTWHEEL);
    setPixel(x + 5, y + 5, TANKLIGHTWHEEL);
    setPixel(x + 7, y + 5, TANKLIGHTWHEEL);
    setPixel(x + 9, y + 5, TANKLIGHTWHEEL);
    setPixel(x + 11, y + 5, TANKLIGHTWHEEL);
    setPixel(x + 2, y + 6, TANKLIGHTWHEEL);
    setPixel(x + 4, y + 6, TANKLIGHTWHEEL);
    setPixel(x + 6, y + 6, TANKLIGHTWHEEL);
    setPixel(x + 8, y + 6, TANKLIGHTWHEEL);
    setPixel(x + 10, y + 6, TANKLIGHTWHEEL);
}

