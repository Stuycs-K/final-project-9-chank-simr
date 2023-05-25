public class Player extends MonoBehaviour {
  private boolean moving;
  private float walkProgress; 
  private int[] lookVector;
  private final float walkDelay = 10; // in frames (game is 30fps)
  
  public Player(int startingRow, int startingCol) {
    super(startingRow, startingCol);
    lookVector = new int[]{1, 0}; // looking down
    walkProgress = walkDelay;
  }
  
  public void update() {
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
    // render player sprite
    fill(255, 0, 0);
    rect(
      (col + (1 - (walkProgress / walkDelay)) * lookVector[1]) * TILE_WIDTH, 
      (row + (1 - (walkProgress / walkDelay)) * lookVector[0]) * TILE_WIDTH, 
      TILE_WIDTH, 
      TILE_WIDTH
    );
  }
  
  public void move() {
    if (moving) return;
    
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
  }
}
