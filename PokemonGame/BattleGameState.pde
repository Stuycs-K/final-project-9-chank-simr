/* PLAYER WILL ALWAYS FIGHT NPC-CONTROLLED POKEMON */
/* THE PLAYER'S FIRST POKEMON WILL ALWAYS GO OUT FIRST */
/*
TODO: add health rendering + pokemon sprites
*/

public class BattleGameState extends GameState {
  private Pokemon[] enemyPokemon; /* THE POKEMON OUT IS THE FIRST IN THE ARRAY*/
  private String enemyName;
  private long currentFrame;
  private boolean start; // <- did the initial dialogue box appear yet?
  private boolean battleStart; // <- can the player start attacking?
  private int battleProgress; // % 2. Either player is picking something to do, or an attack is happening
  
  private int playerPokemonOut = 0; // index of pokemon out
  private int enemyPokemonOut = 0;
  
  private Button[] moveButtons;
  private Button[] battleOptions;
  private boolean renderingButtons = false;
  private Move previousMove;
  
  /* EFFECT VARIABLES */
  private boolean setupEffects = false;
  
  private HealthDisplay playerHealth;
  private HealthDisplay enemyHealth;
  
  public BattleGameState() {
    super();
    
    moveButtons = new Button[4];
  }
  
  public void addUI(UI[] uis) {
    for (UI ui : uis) {
      UISys.getScreenUI().add(ui);
    }
  }
  
  public void clearUI(UI[] uis) {
    for (UI ui : uis) {
      UISys.getScreenUI().remove(ui);
    }
  }
  
  public void draw() {
    /* DRAW CURRENT POKEMONS OUT */
    Pokemon enemy = enemyPokemon[enemyPokemonOut];
    Pokemon playerPokemon = player.getPokemon()[playerPokemonOut];
    
    playerPokemon.getBackImage().render(camera.getRows() - playerPokemon.getBackImage().getHeight() + 2, -2);
    enemy.getFrontImage().render(0, camera.getCols() - enemy.getFrontImage().getWidth());
    
    /* DRAW BG */
    getSprite("BATTLE_BACKGROUND").render(0, 0);
    
    playerHealth.setPokemon(player.getPokemon()[playerPokemonOut]);
    enemyHealth.setPokemon(enemyPokemon[enemyPokemonOut]);
    
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
    if (gameState == GameState.BATTLE) {
      println("Already in Battle");
      return;
    }
    
    if (!isAlive(player.getPokemon())) {
      UISys.getScreenUI().add(
        new DialogueBox(
          "All your pokemon are dead, cannot battle"
        )
      );
      
      return;
    }
    
    if (!isAlive(enemyPokemon)) {
      UISys.getScreenUI().add(
        new DialogueBox(
          "Enemy has no usable pokemon to battle"
        )
      );
      
      return;
    }
    
    this.enemyPokemon = enemyPokemon;
    this.enemyName = enemyName;
    gameState = GameState.BATTLE;
    
    this.playerHealth = new HealthDisplay(width-HealthDisplay.healthWidth, height-(HealthDisplay.healthHeight*3), true);
    this.enemyHealth = new HealthDisplay(0, HealthDisplay.healthHeight);
    
    UISys.getScreenUI().add(playerHealth);
    UISys.getScreenUI().add(enemyHealth);
    
    // find first alive pokemon
    playerPokemonOut = getFirstAlive(player.getPokemon());
    enemyPokemonOut = getFirstAlive(enemyPokemon);
    
    setPokemonMoves(player.getPokemon()[playerPokemonOut]);
    
    /* set up battle options */
    battleOptions = new Button[]{
      new Button(
        0, height-200, width, 100,
        "FIGHT",
        color(255, 255, 255),
        new Executable() {
          public void run() {
            clearUI(battleOptions);
            addMoves();
          }
        }
      ),
      new Button(
        0, height-100, width, 100,
        "RUN",
        color(255, 255, 255),
        new Executable() {
          public void run() {
            clearUI(battleOptions);
            
            /* RUN AWAY */
            UISys.getScreenUI().add(
              new DialogueBox(
                "Ran away!",
                new Executable() {
                  public void run() {
                    end();
                  }
                }
              )
            );
            
          }
        }
      ),
    };
  }
  
  public void end() {
    enemyPokemon = null;
    currentFrame = 0;
    playerPokemonOut = 0;
    enemyPokemonOut = 0;
    
    this.moveButtons = new Button[4];
    start = false;
    battleStart = false;
    battleProgress = 0;
    renderingButtons = false;
    previousMove = null;
    setupEffects = false;
    
    UISys.getScreenUI().remove(playerHealth);
    UISys.getScreenUI().remove(enemyHealth);
    
    playerHealth = null;
    enemyHealth = null;
    
    /* DIALOGUE BOXES FOR STATS/XP/WIN_MESSAGE */
    /* TRY DOING A FADE-OUT ANIMATION FIRST BEFORE GOING BACK */
    
    gameState = GameState.DEFAULT;
  }
  
