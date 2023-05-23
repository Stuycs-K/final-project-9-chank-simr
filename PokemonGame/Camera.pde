public class Camera {
  private int[][] vision;
  
  public Camera(int rows, int cols) {
    vision = new int[rows][cols];
  }
  
  // read input based on the player's position
  public void read() {
  
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
