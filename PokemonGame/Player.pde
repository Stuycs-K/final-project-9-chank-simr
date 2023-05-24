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
    if (moving) {
      walkProgress--;
      if (walkProgress <= 0) {
        moving = false;
        println("UPDATE SAYS MOVING IS " + moving);
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
  
  public void keyPressed() {
    look();
    move();
  }
  
  public void move() {
    if (moving) return;

    switch(key) {
      case 'w':
      case 'a':
      case 's':
      case 'd':
        moving = true;
        break;
    }
  }
  
  public void look() {
    if (moving) return;
    
    switch (key) {
      case 'w':
        lookVector[0] = -1;
        lookVector[1] = 0;
        break;
      case 'a':
        lookVector[0] = 0;
        lookVector[1] = -1;
        break;
      case 's':
        lookVector[0] = 1;
        lookVector[1] = 0;
        break;
      case 'd':
        lookVector[0] = 0;
        lookVector[1] = 1;
        break;
    }
  }
}
