#include "gba.h"
#include "game.h"
#include <stdlib.h>

// structs on the screen
PLAYER player;
BULLET bullets[BULLETCOUNT];
ENEMY enemies[ENEMYCOUNT];

// score
int score;
int time;
int damageTime;
int lives;

int powerupX, powerupY, powerupOldX, powerupOldY, powerupWidth, powerupHeight, powerupXVelocity, powerupYVelocity;

// initialize
void initGame() {
    score = 0;

    initPlayer();
    initEnemies();
    initBullets();
    lives = player.lives;

    powerupX = 120;
    powerupY = 120;
    powerupOldX = powerupX;
    powerupOldY = powerupY;
    powerupWidth = 3;
    powerupHeight = 3;
    powerupXVelocity = 4;
    powerupYVelocity = 4;
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
    player.iframes = 0;
    player.direction = 0;
    player.fired = 0;
    player.powered = 0;
    player.speed = 1;
    player.color = TANKWHEEL;
}

void initEnemies() {
    for (int i; i < ENEMYCOUNT; i++) {
        enemies[i].x = 10 + (i * 30);
        enemies[i].y = 30;
        enemies[i].oldX = enemies[i].x;
        enemies[i].oldY = enemies[i].y;
        enemies[i].width = 15;
        enemies[i].height = 10;
        enemies[i].active = 1;
        enemies[i].fired = 0;

        int colorPicker = rand() % 4;
        switch (colorPicker) {
            case 0:
                enemies[i].color = BLUE;
                enemies[i].xVelocity = 1;
                enemies[i].yVelocity = 1;
                break;
            case 1:
                enemies[i].color = RED;
                enemies[i].xVelocity = -1;
                enemies[i].yVelocity = -1;
                break;
            case 2:
                enemies[i].color = YELLOW;
                enemies[i].xVelocity = 1;
                enemies[i].yVelocity = -1;
                break;
            case 3:
                enemies[i].color = MAGENTA;
                enemies[i].xVelocity = -2;
                enemies[i].yVelocity = 2;
        }
    }
}

