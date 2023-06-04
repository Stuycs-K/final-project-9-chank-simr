public class PokemonStatsGameState extends GameState {
  public static final int healthHeight = 100;
  public static final int healthWidth = 500;
  public static final int healthbarHeight = 30;
  public static final int healthbarWidth = 200;
  private Pokemon pokemon;
  private final int x = width/2;
  private final int y = 200;

  public PokemonStatsGameState(Pokemon p) {
    super();
    pokemon = p;
  }
  public void draw() {
    /* DRAW HEALTHBAR */
    healthbar();

    /* WRITE POKEMON NAME */
    fill(255);
    textSize(50);
    text(pokemon.getName(), x, y);
    
    /* WRITE HP */
    textSize(20);
    text("HP:", x+150, y+60);
    
    /* DRAW STATS*/
    rect(10, height-height/3-20, x-30, height/3+10);
    fill(0);
    textSize(50);
    text("ATTACK", 20, height-height/3-20 +50);
    text(pokemon.getAttack(), x-120, height-height/3-20 +50);
    text("DEFENSE", 20, height-height/3-20 +130);
    text(pokemon.getDefense(), x-120, height-height/3-20 +130);
    text("SPEED", 20, height-height/3-20 +210);
    text(pokemon.getSpeed(), x-120, height-height/3-20 +210);
    textSize(20);
    
    /* DRAW POKEMON SPRITE*/
    PImage spriteImage = pokemon.getImage().getImage();
    spriteImage.resize(0, y);
    image(spriteImage, x/4, y-20);
    
    /* WRITE POKEMON LEVEL */
  }
  private void healthbar() {
    float healthPercent = (float) pokemon.getHP() / (float) pokemon.getMaxHP();

    /* BACKGROUND RED */
    fill(255, 0, 0);
    rect(x+200, y+40, healthbarWidth, healthbarHeight);
    /* ONTOP GREEN */
    fill(0, 255, 0);
    rect(x+200, y+40, healthbarWidth * healthPercent, healthbarHeight);

    fill(255);
    textSize(25);
    text(pokemon.getHP() + "/" + pokemon.getMaxHP(), x+200 + (healthbarWidth * 0.3), y+40 + healthbarHeight + 20);
  }

  public void start() {
    if (gameState == GameState.POKEMONSTATS) {
      println("Already in Pokemon Stats");
      return;
    }
    gameState = GameState.POKEMONSTATS;

    while (UISys.getScreenUI().size()>2) {
      UISys.getScreenUI().remove(UISys.getScreenUI().size()-1);
    }

    //Exit
    UISys.getScreenUI().add(
      new Button(
      470, 40, 200, 100,
      "Exit",
      color(255, 255, 255),
      new Executable() {
      public void run() {
        end();
      }
    }
    )
    );
  }
  public void removeButtons() {
    while (UISys.getScreenUI().size()>6) {
      UISys.getScreenUI().remove(UISys.getScreenUI().size()-1);
    }
  }
  public void end() {
    while (UISys.getScreenUI().size()>2) {
      UISys.getScreenUI().remove(UISys.getScreenUI().size()-1);
    }
    ((MenuGameState) gameStates[GameState.MENU]).start();
  }
}
