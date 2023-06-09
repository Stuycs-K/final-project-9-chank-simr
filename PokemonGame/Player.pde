public class Player extends MonoBehaviour {
  private boolean moving;
  private float walkProgress;
  private int[] lookVector;
  private final float walkDelay = 5; // in frames (game is 30fps)
  private Sprite playerFront;
  private Sprite playerLeft;
  private Sprite playerRight;
  private Sprite playerBack;
  
  private boolean pause = false;
  private Pokemon[] party;

  public Player(int startingRow, int startingCol) {
    super(startingRow, startingCol);

    if (player == null) {
      lookVector = new int[]{1, 0}; // looking down
      walkProgress = walkDelay;
      playerFront = getSprite("PLAYER_FRONT");
      playerLeft = getSprite("PLAYER_LEFT");
      playerRight = getSprite("PLAYER_RIGHT");
      playerBack = getSprite("PLAYER_BACK");
      
      party = new Pokemon[]{pokedex.getPokemon("Pikachu"), pokedex.getPokemon("Squirtle"), pokedex.getPokemon("Bulbasaur"), pokedex.getPokemon("Charmander"), null, null};
    } else {
      println("Error: instance of Player already exists");
    }
  }

  public void update() {
    interact();
    move();
    if (moving) {
      walkProgress--;
      if (walkProgress <= 0) {
        moving = false;
        walkProgress = walkDelay;
        col += lookVector[1];
        row += lookVector[0];
      }
    }
  }

  public void render() {
    // render player sprite at the center of the screen
    Sprite currentSprite = playerFront;
    
    if (lookVector[0] == 1 && lookVector[1] == 0) {
      currentSprite = playerFront;
    } else if (lookVector[0] == -1 && lookVector[1] == 0) {
      currentSprite = playerBack;
    } else if (lookVector[0] == 0 && lookVector[1] == 1) {
      currentSprite = playerRight;
    } else if (lookVector[0] == 0 && lookVector[1] == -1) {
      currentSprite = playerLeft;
    }
    currentSprite.render(camera.getVision().length / 2, camera.getVision()[0].length / 2);
  }

  public void move() {
    if (moving || pause) return;
    
    /* LOOK CODE */
    if (keyboardInput.isPressed(Controller.PUP)) {
      lookVector[0] = -1;
      lookVector[1] = 0;
      moving = true;
    }
    if (keyboardInput.isPressed(Controller.PLEFT)) {
      lookVector[0] = 0;
      lookVector[1] = -1;
      moving = true;
    }
    if (keyboardInput.isPressed(Controller.PDOWN)) {
      lookVector[0] = 1;
      lookVector[1] = 0;
      moving = true;
    }
    if (keyboardInput.isPressed(Controller.PRIGHT)) {
      lookVector[0] = 0;
      lookVector[1] = 1;
      moving = true;
    }
    
    if (moving && attemptRandomBattle()) return;
    
    // collision detection)
    if (moving) {
      int endRow = row + lookVector[0];
      int endCol = col + lookVector[1];

      if (!map.canWalkOn(endRow, endCol)) moving = false;
      ArrayList<MonoBehaviour> gameObjects = gameStates[gameState].getGameObjects();
      for (int i=1; i<gameObjects.size(); i++){
        if (gameObjects.get(i).getRow() == getRow() + lookVector[0] && gameObjects.get(i).getCol() == getCol() + lookVector[1]){
          moving = false;
          return;
        }
      }
    }
  }
  private boolean attemptRandomBattle() {
    // wild pokemon battle if in tall grass
    if (map.getTileSprite(row, col).getName().equals("WILD_GRASS")) {
      if (Math.random() < 0.08) {
        moving = false;
        Pokemon randomPokemon = pokedex.getRandomPokemon();
        ((BattleGameState) gameStates[GameState.BATTLE]).start(new Pokemon[]{ randomPokemon }, "Wild " + randomPokemon.getName());
        return true;
      }
    }
    
    return false;
  }
  private void interact() {
    /* CHECK IF PLAYER IS NEXT TO NPC, THEN CHECK IF PLAYER IS LOOKING AT NPC, IF SO, INTERACT WITH NPC */
    if (keyboardInput.isDown(Controller.PE)) {
      ArrayList<MonoBehaviour> gameObjects = gameStates[GameState.DEFAULT].getGameObjects();
      for (int i=1; i<gameObjects.size(); i++) {
        if (row + lookVector[0] == gameObjects.get(i).getRow() && col + lookVector[1] == gameObjects.get(i).getCol()) {
          NPC npc = (NPC)gameObjects.get(i);
          npc.interact();
        }
      }
    }
  }
  
  public int numPokemon() {
    for (int i = 0; i < party.length; ++i) {
      if (party[i] == null) return i;
    }
    
    return party.length;
  }

    public void pause() {
      pause = true;
    }
    public void unpause() {
      pause = false;
    }

    public Pokemon[] getPokemon() {
      return party;
    }

    public float getWalkProgress() {
      return walkProgress / walkDelay;
    }
    public int[] getLookVector() {
      return lookVector;
    }
  }