  private void battleLoop() { 
    if (battleProgress % 2 == 0) {
      setupEffects = false;
      if (!renderingButtons) {
        /* ADD FIGHT MENU */
        addUI(battleOptions);
        renderingButtons = true;
      }
    } else {
      renderingButtons = false;
      // action display (whichever has more speed goes first)
      
      Pokemon enemy = enemyPokemon[enemyPokemonOut];
      Pokemon playerPokemon = player.getPokemon()[playerPokemonOut];
      
      boolean playerFaster = playerPokemon.getSpeed() > enemy.getSpeed();
      
      if (playerPokemon.getSpeed() == enemy.getSpeed()) {
        playerFaster = (int) (Math.random() * 2) == 1; // random pick
      }
      
      // setup 
      if (!setupEffects) {
        if (playerFaster) {
          playerMoves(true);
        } else {
          enemyMoves(true);
        }
        
        setupEffects = true;
      }
    }
  }
  
  private void playerMoves(boolean playerFirst) {
    Pokemon playerPokemon = player.getPokemon()[playerPokemonOut];
    Pokemon enemy = enemyPokemon[enemyPokemonOut];
    
    DialogueBox attackBox = new DialogueBox(
      playerPokemon.getName() + " used " + previousMove.getName() + "!",
      new Executable() {
        public void run() {
          playerPokemon.useAttack(enemy, previousMove);
                
          if (enemy.getHP() <= 0) {
            // dead
            onEnemyDead();
          } else if (playerFirst) {
            enemyMoves(false);
          } else {
            battleProgress++;
          }
        }
      }
    );
          
    UISys.getScreenUI().add(attackBox);
  }
  
  private void enemyMoves(boolean enemyFirst) {
    Pokemon playerPokemon = player.getPokemon()[playerPokemonOut];
    Pokemon enemy = enemyPokemon[enemyPokemonOut];
    
    // enemy moves back
    // make sure it picks a valid move (enemy can have 4 moves some can be null)
    Move enemyMove = null;
    do {
       enemyMove = enemy.getMoves()[(int) (Math.random() * 4)];
    } while (enemyMove == null);
    
    // weird workaround because java wants it to be a final
    final Move theMove = enemyMove;
    
    UISys.getScreenUI().add(
      new DialogueBox(
        "ENEMY: " + enemy.getName() + " used " + enemyMove.getName() + "!",
        new Executable() {
          public void run() {
            enemy.useAttack(playerPokemon, theMove);
            
            if (playerPokemon.getHP() <= 0) {
              onPlayerDead();
            } else if (enemyFirst) {
              playerMoves(false);
            } else {
              battleProgress++;
            }
            
          }
        }
      )
    );
  }
  
  private void onEnemyDead() {
    Pokemon enemy = enemyPokemon[enemyPokemonOut];
    
    if (isAlive(enemyPokemon)) {
      UISys.getScreenUI().add(
        new DialogueBox(
          enemyName + " sent out " + enemy.getName() + "!",
          new Executable() {
            public void run() { 
              enemyPokemonOut = getFirstAlive(enemyPokemon);
              battleProgress++; 
            }
          }
        )
      );
    } else {
      UISys.getScreenUI().add(
        new DialogueBox(
          "Player has beat " + enemyName + "!",
          new Executable() {
            public void run(){ end(); }
          }
        )
      );
    }
  }
  
  private void onPlayerDead() {
    // dead
    clearMoves();
    UISys.getScreenUI().add(
      new DialogueBox(
        player.getPokemon()[playerPokemonOut].getName() + " Fainted!",
        new Executable() {
          public void run() {
            if (isAlive(player.getPokemon())) {
              /* SEND TO POKEMON SELECT MENU, BUT FOR NOW JUST RANDOMLY PICK */
              playerPokemonOut = getFirstAlive(player.getPokemon());
              UISys.getScreenUI().add(
                new DialogueBox(
                  "Player sent out " + player.getPokemon()[playerPokemonOut].getName() + "!",
                  new Executable() {
                    public void run() { 
                      setPokemonMoves(player.getPokemon()[playerPokemonOut]);
                      battleProgress++; 
                    }
                  }
                )
              );
            } else {
              UISys.getScreenUI().add(
                new DialogueBox(
                  "Player blacked out!",
                  new Executable() {
                    public void run() {  
                      end();
                    }
                  }
                )
              );
            }
          }
        }
      )
    );
    
  }
  
  
  
  private void selectMove(Move move) {
    // player.getPokemon()[playerPokemonOut].useAttack(enemyAlive, move); <- DO THIS IN THE NEXT TURN BASED ON SPEED
    
    // clear move buttons from ui
    clearMoves();
    
    previousMove = move;
    battleProgress++;
  }
  
  private void clearMoves() {
    // clear move buttons from ui
    for (Button b : moveButtons) {
      if (b == null) continue;
      UISys.remove(b.getId());
    }
  }
  
  private void addMoves() {
    for (Button b : moveButtons) {
      UISys.getScreenUI().add(b);
    }
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
            btnWidth*c, height-(btnHeight * (2-r)), btnWidth, btnHeight,
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
  
  private int getFirstAlive(Pokemon[] pokemon) {
    int alive = 0;
    // find first alive pokemon of enemy
    for (int i = 0; i < pokemon.length; ++i) {
      if (pokemon[i].getHP() > 0) {
        alive = i;
        break;
      }
    }
    
    return alive;
  } 
}
