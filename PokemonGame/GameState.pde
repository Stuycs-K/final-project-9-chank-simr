public class GameState {
  public static final int DEFAULT = 0;
  public static final int BATTLE = 1;

  protected ArrayList<MonoBehaviour> gameObjects;

  /* UPDATE INIT GAME OBJECTS IN CONSTRUCTOR */
  public GameState() {
    gameObjects = new ArrayList<MonoBehaviour>();
  }

  /* DRAW BASED ON GAMESTATE */
  public void draw() {

  }

  public ArrayList<MonoBehaviour> getGameObjects() {
    return gameObjects;
  }
}
