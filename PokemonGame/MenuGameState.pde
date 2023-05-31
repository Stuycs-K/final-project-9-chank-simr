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
  }
  public void end() {
    gameState = GameState.DEFAULT;
  }
}
