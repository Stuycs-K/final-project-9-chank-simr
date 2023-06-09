public class BagGameState extends GameState {
  private ArrayList <Potion> potions;
  private ArrayList <Pokeball> pokeballs;
  
  public BagGameState(Bag b) {
    super();
    potions = b.getPotions();
    pokeballs = b.getPokeballs();
  }
  public void draw() {
  }
  public void start() {
    if (gameState == GameState.BAG) {
      println("Already in Bag");
      return;
    }
    gameState = GameState.BAG;

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
