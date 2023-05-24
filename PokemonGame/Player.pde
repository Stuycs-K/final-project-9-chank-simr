public class Player extends MonoBehaviour {
  private float lastMove;
  private boolean moving;
  private float walkProgress; // 0 -> 1
  private char direction;
  private int[] lookVector;
  private final int walkDelay = 300; // in ms
  
  public Player(int startingRow, int startingCol) {
    super(startingRow, startingCol);
    lookVector = new int[]{1, 0} // looking down
  }
  
  public void update() {
    if (moving) {
      walkProgress = ((float) (millis() - lastMove)) / (float) walkDelay; 
      if (walkProgress >= 1) {
        moving = false;
        walkProgress = 0;
      }
    }
  }
  
  public void render() {
    // render player sprite
    fill(255, 0, 0);
    if (moving) {
      
    } else {
      rect(col * TILE_WIDTH, row * TILE_WIDTH, TILE_WIDTH, TILE_WIDTH);
    }
  }
  
  public void keyPressed() {
    move();
  }
  
  public void move() {
    if (moving) return;
    moving = true;
    lastMove = millis();
    
    switch(key) {
      case 'w':
        row--;
        break;
      case 'a':
        col--;
        break;
      case 's':
        row++;
        break;
      case 'd':
        col++;
        break;
    }
  }
  
  public void look() {
    if (moving) return;
    
    switch (key) {
      case 'w':
        lookVector[0] = -1;
        lookVector[1] = 0;
        direction = key;
        break;
      case 'a':
        lookVector[0] = 0;
        lookVector[1] = -1;
        direction = key;
        break;
      case 's':
        lookVector[0] = 1;
        lookVector[1] = 0;
        direction = key;
        break;
      case 'd':
        lookVector[0] = 1;
        lookVector[1] = 0;
        direction = key;
        break;
    }
  }
}
