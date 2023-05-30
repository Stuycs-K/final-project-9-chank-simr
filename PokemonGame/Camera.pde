public class Camera {
  private int[][] vision;
  private int centerRow;
  private int centerCol;
  
  public Camera(int rows, int cols) {
    vision = new int[rows][cols];
    centerRow = rows/2;
    centerCol = cols/2;
  }
  
  // read input based on the player's position, player is center of vision
  // row and col will always be an odd number to accomodate
  public void read() {
    int pRow = player.getRow();
    int pCol = player.getCol();
    
    for (int r = 0; r <= centerRow; ++r) {
      for (int c = 0; c <= centerCol; ++c) {
        // top left
        if (pRow - r >= 0 && pCol - c >= 0) {
          vision[centerRow-r][centerCol-c] = map.tiles[pRow-r][pCol-c];
        }
        // top right
        if (pRow - r >= 0 && pCol + c < map.tiles[0].length) {
          vision[centerRow-r][centerCol+c] = map.tiles[pRow-r][pCol+c];
        }
        // bottom left
        if (pRow + r < map.tiles.length && pCol - c >= 0) {
          vision[centerRow+r][centerCol-c] = map.tiles[pRow+r][pCol-c];
        }
        // bottom right
        if (pRow + r < map.tiles.length && pCol + c < map.tiles[0].length) {
          vision[centerRow+r][centerCol+c] = map.tiles[pRow+r][pCol+c];
        }
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
            
            /* render based on walk delays */
            s.render(r - ((1 - player.getWalkProgress()) * player.getLookVector()[0]), c - ((1 - player.getWalkProgress())) * player.getLookVector()[1]);
          }
        }
        
        if (!foundSprite) {
          // draw missing texture with filler
        }
      }
    }
    
    /* RENDER GAMEOBJECTS */
    int rowStart = player.getRow() - centerRow;
    int rowEnd = player.getRow() + centerRow;
    int colStart = player.getCol() - centerCol;
    int colEnd = player.getCol() + centerCol;
    
    for (MonoBehaviour obj : gameStates[gameState].getGameObjects()) {
      // check if its within camera
      if ((rowStart <= obj.getRow() && obj.getRow() <= rowEnd) && (colStart <= obj.getCol() && obj.getCol() <= colEnd))
        obj.render();
    }
  }
  
  public int[][] getVision() { return vision; }
}
