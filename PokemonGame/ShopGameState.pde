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
    PImage bagImage = getSprite("PLAYER_FRONT").getImage().copy();
    bagImage.resize(250, 0);
    image(bagImage, 40, 300);

    /* DRAW ITEMS*/
    fill (124, 252, 0);
    rect(470, 160, width/2, height-height/3);
    fill (255);
    rect(480, 170, width/2-20, height-height/3-20);
    
    /* DRAW MONEY*/
    textSize(50);
    text("Current Money: $" + money, 100, 210);
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
      String name = possibleItems.potions[i].getName();
      String desc = possibleItems.potions[i].getDescription();
      Potion curPotion = possibleItems.potions[i];
      createItemBox(i, count, name, desc, curPotion);
    }
    
    for (int i=0; i<possibleItems.pokeballs.length; i++) {
      UISys.getScreenUI().add(
        new ItemInMenu(
        width/2-30, 390 + i* (50 + 20),
        possibleItems.pokeballs[i],
        new Executable() {
        public void run() {
          /*
          PokemonStatsGameState newGameState = new PokemonStatsGameState(p);
           gameStates[3] = newGameState;
           newGameState.start();
           */
        }
      }
      ,
      
        count
        )
        );
    }
  }

  public void removeButtons() {
    while (UISys.getScreenUI().size()>6) {
      UISys.getScreenUI().remove(UISys.getScreenUI().size()-1);
    }
  }
  public void createItemBox(int i, int count, String name, String desc, Potion curPotion) {
    UISys.getScreenUI().add(
      new ItemInMenu(
      width/2-30, 180 + i* (50 + 20),
      possibleItems.potions[i],
      new Executable() {
      public void run() {
        if (UISys.getScreenUI().size()<9) {
          if (playerBag.removePotion(name) == null) {
            return;
          } else {
            canExit = false;
            createDialogueBox(desc, curPotion);
          }
        }
      }
    }
    ,
      count
      )
      );
  }
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
  public void createPokemon(int x, Pokemon pok, Potion pot) {
    UISys.getScreenUI().add(
      new PokemonInBag(
      width/2-30, 180 + x* (50 + 20),
      pok,
      new Executable() {
      public void run() {
        pot.useItem(pok);
        createSecondDialogueBox("" + pok.getName() + " has been healed for " + pot.getHealAmount() + " HP.");
      }
    }
    )
    );
  }
  public void createSecondDialogueBox(String desc){
    DialogueBox dBox = new DialogueBox(
      desc,
      new Executable() {
      public void run() {
        ((BagGameState) gameStates[GameState.BAG]).start();
        canExit = true;
      }
    }
    );
    UISys.getScreenUI().add(dBox);
  }
  public void end() {
    while (UISys.getScreenUI().size()>2) {
      UISys.getScreenUI().remove(UISys.getScreenUI().size()-1);
    }
    ((MenuGameState) gameStates[GameState.MENU]).start();
  }
}
