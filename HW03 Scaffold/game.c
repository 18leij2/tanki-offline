#include "gba.h"
#include "game.h"
#include <stdlib.h>
#include "sound.h"

// structs on the screen
PLAYER player;
BULLET bullets[BULLETCOUNT];
ENEMY enemies[ENEMYCOUNT];

// score
int score;
int time;
int damageTime;
int nullTime;
int lives;

int powerupX, powerupY, powerupOldX, powerupOldY, powerupWidth, powerupHeight, powerupXVelocity, powerupYVelocity;
int nullX, nullY, nullOldX, nullOldY, nullWidth, nullHeight, nullXVelocity, nullYVelocity;

unsigned short mainColor;
unsigned short accent;

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

    nullX = 180;
    nullY = 109;
    nullOldX = nullX;
    nullOldY = nullY;
    nullWidth = 50;
    nullHeight = 50;
    nullXVelocity = -1;
    nullYVelocity = -1;

    mainColor = TANKGREEN;
    accent = TANKLIGHTGREEN;
}

// initializes the player with the starting values
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

// initializes enemies with different positions, and chooses a random color to assign it to
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

// Initializes the bullet array that is to be used for object pooling
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

// update game
void updateGame() {
    updatePlayer();
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (i < ENEMYCOUNT) {
            updateEnemies(&enemies[i]);
        }
        updateBullets(&bullets[i]);
    }

    // Code for powerup boundary checking to ensure it stays within the bounds
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

    // code for the special area to ensure it stays within bounds
    nullX += nullXVelocity;
    nullY += nullYVelocity;

    if (nullY < 18) {
        nullY += 18 - nullY;
        nullYVelocity = -nullYVelocity;
    }
    if (nullY + nullHeight - 1 > 159) {
        nullY -= (nullY + nullHeight - 1) - 159;
        nullYVelocity = -nullYVelocity;
    }
    if (nullX < 0) {
        nullX = -nullX;
        nullXVelocity = -nullXVelocity;
    }
    if (nullX + nullWidth - 1 > 239) {
        nullX -= (nullX + nullWidth - 1) - 239;
        nullXVelocity = -nullXVelocity;
    }

    // special feature that makes the special area teleport to a new place every tiem interval
    if (nullTime >= 400) {
        nullTime = 0;
        nullX = rand() % 189;
        nullY = 18 + rand() % 101;
    }
    nullTime++;
}

// updating the player
void updatePlayer() {
    // if player has been hit, activate immunity-frames for a set time
    if (player.iframes) {
        if (damageTime >= 80) {
            damageTime = 0;
            player.iframes = 0;
        } else {
            damageTime++;
        }
    }

    // if player collects the power up, change their speed, appearance, abilities, and play a sound
    if (collision(player.x, player.y, player.width, player.height, powerupX, powerupY, powerupWidth, powerupHeight) && player.powered == 0) {
        player.powered = 1;
        player.speed = 2;

        mainColor = TANKGOLD;
        accent = TANKGOLDLIGHT;

        REG_SND2CNT = DMG_ENV_VOL(5) | DMG_STEP_TIME(6);
        REG_SND2FREQ = NOTE_C7 | SND_RESET;
    }

    // controls for moving the player, with a direction given to tell drawPlayer() how to draw the tank
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

        // layered checks to determine if diagonal or not
        if (BUTTON_HELD(BUTTON_LEFT) && !BUTTON_HELD(BUTTON_RIGHT)) {
            player.direction = 7;
        } else if (BUTTON_HELD(BUTTON_RIGHT) && !BUTTON_HELD(BUTTON_LEFT)) {
            player.direction = 1;
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN) && (player.y + player.height < SCREENHEIGHT)) {
        player.y += player.speed;
        player.direction = 4;

        // layered checks to determine if diagonal or not
        if (BUTTON_HELD(BUTTON_LEFT) && !BUTTON_HELD(BUTTON_RIGHT)) {
            player.direction = 5;
        } else if (BUTTON_HELD(BUTTON_RIGHT) && !BUTTON_HELD(BUTTON_LEFT)) {
            player.direction = 3;
        }
    }

    // checks for shooting input and makes sure player does not have a shot on screen, and that player is not in the special zone
    if (BUTTON_PRESSED(BUTTON_A) && player.fired == 0 && !collision(player.x, player.y, player.width, player.height, nullX, nullY, nullWidth, nullHeight)) {
        // if player does not have the powerup, game keeps track of bullet fired
        if (!player.powered) {
            player.fired = 1;
        }
        newBullet(0);

        // plays a bullet fired sound
        REG_SND2CNT = DMG_ENV_VOL(5) | DMG_STEP_TIME(2);
        REG_SND2FREQ = NOTE_D3 | SND_RESET;
    }
}

