public class Player extends MonoBehaviour {
  private boolean moving;
  private float walkProgress;
  private int[] lookVector;
  private final float walkDelay = 5; // in frames (game is 30fps)
  private Sprite playerSprite;
  private boolean pause = false;
  private Pokemon[] party;

  public Player(int startingRow, int startingCol) {
    super(startingRow, startingCol);

    if (player == null) {
      lookVector = new int[]{1, 0}; // looking down
      walkProgress = walkDelay;
      playerSprite = getSprite("PLAYER");
      party = new Pokemon[]{pokedex.getPokemon("Pikachu")};
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
    playerSprite.render(camera.getVision().length / 2, camera.getVision()[0].length / 2);
  }

  public void move() {
    if (moving || pause) return;

    /* LOOK CODE */
    if (keyboardInput.isPressed(keyboardInput.PUP)) {
      lookVector[0] = max(lookVector[0] - 1, -1);
      lookVector[1] = 0;
      moving = true;
    }
    if (keyboardInput.isPressed(keyboardInput.PLEFT)) {
      lookVector[0] = 0;
      lookVector[1] = max(lookVector[1] - 1, -1);
      moving = true;
    }
    if (keyboardInput.isPressed(keyboardInput.PDOWN)) {
      lookVector[0] = min(lookVector[0] + 1, 1);
      lookVector[1] = 0;
      moving = true;
    }
    if (keyboardInput.isPressed(keyboardInput.PRIGHT)) {
      lookVector[0] = 0;
      lookVector[1] = min(lookVector[1] + 1, 1);
      moving = true;
    }

    // collision detection)
    if (moving) {
      int endRow = row + lookVector[0];
      int endCol = col + lookVector[1];

      if (!map.canWalkOn(endRow, endCol)) moving = false;
    }
  }
  private void interact() {
    /* CHECK IF PLAYER IS NEXT TO NPC, THEN CHECK IF PLAYER IS LOOKING AT NPC, IF SO, INTERACT WITH NPC */
    if (!keyboardInput.isDown(Controller.PE)) {
      ArrayList<MonoBehaviour> gameObjects = gameStates[GameState.DEFAULT].getGameObjects();
      for (int i=1; i<gameObjects.size(); i++) {
        if (row + lookVector[0] == gameObjects.get(i).getRow() && col + lookVector[1] == gameObjects.get(i).getCol()) {
          NPC npc = (NPC)gameObjects.get(i);
          npc.interact();
        }
      }
    }
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
