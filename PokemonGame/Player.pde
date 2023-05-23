public class Player extends MonoBehaviour {
  private float lastMove;
  private char direction;
  
  public Player(int startingRow, int startingCol) {
    super(startingRow, startingCol);
  }
  
  public void render() {
    // render player sprite
    fill(255, 0, 0);
    rect(col * TILE_WIDTH, row * TILE_WIDTH, TILE_WIDTH, TILE_WIDTH);
  }
  
  public void keyPressed() {
    move();
  }
  
  public void move() {
    if (millis() - lastMove < 300) return;
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
}