// update enemies
void updateEnemies(ENEMY* e) {
    if (e->active) {
        // if the enemy is active and has collided with player, activates the player immunity frames if not already
        if (collision(e->x, e->y, e->width, e->height, player.x, player.y, player.width, player.height)) {
            if (!player.iframes) {
                // player gains temporary invincibility but loses a life
                player.iframes = 1;
                player.lives -= 1;
                lives = player.lives;

                // plays a hit sound
                REG_SND2CNT = DMG_ENV_VOL(5) | DMG_STEP_TIME(6);
                REG_SND2FREQ = NOTE_A2 | SND_RESET;
            } 
        }

        // update the enemy position and check boundaries
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

// updates bullets
void updateBullets(BULLET* b) {
    // if the bullet is active, loop through all active enemies to check for a collision
    if (b->active) {
        for (int i = 0; i < ENEMYCOUNT; i++) {
            if (enemies[i].active) {
                // if there is a collision, both the enemy and the bullet are marked as erased, player score is increased
                if (collision(b->x, b->y, b->width, b->height, enemies[i].x, enemies[i].y, enemies[i].width, enemies[i].height)) {
                    if (b->playerBullet) {
                        score++;
                        enemies[i].active = 0;
                        enemies[i].erased = 0;
                        player.fired = 0;

                        // plays a sound when hit
                        REG_SND4CNT = DMG_ENV_VOL(5) | DMG_STEP_TIME(6);
                        REG_SND4FREQ = NOTE_C5 | SND_RESET;
                    }
                    b->active = 0;
                    b->erased = 0;
                }
            }
        }
        // switch case that updates the bullet trajectory and checks when it hits a bound
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

// activates the first inactive bullet, positions it based on players aiming state
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

// draw the menu, with the blinking start instruction
void drawStart() {
    if (time >= 40 && time < 80) {
        drawRect(59, 90, 120, 8, GRAY);
    } else if (time >= 80) {
        time = 0;
        drawString(59, 90, "Press Enter to Start", GREEN);
    }
    time++;
}

// draw game
void drawGame() {
    drawLives();
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (i < ENEMYCOUNT) {
            drawEnemies(&enemies[i]);
        }
        drawBullets(&bullets[i]);
    }

    // draw the powerup on the screen, and if already collected, don't draw
    drawRect(powerupOldX, powerupOldY, powerupWidth, powerupHeight, GRAY);
    if (!player.powered) {
        drawRect(powerupX, powerupY, powerupWidth, powerupHeight, GREEN);
    }

    // drawPlayer() is drawn last so they are above all else
    drawPlayer();

    // update old positions
    nullOldX = nullX;
    nullOldY = nullY;

    powerupOldX = powerupX;
    powerupOldY = powerupY;
}

void drawPlayer() {
    drawRect(player.oldX, player.oldY, player.width, player.height, GRAY);
    // drawing the special null zone after erasing the player, but before drawing the player, will ensure that
    // the player is drawn on top of the special zone, but also ensures that player erasing does not draw over the zone
    drawRect(nullOldX, nullOldY, nullWidth, nullHeight, GRAY);
    drawRect(nullX, nullY, nullWidth, nullHeight, TANKLIGHTWHEEL);

    // every 5 frames, don't draw the player, but every other 5 frames draw the player
    // this shows a blinking effect to indicate the invincibility duration
    if (player.iframes && (damageTime % 10) >= 5) {

    } else {
        drawRect(player.x, player.y, player.width, player.height, player.color);
        drawRect(player.x + 1, player.y + 1, 9, 9, mainColor);
        drawRect(player.x + 3, player.y + 3, 5, 5, accent);
        switch (player.direction) {
            case 0:
                drawRect(player.x + 5, player.y, 1, 3, accent);
                break;
            case 1:
                setPixel(player.x + 9, player.y + 1, accent);
                setPixel(player.x + 8, player.y + 2, accent);
                break;
            case 2:
                drawRect(player.x + 8, player.y + 5, 3, 1, accent);
                break;
            case 3:
                setPixel(player.x + 8, player.y + 8, accent);
                setPixel(player.x + 9, player.y + 9, accent);
                break;
            case 4:
                drawRect(player.x + 5, player.y + 8, 1, 3, accent);
                break;
            case 5:
                setPixel(player.x + 2, player.y + 8, accent);
                setPixel(player.x + 1, player.y + 9, accent);
                break;
            case 6:
                drawRect(player.x, player.y + 5, 3, 1, accent);
                break;
            case 7:
                setPixel(player.x + 2, player.y + 2, accent);
                setPixel(player.x + 1, player.y + 1, accent);
                break;
        }
    }
    
    player.oldX = player.x;
    player.oldY = player.y;
}

// draw enemy code
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
    // if enemy is not set as active but is not erased, erase and set erased
    } else if (!e->erased) {
        drawRect(e->oldX, e->oldY, e->width, e->height, GRAY);
        drawRect(e->x, e->y, e->width, e->height, GRAY);
        e->erased = 1;
    }
}

// draw bullets
void drawBullets(BULLET* b) {
    if (b->active) {
        drawRect(b->oldX, b->oldY, b->width, b->height, GRAY);
        drawRect(b->x, b->y, b->width, b->height, b->color);
        b->oldX = b->x;
        b->oldY = b->y; 
    } else if (!b->erased) {
        drawRect(b->oldX, b->oldY, b->width, b->height, GRAY);
        drawRect(b->x, b->y, b->width, b->height, GRAY);
        b->erased = 1;
    }
}

// draw lives on the top left
void drawLives() {
    drawRect(5, 5, 59, 8, BLACK);
    for (int i = 0; i < lives; i++) {
        drawTankIcon(5 + (i * 18), 5);
    }
}

// draw the tank lives icon, each icon is 13 x 8
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

