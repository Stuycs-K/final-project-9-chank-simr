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
    
    UISys.getScreenUI().add(
    new Button(
      10, 280, 200, 100,
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
    UISys.getScreenUI().remove(UISys.getScreenUI().size()-1);
    gameState = GameState.DEFAULT;
  }
}
