public class ShopGameState extends GameState {
  boolean canExit;

  public ShopGameState() {
    super();
    canExit = true;
  }
  public void draw() {
    /*CHANGE BACKGROUND COLOR*/
    fill(253, 253, 150);
    rect(0, 0, width, height);

    /*DRAW SHOP ICON*/
    fill (48, 213, 200);
    rect(10, 160, 300, 70);
    fill(0);
    textSize(50);
    text("Shop", 100, 210);
    textSize(20);

    /* DRAW BAG IMAGE*/
    PImage bagImage = getSprite("PLAYER_BAG").getImage().copy();
    bagImage.resize(250, 0);
    image(bagImage, 40, 300);

    /* DRAW ITEMS*/
    fill (124, 252, 0);
    rect(470, 160, width/2, height-height/3);
    fill (255);
    rect(480, 170, width/2-20, height-height/3-20);
    
    /* DRAW MONEY*/
    fill(0);
    textSize(30);
    text("Current Money: $" + money, 700, 100);
    textSize(20);
  }
  public void start() {
    /*
    if (gameState == GameState.SHOP) {
     println("Already in Shop");
     return;
     }
     */
    gameState = GameState.SHOP;

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
        if (canExit) end();
      }
    }
    )
    );

    //Items
    ItemDictionary possibleItems = new ItemDictionary();
    for (int i=0; i<possibleItems.potions.length; i++) {
      Potion curPotion = possibleItems.potions[i];
      createItemBox(i, curPotion);
    }
    for (int i=0; i<possibleItems.pokeballs.length; i++) {
      Pokeball curPokeball = possibleItems.pokeballs[i];
      createItemBox(i, curPokeball);
    }
  }

  public void removeButtons() {
    while (UISys.getScreenUI().size()>6) {
      UISys.getScreenUI().remove(UISys.getScreenUI().size()-1);
    }
  }
  public void createItemBox(int i, Potion curPotion) {
    int cost = 50+i*50;
    UISys.getScreenUI().add(
      new ItemInMenu(
      width/2-30, 180 + i* (50 + 20),
      possibleItems.potions[i],
      new Executable() {
      public void run() {
        if (UISys.getScreenUI().size()<9) {
          if (money >= cost){
            money -= cost;
            playerBag.addPotion(curPotion);
          }
          //canExit = false;
          //createDialogueBox(desc, curPotion);
        }
      }
    }
    ,
      cost
      )
      );
  }
  public void createItemBox(int i, Pokeball curPokeball) {
    int cost = 50+i*50;
    UISys.getScreenUI().add(
      new ItemInMenu(
      width/2-30, 390 + i* (50 + 20),
      possibleItems.pokeballs[i],
      new Executable() {
      public void run() {
        if (UISys.getScreenUI().size()<9) {
          if (money >= cost){
            money -= cost;
            playerBag.addPokeball(curPokeball);
          }
          //canExit = false;
          //createDialogueBox(desc, curPotion);
        }
      }
    }
    ,
      cost
      )
      );
  }
  /*
  public void createDialogueBox(String desc, Potion curPotion) {
    DialogueBox dBox = new DialogueBox(
      desc,
      new Executable() {
      public void run() {
        while (UISys.getScreenUI().size()>3) {
          UISys.getScreenUI().remove(UISys.getScreenUI().size()-1);
        }
        Pokemon[] party = player.getPokemon();
        for (int x=0; x<party.length; x++) {
          Pokemon curPokemon = party[x];
          createPokemon(x, curPokemon, curPotion);
        }
      }
    }
    );
    UISys.getScreenUI().add(dBox);
  }
  */
  public void end() {
    while (UISys.getScreenUI().size()>2) {
      UISys.getScreenUI().remove(UISys.getScreenUI().size()-1);
    }
    ((MenuGameState) gameStates[GameState.MENU]).start();
  }
}
