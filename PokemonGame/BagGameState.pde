public class BagGameState extends GameState {
  private ArrayList <Potion> playerPotions;
  private ArrayList <Pokeball> playerPokeballs;

  public BagGameState(Bag b) {
    super();
    playerPotions = b.getPotions();
    playerPokeballs = b.getPokeballs();
  }
  public void draw() {
    /*CHANGE BACKGROUND COLOR*/
    fill(135, 206, 235);
    rect(0, 0, width, height);

    /*DRAW BAG ICON*/
    fill (48, 213, 200);
    rect(10, 160, 300, 70);
    fill(0);
    textSize(50);
    text("Bag", 110, 210);
    textSize(20);

    /* DRAW BAG IMAGE*/
    PImage bagImage = getSprite("PLAYER").getImage().copy();
    bagImage.resize(250, 0);
    image(bagImage, 40, 300);

    /* DRAW ITEMS*/
    fill (124, 252, 0);
    rect(470, 160, width/2, height-height/3);
    fill (255);
    rect(480, 170, width/2-20, height-height/3-20);
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

    //Items
    ItemDictionary possibleItems = new ItemDictionary();
    for (int i=0; i<possibleItems.potions.length; i++) {
      int count = 0;
      for (int j=0; j<playerPotions.size(); j++){
        if (playerPotions.get(j).getName().equals(possibleItems.potions[i].getName()) ) count++;
      }
      UISys.getScreenUI().add(
        new ItemInMenu(
        width/2-30, 180 + i* (50 + 20),
        possibleItems.potions[i],
        new Executable() {
        public void run() {
          /*
          PokemonStatsGameState newGameState = new PokemonStatsGameState(p);
          gameStates[3] = newGameState;
          newGameState.start();
          */
        }
      },
      count
      )
      );
    }
    
    for (int i=0; i<possibleItems.pokeballs.length; i++) {
      int count = 0;
      for (int j=0; j<playerPokeballs.size(); j++){
        if (playerPokeballs.get(j).getName().equals(possibleItems.pokeballs[i].getName()) ) count++;
      }
      UISys.getScreenUI().add(
        new ItemInMenu(
        width/2-30, 180 + (UISys.getScreenUI().size()-3) * (180 + i* (50 + 20) )  + i* (50 + 20),
        possibleItems.pokeballs[i],
        new Executable() {
        public void run() {
          /*
          PokemonStatsGameState newGameState = new PokemonStatsGameState(p);
          gameStates[3] = newGameState;
          newGameState.start();
          */
        }
      },
      count
      )
      );
    }
    
  }
  /*
  private void scroll() {
   if (keyboardInput.isDown(Controller.PUP)) {
   ArrayList<MonoBehaviour> gameObjects = gameStates[GameState.DEFAULT].getGameObjects();
   for (int i=1; i<gameObjects.size(); i++) {
   if (row + lookVector[0] == gameObjects.get(i).getRow() && col + lookVector[1] == gameObjects.get(i).getCol()) {
   NPC npc = (NPC)gameObjects.get(i);
   npc.interact();
   }
   }
   }
   else if (keyboardInput.isDown(Controller.PDOWN)) {
   }
   }
   */
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
