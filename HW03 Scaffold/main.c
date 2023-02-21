#include "gba.h"
#include "game.h"
#include "print.h"
#include <stdlib.h>
#include <stdio.h>

void initialize();
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();

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
                break;
            case LOSE:
                break;
        }
    }
}

void initialize() {
    REG_DISPCTL = MODE(3) | BG_ENABLE(2);

    // SOUND STUFF HERE FOR LATER

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
    updateGame();
    sprintf(buffer, "%d", score);
    waitForVBlank();
    drawString(116, 5, buffer, WHITE);

    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
}

void goToPause() {
    drawString(200, 5, "PAUSED", YELLOW);
    state = PAUSE;
}

void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        state = GAME;
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}