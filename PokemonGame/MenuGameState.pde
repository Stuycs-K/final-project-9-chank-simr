public class MenuGameState extends GameState {
  public MenuGameState() {
    super();
  }
  public void draw() {
  }

  public void start() {
    if (gameState == GameState.MENU) {
      println("Already in Menu");
      return;
    }
    gameState = GameState.MENU;
    
    //Shop
    removeButtons();
    UISys.getScreenUI().add(
      new Button(
      10, 160, 200, 100,
      "Shop",
      color(255, 255, 255),
      new Executable() {
      public void run() {
        ((ShopGameState) gameStates[GameState.SHOP]).start();
      }
    }
    )
    );
    
    //Pokemon
    removeButtons();
    UISys.getScreenUI().add(
      new Button(
        10, 280, 200, 100,
        "Pokemon",
        color(255, 255, 255),
        new Executable() {
        public void run() {
          
          Pokemon[] party = player.getPokemon();
          for (int i=0; i<party.length; i++) {
            Pokemon p = party[i];
            UISys.getScreenUI().add(
              new PokemonInMenu(
                width/2, 40 + i* (100 + 20),
                party[i],
                new Executable() {
                  public void run() {
                    println("HELLO");
                    PokemonStatsGameState newGameState = new PokemonStatsGameState(p);
                    gameStates[3] = newGameState;
                    newGameState.start();
                  }
                }
              )
            );
            
          }
        }
      }
    )
    );
    
    //Item
    removeButtons();
    UISys.getScreenUI().add(
      new Button(
      10, 400, 200, 100,
      "Bag",
      color(255, 255, 255),
      new Executable() {
      public void run() {
        ((BagGameState) gameStates[GameState.BAG]).start();
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
  public void removeButtons(){
    while (UISys.getScreenUI().size()>6) {
      UISys.getScreenUI().remove(UISys.getScreenUI().size()-1);
    }
  }
  public void end() {
    while (UISys.getScreenUI().size()>2) {
      UISys.getScreenUI().remove(UISys.getScreenUI().size()-1);
    }
    gameState = GameState.DEFAULT;
  }
}
