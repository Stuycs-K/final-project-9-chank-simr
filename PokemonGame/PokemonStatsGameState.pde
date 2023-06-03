public class PokemonStatsGameState extends GameState{
  private Pokemon pokemon;
  public PokemonStatsGameState(Pokemon p) {
    super();
    pokemon = p;
  }
  public void draw() {
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
