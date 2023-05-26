public class DefaultGameState extends GameState {
  public DefaultGameState() {
    super();
    camera = new Camera(height/TILE_WIDTH, width/TILE_WIDTH);
    
    /* initialize tile and collision map */
    map = new GameBoard(
      new int[][] {
        {0, 0, 0, 0, 0, 0, 0, 0},
        {0, 2, 2, 2, 2, 2, 2, 0},
        {0, 2, 2, 2, 2, 2, 2, 0},
        {0, 2, 2, 2, 2, 2, 2, 0},
        {0, 2, 2, 2, 2, 2, 2, 0},
        {0, 2, 2, 2, 2, 2, 2, 0},
        {0, 0, 0, 0, 0, 0, 0, 0}
      },
      new boolean[][] {
        {true, true, true, true, true, true, true, true},
        {true, false, false, false, false, false, false, true},
        {true, false, false, false, false, false, false, true},
        {true, false, false, false, false, false, false, true},
        {true, false, false, false, false, false, false, true},
        {true, false, false, false, false, false, false, true},
        {true, true, true, true, true, true, true, true}
      }
    );
    
    player = new Player(2, 2);
    gameObjects.add(player);
  }
  
  public void draw() {
    // draw bg
    camera.read();
    camera.render();
    
    // update gameobjects
    for (MonoBehaviour gameObject : gameObjects) {
      gameObject.update();
    }
  }
}
