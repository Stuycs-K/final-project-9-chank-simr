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
