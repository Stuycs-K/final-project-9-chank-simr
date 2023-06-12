# APCS Final Project
## Group Info
Group Name: Nintendo Interns
Group Members: Kevin Chan and Randy Sim
AP Computer Science Period 9
Project: Pokémon
## Overview
We have recreated Pokémon in processing.
Our main focus was on creating a movable player, map/setting with obstacles, NPCs, and Pokémon battles.
After we completed the fundamental parts of the game, we continued implementing more features, such as a menu button, an item bag, and a shop
where users can buy more items. We also created wild Pokemon and the ability to catch Pokemon with Pokeball items.
The Pokemon button within Menu was created so that the user can check their current Pokemon.
Our demo game features mechanics such as:

- Walking around a 2D Map
- Interacting with an NPC
- Pokémon battles against an NPC
- Pokémon battles against wild Pokémon (including ability to fight and catch them, as well as to run away)
- A Menu, which contain's the player's item bag and a display of the player's current Pokemon.
- A shop to purchase more items
- Potions to heal your pokemon.

We created a Game Manager, GameStates (default, battle, menu), UI system, player and NPC classes, and Pokémon. Many of our classes inherit from a "Monobehaviour" class which gives our child classes access to processing functions.
We also have parent classes such as "UI" for UI objects (dialogue boxes, buttons, healthbars).
## Instructions
- Click on the game window in order to focus the screen.
### Movement
- Use the WASD keys to move the player. There is an invisible border around the map.
### Dialogue
- Press 'Space Bar' to go through any dialogue. The player will not  be able to move or click on anything during this time.
### Battles
- click on the "Start Battle" button in the top left in order to simulate a battle.
- a battle will not begin if either party's Pokémon is all dead. It will instead display a dialogue.
- once in battle, 3 battle options will appear, "Fight", "Catch", "Run". You can run from any battle at any time. You can only catch wild pokemon. You need to buy pokéballs first to catch pokemon (go to the "Shop" section). To use moves, press "Fight". There will be four moves you can use.
- The battle ends once either party's Pokémon are all dead.
#### NPC Battles
- Walk up to the NPC and make sure the player is looking at it. Then press 'E' to interact with the NPCs.
- Press 'Space Bar' to move to next dialogue.
- a battle may occur. Once you beat an NPC, you can't battle it again.
#### Wild Battles
- Walk into the wild grass near the player's spawn position. There will be an 8% chance of a random wild Pokémon for every step (you may need to walk for a bit).
- To catch the Pokémon, you need pokéballs. Then press catch and it will join your party. You can only have 6 Pokémon in your party.
### Menu
- On the top left, click on the menu. A drop down should appear with "Shop", "Pokémon", "Bag", "Exit".
- The map and the player should disappear as you are now in the MenuGameState.
- Click on the "Exit" button to exit the menu.
#### Shop
- Click on the "Shop" button to enter the shop
- You start off with $1000.
- Click on any item to buy it. The prices are listed on the right side of the name.
- Click the "Exit" button to leave the shop.
#### Pokémon
- Click on the "Pokemon" button to view your pokemon. It will display their name, sprite, and health.
- Click on the Pokémon to view their stats.
- Click "Exit" to exit out of the stat page.
#### Bag
- Click on the "Bag" button to view your bag. This will give an overview of the amount of items the player has.
- Click on one of the potions to use it on a Pokémon. You will be prompted with a dialogue with the description. Press space bar to skip it.  Then click on a Pokémon you want to heal. You may only heal Pokémon that are not full hp. Potions will also revive Pokémon with 0 hp. A Pokemon's current hp cannot go beyond their max hp.
- Click "Exit" to exit out of the bag.
