public class DefaultGameState extends GameState {
  public DefaultGameState() {
    super();
    camera = new Camera(height/TILE_WIDTH, width/TILE_WIDTH);
    
    /* initialize tile and collision map */
    /*
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
    */
    map = new GameBoard("map");
    
    player = new Player(2, 2);
    gameObjects.add(player);
    
    String[] messages = new String[] {"Hello", "Let's battle!"};
    Pokemon[] NPCparty = new Pokemon[]{pokedex.getPokemon("Pikachu")};
    NPC npc = new NPC (messages, NPCparty, 5, 5);
    gameObjects.add(npc);
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
