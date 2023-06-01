public class MenuGameState extends GameState {
  public MenuGameState() {
    super();
  }
  public void draw() {
  }

  public void start() {
    background(0);
    if (gameState == GameState.MENU) {
      println("Already in Menu");
      return;
    }
    gameState = GameState.MENU;
    //Pokedex
    UISys.getScreenUI().add(
      new Button(
      10, 160, 200, 100,
      "Pokedex",
      color(255, 255, 255),
      new Executable() {
      public void run() {
        end();
      }
    }
    )
    );
    //Pokemon
    UISys.getScreenUI().add(
      new Button(
      10, 280, 200, 100,
      "Pokemon",
      color(255, 255, 255),
      new Executable() {
      public void run() {
        end();
      }
    }
    )
    );
    //Item
    UISys.getScreenUI().add(
      new Button(
      10, 400, 200, 100,
      "Item",
      color(255, 255, 255),
      new Executable() {
      public void run() {
        end();
      }
    }
    )
    );
    //Exit
    UISys.getScreenUI().add(
      new Button(
      10, 520, 200, 100,
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
  public void end() {
    while(UISys.getScreenUI().size()>2) {
      UISys.getScreenUI().remove(UISys.getScreenUI().size()-1);
    }
    gameState = GameState.DEFAULT;
  }
}