void initBullets() {
    for (int i; i < BULLETCOUNT; i++) {
        bullets[i].x = 10 + (i * 15);
        bullets[i].y = 100;
        bullets[i].oldX = bullets[i].x;
        bullets[i].oldY = bullets[i].y;
        bullets[i].width = 3;
        bullets[i].height = 3;
        bullets[i].active = 0;
        bullets[i].direction = 0;
        bullets[i].speed = 3;
        bullets[i].playerBullet = 0;
        bullets[i].color = TANKWHEEL;
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

    powerupX += powerupXVelocity;
    powerupY += powerupYVelocity;

    if (powerupY < 18) {
        powerupY += 18 - powerupY;
        powerupYVelocity = -powerupYVelocity;
    }
    if (powerupY + powerupHeight - 1 > 159) {
        powerupY -= (powerupY + powerupHeight - 1) - 159;
        powerupYVelocity = -powerupYVelocity;
    }
    if (powerupX < 0) {
        powerupX = -powerupX;
        powerupXVelocity = -powerupXVelocity;
    }
    if (powerupX + powerupWidth - 1 > 239) {
        powerupX -= (powerupX + powerupWidth - 1) - 239;
        powerupXVelocity = -powerupXVelocity;
    }
}

void updatePlayer() {
    if (player.iframes) {
        if (damageTime >= 80) {
            damageTime = 0;
            player.iframes = 0;
        } else {
            damageTime++;
        }
    }

    if (collision(player.x, player.y, player.width, player.height, powerupX, powerupY, powerupWidth, powerupHeight)) {
        player.powered = 1;
        player.speed = 2;
    }

    if (BUTTON_HELD(BUTTON_LEFT) && (player.x - player.speed > -1)) {
        player.x -= player.speed;
        player.direction = 6;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && (player.x + player.width < SCREENWIDTH)) {
        player.x += player.speed;
        player.direction = 2;
    }
    if (BUTTON_HELD(BUTTON_UP) && (player.y - player.speed > 17)) {
        player.y -= player.speed;
        player.direction = 0;

        if (BUTTON_HELD(BUTTON_LEFT) && !BUTTON_HELD(BUTTON_RIGHT)) {
            player.direction = 7;
        } else if (BUTTON_HELD(BUTTON_RIGHT) && !BUTTON_HELD(BUTTON_LEFT)) {
            player.direction = 1;
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN) && (player.y + player.height < SCREENHEIGHT)) {
        player.y += player.speed;
        player.direction = 4;

        if (BUTTON_HELD(BUTTON_LEFT) && !BUTTON_HELD(BUTTON_RIGHT)) {
            player.direction = 5;
        } else if (BUTTON_HELD(BUTTON_RIGHT) && !BUTTON_HELD(BUTTON_LEFT)) {
            player.direction = 3;
        }
    }

    if (BUTTON_PRESSED(BUTTON_A) && player.fired == 0) {
        player.fired = 1;
        newBullet(0);
    }
}

void updateEnemies(ENEMY* e) {
    if (e->active) {
        if (collision(e->x, e->y, e->width, e->height, player.x, player.y, player.width, player.height)) {
            if (!player.iframes) {
                player.iframes = 1;
                player.lives -= 1;
                lives = player.lives;
            } 
        }
        e->x += e->xVelocity;
        e->y += e->yVelocity;

        if (e->y < 18) {
            e->y += 18 - e->y;
            e->yVelocity = -e->yVelocity;
        }
        if (e->y + e->height - 1 > 159) {
            e->y -= (e->y + e->height - 1) - 159;
            e->yVelocity = -e->yVelocity;
        }
        if (e->x < 0) {
            e->x = -e->x;
            e->xVelocity = -e->xVelocity;
        }
        if (e->x + e->width - 1 > 239) {
            e->x -= (e->x + e->width - 1) - 239;
            e->xVelocity = -e->xVelocity;
        }
    }
}

void updateBullets(BULLET* b) {
    if (b->active) {
        for (int i = 0; i < ENEMYCOUNT; i++) {
            if (enemies[i].active) {
                if (collision(b->x, b->y, b->width, b->height, enemies[i].x, enemies[i].y, enemies[i].width, enemies[i].height)) {
                    if (b->playerBullet) {
                        score++;
                        enemies[i].active = 0;
                        enemies[i].erased = 0;
                        player.fired = 0;
                    }
                    b->active = 0;
                    b->erased = 0;
                }
            }
        }
        switch (b->direction) {
            case 0:
                if (b->y - b->speed < 18) {
                    b->active = 0;
                    if (b->playerBullet) {
                        player.fired = 0;
                    }
                } else {
                    b->y -= b->speed;
                }
                break;
            case 1:
                if (b->x + b->width - 1 + b->speed - 1 > 239 || b->y - b->speed - 1 < 18) {
                    b->active = 0;
                    if (b->playerBullet) {
                        player.fired = 0;
                    }
                } else {
                    b->y -= b->speed - 1;
                    b->x += b->speed - 1;
                }
                break;
            case 2:
                if (b->x + b->width - 1 + b->speed > 239) {
                    b->active = 0;
                    if (b->playerBullet) {
                        player.fired = 0;
                    }
                } else {
                    b->x += b->speed;
                }
                break;
            case 3:
                if (b->x + b->width - 1 + b->speed - 1 > 239 || b->y + b->height - 1 + b->speed - 1 > 159) {
                    b->active = 0;
                    if (b->playerBullet) {
                        player.fired = 0;
                    }
                } else {
                    b->x += b->speed - 1;
                    b->y += b->speed - 1;
                }
                break;
            case 4:
                if (b->y +b->height - 1 + b->speed > 159) {
                    b->active = 0;
                    if (b->playerBullet) {
                        player.fired = 0;
                    }
                } else {
                    b->y += b->speed;
                }
                break;
            case 5:
                if (b->x - b->speed - 1 < 0 || b->y + b->height - 1 + b->speed - 1 > 159) {
                    b->active = 0;
                    if (b->playerBullet) {
                        player.fired = 0;
                    }
                } else {
                    b->x -= b->speed - 1;
                    b->y += b->speed - 1;
                }
                break;
            case 6:
                if (b->x - b->speed < 0) {
                    b->active = 0;
                    if (b->playerBullet) {
                        player.fired = 0;
                    }
                } else {
                    b->x -= b->speed;
                }
                break;
            case 7:
                if (b->x - b->speed - 1 < 0 || b->y - b->speed - 1 < 18) {
                    b->active = 0;
                    if (b->playerBullet) {
                        player.fired = 0;
                    }
                } else {
                    b->x -= b->speed - 1;
                    b->y -= b->speed - 1;
                }
                break;
        }
    }
}

void newBullet(int firer) {
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (!bullets[i].active) {
            bullets[i].active = 1;
            bullets[i].erased = 0;
            bullets[i].direction = player.direction;
            if (!firer) {
                bullets[i].playerBullet = 1;
                switch (player.direction) {
                    case 0:
                        bullets[i].x = player.x + 4;
                        bullets[i].y = player.y - 3;
                        break;
                    case 1:
                        bullets[i].x = player.x + 10;
                        bullets[i].y = player.y - 2;
                        break;
                    case 2:
                        bullets[i].x = player.x + 11;
                        bullets[i].y = player.y + 4;
                        break;
                    case 3:
                        bullets[i].x = player.x + 10;
                        bullets[i].y = player.y + 10;
                        break;
                    case 4:
                        bullets[i].x = player.x + 4;
                        bullets[i].y = player.y + 11;
                        break;
                    case 5:
                        bullets[i].x = player.x - 2;
                        bullets[i].y = player.y + 10;
                        break;
                    case 6:
                        bullets[i].x = player.x - 3;
                        bullets[i].y = player.y + 4;
                        break;
                    case 7:
                        bullets[i].x = player.x - 2;
                        bullets[i].y = player.y - 2;
                        break;
                } 
            }
            break;
        }
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

    drawRect(powerupOldX, powerupOldY, powerupWidth, powerupHeight, GRAY);
    if (!player.powered) {
        drawRect(powerupX, powerupY, powerupWidth, powerupHeight, GREEN);
    }

    powerupOldX = powerupX;
    powerupOldY = powerupY;
}

void drawPlayer() {
    drawRect(player.oldX, player.oldY, player.width, player.height, GRAY);

    if (player.iframes && (damageTime % 10) >= 5) {

    } else {
        drawRect(player.x, player.y, player.width, player.height, player.color);
        drawRect(player.x + 1, player.y + 1, 9, 9, TANKGREEN);
        drawRect(player.x + 3, player.y + 3, 5, 5, TANKLIGHTGREEN);
        switch (player.direction) {
            case 0:
                drawRect(player.x + 5, player.y, 1, 3, TANKLIGHTGREEN);
                break;
            case 1:
                setPixel(player.x + 9, player.y + 1, TANKLIGHTGREEN);
                setPixel(player.x + 8, player.y + 2, TANKLIGHTGREEN);
                break;
            case 2:
                drawRect(player.x + 8, player.y + 5, 3, 1, TANKLIGHTGREEN);
                break;
            case 3:
                setPixel(player.x + 8, player.y + 8, TANKLIGHTGREEN);
                setPixel(player.x + 9, player.y + 9, TANKLIGHTGREEN);
                break;
            case 4:
                drawRect(player.x + 5, player.y + 8, 1, 3, TANKLIGHTGREEN);
                break;
            case 5:
                setPixel(player.x + 2, player.y + 8, TANKLIGHTGREEN);
                setPixel(player.x + 1, player.y + 9, TANKLIGHTGREEN);
                break;
            case 6:
                drawRect(player.x, player.y + 5, 3, 1, TANKLIGHTGREEN);
                break;
            case 7:
                setPixel(player.x + 2, player.y + 2, TANKLIGHTGREEN);
                setPixel(player.x + 1, player.y + 1, TANKLIGHTGREEN);
                break;
        }
    }
    
    player.oldX = player.x;
    player.oldY = player.y;
}

void drawEnemies(ENEMY* e) {
    if (e->active) {
        drawRect(e->oldX, e->oldY, e->width, e->height, GRAY);
        setPixel(e->x + 2, e->y, e->color);
        setPixel(e->x + 12, e->y, e->color);
        drawRect(e->x + 3, e->y + 1, 9, 4, e->color);
        setPixel(e->x + 2, e->y + 2, e->color);
        setPixel(e->x + 12, e->y + 2, e->color);
        drawRect(e->x + 1, e->y + 3, 2, 1, e->color);
        drawRect(e->x + 12, e->y + 3, 2, 1, e->color);
        drawRect(e->x, e->y + 4, 3, 1, e->color);
        drawRect(e->x + 12, e->y + 4, 3, 1, e->color);
        drawRect(e->x, e->y + 5, 6, 1, e->color);
        drawRect(e->x + 9, e->y + 5, 6, 1, e->color);
        drawRect(e->x + 1, e->y + 6, 4, 1, e->color);
        drawRect(e->x + 10, e->y + 6, 4, 1, e->color);
        drawRect(e->x + 2, e->y + 7, 2, 1, e->color);
        drawRect(e->x + 11, e->y + 7, 2, 1, e->color);
        drawRect(e->x + 3, e->y + 8, 2, 1, e->color);
        drawRect(e->x + 10, e->y + 8, 2, 1, e->color);
        drawRect(e->x + 4, e->y + 9, 2, 1, e->color);
        drawRect(e->x + 9, e->y + 9, 2, 1, e->color);
        drawRect(e->x + 6, e->y + 2, 3, 3, ENEMYORANGE);
        setPixel(e->x + 5, e->y + 2, ENEMYORANGE);
        setPixel(e->x + 9, e->y + 2, ENEMYORANGE);
        setPixel(e->x + 7, e->y + 5, ENEMYORANGE);
        drawRect(e->x + 6, e->y + 7, 3, 1, CYAN);
        setPixel(e->x + 7, e->y + 6, CYAN);
        setPixel(e->x + 7, e->y + 8, CYAN);
        e->oldX = e->x;
        e->oldY = e->y;
    } else if (!e->erased) {
        drawRect(e->x, e->y, e->width, e->height, GRAY);
        e->erased = 1;
    }
}

void drawBullets(BULLET* b) {
    if (b->active) {
        drawRect(b->oldX, b->oldY, b->width, b->height, GRAY);
        drawRect(b->x, b->y, b->width, b->height, b->color);
        b->oldX = b->x;
        b->oldY = b->y; 
    } else if (!b->erased) {
        drawRect(b->x, b->y, b->width, b->height, GRAY);
        b->erased = 1;
    }
}

void drawLives() {
    drawRect(5, 5, 59, 8, BLACK);
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

