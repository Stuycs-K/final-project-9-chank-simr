public class MenuGameState extends GameState {
  public MenuGameState() {
    super();
  }
  public void draw() {
    /*
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

    if (battleStart) battleLoop();

    currentFrame++;
    */ 
  }

  public void start() {
    if (gameState == GameState.MENU) {
      println("Already in Menu");
      return;
    }
    gameState = GameState.MENU;
  }
  public void end() {
    gameState = GameState.DEFAULT;
  }
}
