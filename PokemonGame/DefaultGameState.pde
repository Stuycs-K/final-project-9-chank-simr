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
    
    //NPC1
    String[] messages = new String[] {"Hello", "Let's battle!"};
    Pokemon[] NPC1party = new Pokemon[]{pokedex.getPokemon("Squirtle")};
    NPC npc1 = new NPC (messages, NPC1party, 4, 4);
    gameObjects.add(npc1);
    
    //NPC2
    Pokemon[] NPC2party = new Pokemon[]{pokedex.getPokemon("Bulbasaur")};
    NPC npc2 = new NPC (messages, NPC2party, 4, 6);
    gameObjects.add(npc2);
    
    //NPC3
    Pokemon[] NPC3party = new Pokemon[]{pokedex.getPokemon("Charmander")};
    NPC npc3 = new NPC (messages, NPC3party, 4, 8);
    gameObjects.add(npc3);
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
