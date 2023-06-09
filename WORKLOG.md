# Work Log

## Randy Sim

### 5/22/2023

- created MonoBehaviour Class/gameObject manager
- setup core game engine structure
- setup sprite rendering structure

### 5/23/2023

- integrated UISystem with game engine.
- setup player class with basic movement (with walk delay)

### 5/24/2023

- better movement delay system.
- created timings based on frames rather than milliseconds.

### 5/25/2023

- fixed movement bug by creating custom Controller class
- created a camera vision update system
- created player centered movement
- created GameBoard class with tiles + collision
- created z-index based sprite rendering
- created GameStates to accomodate different phases of the game.
- created a debug class for on-screen debug messages

### 5/26/2023

- created advanced ui's with callback functions
- created the BattleGameState (manage/render battles)

### 5/27/2023

- created healthbars for the battles
- cleaned up battle logic
- created smooth camera movement

### 5/28/2023

- cut out some basic sprites
- created gameboard loader from pngs

### 5/30/2023

- removed unnecessary renderings

### 5/31/2023

- fixed excess vision bug
- optimized rendering with RenderQueue class.

### 6/8/2023

- added wild_grass sprite to collection + gameboard
- created wild pokemon encounters when walking on "wild_grass"
- fixed BattleGameState pokemon switching/rendering bugs.

### 6/9/2023

- created battle options (fight and run)
- fixed forced wild encounter bug after consecutive wild encounters

### 6/10/2023
- added better map sprites
- player sprites based on look direction (up, left, right, down)

### 6/11/2023
- added battle background
- added button minimum life span
- added npc sprites + look direction
- added pokemon sprites
- created player relative rendering in Sprite class.
- created catching pokemon

## Kevin Chan

### 5/22/23

- created UISystem class with ArrayList of UI
- created subclasses DialogueBox and Button of parent UI

### 5/23/2023

- created Pokemon and Moves clases
- created accessor and mutator methods for both classes

### 5/24/2023

- finished Pokemon class (without chances of dodging or retreating)
- fixed button in UISystems

### 5/25/2023

- pushed some changes to Pokemon class to branch but chose not to merge
- created NPC class

### 5/26/2023

- wrote interact method in Player class

### 5/29/2023

- completed interact method in both Player and NPC classes
- created NPC rendering and added NPC to DefaultGameState

### 5/30/2023

- added player collisions with NPC and other gameObjects
- started creating menu0

### 5/31/2023

- added more Pokemon to Pokedex
- updated ReadMe file
- worked on Pokemon button within Menu

### 6/1/2023

- completed display of Pokemon when Pokemon button is clickd within Menu

### 6/3/2023

- when a specific Pokemon is clicked after the Pokemon button within Menu, shows that Pokemon's stats
- added a new GameState to show Pokemon stats
- displayed Pokemon sprites in menu and individual PokemonStatsGameState

### 6/5/2023

- created Item class and BerryOrPotion subclass
- created ItemDictionary class to store all possible items

### 6/6/2023

- created Pokeball class
- deleted BerryOrPotion class and replaced with Potion class

### 6/8/2023

- added copying feature to all items
- created Bag and BagGameState classes, and enabled use of BagGameState in MenuGameState

### 6/10/2023

- completed Potion usage within Item within MenuGameState
- began working on usage of Pokeballs

### 6/11/2023

- created ShopGameState, playerMoney, and the ability to buy items
- added Sprites for all items and other images in Shop and Item

### Dev Log

### Working Features
- Walking around a 2D Map
- Interacting with an NPC
- Pokémon battles against an NPC
- Pokémon battles against wild Pokémon (including ability to fight and catch them, as well as to run away)
- A Menu, which contain's the player's item bag and a display of the player's current Pokemon.
- A shop to purchase more items
- Potions to heal your pokemon.

### Broken Features/Bugs
- none

### Content resources that we found helpful
- none
