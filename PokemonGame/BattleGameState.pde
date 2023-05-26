/* PLAYER WILL ALWAYS FIGHT NPC-CONTROLLED POKEMON */
/* THE PLAYER'S FIRST POKEMON WILL ALWAYS GO OUT FIRST */

public class BattleGameState extends GameState {
  private Pokemon[] enemyPokemon; /* THE POKEMON OUT IS THE FIRST IN THE ARRAY*/
  private String enemyName;
  private long currentFrame;
  private boolean start; // <- did the initial dialogue box appear yet?
  private boolean battleStart; // <- can the player start attacking?
  private int battleProgress; // % 2. Either player is picking something to do, or an attack is happening
  private int playerPokemonOut = 0; // index of pokemon out
  
  private Button[] moveButtons;
  private boolean renderingButtons = false;
  private Move previousMove;
  
  /* EFFECT VARIABLES */
  private boolean setupEffects = false;
  
  public BattleGameState() {
    super();
    
    /* DEBUG ENEMY FOR TESTING */
    moveButtons = new Button[4];
  }
  
  public void draw() {
    if (!start) {
      start = true;
      UISys.getScreenUI().add(
        new DialogueBox(
          "You have been challenged by " + enemyName + "!",
          new Executable() {
            public void run() {
              battleStart = true;
            }
          }
        )
      );
    }
    
    if (battleStart) battleLoop();
    
    currentFrame++;
  }
  
  public void start(Pokemon[] enemyPokemon, String enemyName) {
    this.enemyPokemon = enemyPokemon;
    this.enemyName = enemyName;
    gameState = GameState.BATTLE;
    
    // find first alive player pokemon
    for (int i = 0; i < player.getPokemon().length; ++i) {
      if (player.getPokemon()[i].getHP() > 0) {
        playerPokemonOut = i;
        break;
      }
    }
    
    setPokemonMoves(player.getPokemon()[playerPokemonOut]);
  }
  
  public void end() {
    enemyPokemon = null;
    currentFrame = 0;
    playerPokemonOut = 0;
    start = false;
    
    /* DIALOGUE BOXES FOR STATS/XP/WIN_MESSAGE */
    /* TRY DOING A FADE-OUT ANIMATION FIRST BEFORE GOING BACK */
    
    gameState = GameState.DEFAULT;
  }
  
  private void battleLoop() {
    if (battleProgress % 2 == 0) {
      if (!renderingButtons) {
        for (Button b : moveButtons) {
          UISys.getScreenUI().add(b);
        }
        renderingButtons = true;
      }
    } else {
      renderingButtons = false;
      // action display (whichever has more speed goes first)
      
      Pokemon enemyPokemon = getEnemyPokemon();
      Pokemon playerPokemon = player.getPokemon()[playerPokemonOut];
      
      boolean playerFaster = playerPokemon.getSpeed() > enemyPokemon.getSpeed();
      if (playerPokemon.getSpeed() == enemyPokemon.getSpeed()) {
        playerFaster = (int) (Math.random() * 2) == 1; // random pick
      }
      
      // setup 
    }
  }
  
  
  
  private void selectMove(Move move) {
    // apply damage
    Pokemon enemyAlive = getEnemyPokemon();
    
    // player.getPokemon()[playerPokemonOut].useAttack(enemyAlive, move); <- DO THIS IN THE NEXT TURN BASED ON SPEED
    
    // clear move buttons from ui
    for (Button b : moveButtons) {
      if (b == null) continue;
      UISys.remove(b.getId());
    }
    
    previousMove = move;
    battleProgress++;
  }
  
  private void setPokemonMoves(Pokemon p) {
    Move[] pokemonMoves = p.getMoves();
    
    /* 
    WIDTH: 500
    HEIGHT: 100
    */
    int btnWidth = 500;
    int btnHeight = 100;
    for (int r = 0; r < 2; ++r) {
      for (int c = 0; c < 2; ++c) {
        if (pokemonMoves[(r * 2) + c] != null) {
          Move m = pokemonMoves[(r*2)+c];
          moveButtons[(r * 2) + c] = new Button(
            btnWidth*c, height-(btnHeight * (2-c)), btnWidth, btnHeight,
            pokemonMoves[(r*2)+c].getName(),
            color(255, 255, 255), // color based on type
            new Executable() {
              public void run() {
                selectMove(m);
              }
            }
          );
        }
      }
    }
  }
  
  public boolean isAlive(Pokemon[] p) {
    for (Pokemon pokemon : p) 
      if (pokemon.getHP() > 0) return true;
    return false;
  }
  
  private Pokemon getEnemyPokemon() {
    Pokemon enemyAlive = enemyPokemon[0];
    // find first alive pokemon of enemy
    for (int i = 0; i < enemyPokemon.length; ++i) {
      if (enemyPokemon[i].getHP() > 0) {
        enemyAlive = enemyPokemon[i];
        break;
      }
    }
    
    return enemyAlive;
  } 
}
