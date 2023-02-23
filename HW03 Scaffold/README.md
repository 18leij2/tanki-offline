# Tanki Offline
## Summary
You find yourself the commander of a lone tank unit amidst an alien attack! Use your movement to maneuver through their swift attacks, then fire precise tank shells to deliver a devastating blow! These alien ships may be advanced, but it's nothing good ol' firepower can't handle!

## Controls and Navigation
- Press the corresponding `START` key to begin the game.
- Pressing `START` while in-game will pause the game. Press `START` again while in this phase to resume, or `SELECT` to return to menu.
- Pressing `START` while in the win or lose screen will return you to the main menu.
- Use the corresponding `LEFT`, `RIGHT`, `UP`, and `DOWN` keys to move the tank!
- Press the `A` button anytime to fire a tank shell!

## Tips
1. You only have 3 lives! Each time an alien ship hits you, you lose a life, as indicated by the tank icons on the top left. So do your best to protect your tank!
2. You can only fire one tank shell at a time - conveniently, it takes your tank unit the same amount of time to reload a new shell as it does for the previously fired shell to make contact with a wall or enemy. (This is just a fancy way of saying you can only have one tank shell on the screen at once).
3. The tank will automatically aim at the direction you last moved in. Be careful when lining up your shots, lest you accidentally run head first into an alien ship!
4. Be especially careful of the **magenta colored ships**! Intel suggests they are the elite crew - they move faster and more aggressively than their other colored counterparts!
5. You may notice an artificial fog of war patrolling the map - otherwise known as **The Black Shroud**. All we know is that this shroud was brought in by the alien forces - it moves and covers an area, blocking vision of almost everything and providing cover for the enemy ships! It also has signal jammers that prevent your unit from firing any shells while in it. We understand on top of moving, it also erratically teleports around the map occasionally, but it would be most advisable to stay out of this shroud as much as possible.
6. You may also see a fast, moving green collectible! Pick it up to evolve your tank into **Platinum Tank**. In Platinum Tank mode, you bypass any previous tank limitations, moving faster and enabling *light speed reload times*. In short, you can now fire rapidly, so spam away! (Do note that **Platinum Tank** is still affected by **The Black Shroud**. Also note that **Platinum Tank** turns your tank golden, as opposed to platinum colored).
7. You win when you defeat all 5 alien ships! You lose when you lose all 3 lives.

---

## No-nonsense Section for the TAs
For ease of grading, I have provided the feature requirements as listed below:
1. At least 2 structs: Player struct, Enemy struct, Bullet struct
2. At least 1 array: Enemy array, Bullet array
3. At least 1 use of DMA: fillScreen() and drawRect() both use DMA
4. Object pooling: Enemy and Bullet arrays are cycled to activate and deactivate
5. State machine: Menu screen, game screen, pause screen, and win/lose screen are included
6. Navigating the state machine: Each state has a specific way to reach that state
7. At least 2 moving objects: Player, Bullet, Enemy, Special Area (The Black Shroud)
8. Collisions that matter: Player will lose life when colliding with Enemy, Enemy will be destroyed when colliding with Bullet
9. At least 4 buttons used for input: `A`, `START`, `SELECT`, `UP`, `DOWN`, `LEFT`, `RIGHT` buttons used
10. At least 2 different analogue sounds: Enemy destruction sound, Player hit sound, Bullet fired sound, Powerup pickup sound
11. A README.md file: You're reading it right now!
12. Minimal amount of flicker: There is minimal flicker
13. A powerup that can be collected by the player: The green powerup gives unlimited rapid shots and provides a speed boost
14. A change in player appearance: The tank turns golden when it picks up the powerup to signify the powerup
15. Special area where the player is inhibited: The black shroud that moves around the map and sometimes teleports to a new location, which takes away the player's ability to shoot while inside
16. At least 5 .c files: main.c, gba.c, font.c, print.c, game.c
17. At least 4 .h files: gba.h, font.h, print.h, game.h, sound.h
18. Good organization: Code is sorted based on the .c and .h categories
19. Meaningful comments: Code is commented where necessary to provide insight
