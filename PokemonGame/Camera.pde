public class Camera {
  private int[][] vision;
  
  public Camera(int rows, int cols) {
    vision = new int[rows][cols];
  }
  
  // read input based on the player's position, player is center of vision
  // row and col will always be an odd number to accomodate
  public void read() {
    int r = player.getRow();
    int c = player.getCol();
    
    int startRow = max(0, r - vision.length/2);
    int endRow = min(map.tiles.length-1, r + vision.length/2);
    int startCol = max(0, c - vision[0].length/2);
    int endCol = min(map.tiles[0].length-1, c + vision[0].length/2);
    
    for (int i = startRow; i <= endRow; ++i) {
      for (int k = startCol; k <= endCol; ++k) {
        vision[i-startRow][k-startCol] = map.tiles[i][k];
      }
    }
  }
  
  // draw vision
  public void render() {
    for (int r = 0; r < vision.length; ++r) {
      for (int c = 0; c < vision[r].length; ++c) {
        // find corresponding sprite
        boolean foundSprite = false;
        for (Sprite s : sprites) {
          if (s.getHex() == vision[r][c]) {
            foundSprite = true;
            s.render(r, c);
          }
        }
        
        if (!foundSprite) {
          // draw missing texture with filler
        }
      }
    }
  }
  
  public int[][] getVision() { return vision; }
}
