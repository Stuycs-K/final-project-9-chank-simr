public class BagGameState extends GameState {
  private ArrayList <Potion> potions;
  private ArrayList <Pokeball> pokeballs;
  
  public BagGameState(Bag b) {
    super();
    potions = b.getPotions();
    pokeballs = b.getPokeballs();
  }
  public void draw() {
    /*CHANGE BACKGROUND COLOR*/
    fill(135, 206, 235);
    rect(0, 0, width, height);    
    
    /*DRAW BAG ICON*/    
    fill (48, 213, 200);
    rect(10, 160, 200, 100);
    fill(0);
    textSize(50);
    text("Bag", 60, 220);
    textSize(20);

    /* DRAW BAG IMAGE*/
    /*
    PImage bagImage = pokemon.getImage().getImage().copy();
    bagImage.resize(0, 50);
    image(bagImage, 60, 220);
    */
    
    
    
    
    
    
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
