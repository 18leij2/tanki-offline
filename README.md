# Tanki Offline

This is a submission for the CS2261 homework assignment. It is a single player game that takes inspiration from classic top-down tank shooters, where the player controls a tank to take down all the enemies. This project further explores the depths and limitations of the Mode 3 bitmap mode on the GBA. Further details on the game mechanics, controls, and game summary can be found [here](./HW03%20Scaffold/README.md).

## Project Setup
This game was developed for the GBA. To run the game on a Mac or Windows device, the [mGBA emulator](https://mgba.io/) must first be installed. Then, download or clone the repository. Open the emulator, select `File > Load ROM`, and open the `HW03_LeiJason.zip` file. Alternatively, opening the `Project.gba` file in the `HW03 Scaffold` folder through the emulator will also work.

To access and edit the project on Windows, the mGBA emulator and Visual Studio Code must first be installed. Then, install and set up the [Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/install). Additionally, install [Docker Desktop](https://www.docker.com/products/docker-desktop/). In the main project folder, locate the `.vscode` folder, then find the `tasks.json` file and edit line 15 to the correct file path of the installed GBA emulator. Finally, while Docker Desktop is running, open the Scaffold folder in Visual Studio Code, open the `main.c` file, and hit `ctrl`+`shift`+`b` to build and run the project.
