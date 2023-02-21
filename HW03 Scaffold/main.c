#include "gba.h"
#include "game.h"
#include "print.h"
#include <stdlib.h>
#include <stdio.h>

unsigned short oldButtons;
unsigned short buttons;

int test = 0;

int main() {
    REG_DISPCTL = MODE(3) | BG_ENABLE(2);

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        if (test = 0) {
            initGame();
            test = 1;
        }
    }
}