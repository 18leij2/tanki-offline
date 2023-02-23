#include "gba.h"
#include "game.h"
#include "print.h"
#include <stdlib.h>
#include <stdio.h>
#include "sound.h"

void initialize();
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

unsigned short oldButtons;
unsigned short buttons;

char buffer[41];

enum {
    START,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

int rSeed;

int main() {
    mgba_open();
    mgba_printf("Debug log initialized!");

    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        switch (state) {
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
    }
}

void initialize() {
    REG_DISPCTL = MODE(3) | BG_ENABLE(2);

    REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_L = DMG_VOL_LEFT(5) |
                   DMG_VOL_RIGHT(5) |
                   DMG_SND1_LEFT |
                   DMG_SND1_RIGHT |
                   DMG_SND2_LEFT |
                   DMG_SND2_RIGHT |
                   DMG_SND3_LEFT |
                   DMG_SND3_RIGHT |
                   DMG_SND4_LEFT |
                   DMG_SND4_RIGHT;
    REG_SOUNDCNT_H = DMG_MASTER_VOL(2);

    buttons = REG_BUTTONS;
    oldButtons = 0;

    goToStart();
}

void goToStart() {
    fillScreen(GRAY);

    drawString(80, 75, "Tanki Offline", GREEN);
    drawString(59, 90, "Press Enter to Start", GREEN);
    state = START;
    rSeed = 0;
}

void start() {
    rSeed++;
    // random seed provided each run
    waitForVBlank();
    drawStart();
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(rSeed);
        goToGame();
        initGame();
    }
}

void goToGame() {
    fillScreen(GRAY);
    drawRect(0, 0, SCREENWIDTH, 18, BLACK);
    drawChar(116, 5, '0', WHITE);
    state = GAME;
}

void game() {
    // score buffer is updated everytime and displayed on the top middle
    updateGame();
    sprintf(buffer, "%d", score);
    waitForVBlank();
    drawRect(116, 5, 12, 8, BLACK);
    drawString(116, 5, buffer, WHITE);

    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    if (score == 5) {
        goToWin();
    }

    if (lives == 0) {
        goToLose();
    }
}

void goToPause() {
    drawString(200, 5, "PAUSED", YELLOW);
    state = PAUSE;
}

void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        drawRect(200, 5, 36, 8, BLACK);
        state = GAME;
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToWin() {
    fillScreen(GRAY);
    drawString(95, 75, "YOU WON!", GREEN);
    drawString(47, 90, "You slayed all 5 enemies", GREEN);
    state = WIN;
}

void win() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToLose() {
    fillScreen(GRAY);
    drawString(86, 75, "YOU LOSE...", RED);
    drawString(45, 90, "You slayed only   enemies", RED);
    drawString(140, 90, buffer, RED);
    state = LOSE;
}

void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}