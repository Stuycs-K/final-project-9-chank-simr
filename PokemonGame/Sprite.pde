/* SPRITES CAN BE DIFFERENT SIZES (different # of tiles) */
public class Sprite {
  private PImage img;
  private int w;
  private int h;
  private int hex; // what hex value corresponds to this sprite (for map editor)
  private int zIndex;
  
  // width and height in tiles
  // potentially create a z-index? 
  public Sprite(String resourceUrl, int w, int h, int zIndex, int hex) {
    img = loadImage(resourceUrl);
    this.w = w;
    this.h = h;
    this.zIndex = zIndex;
    this.hex = hex;
    img.resize(w * TILE_WIDTH, h * TILE_WIDTH);
  }
  
  // support decimal value row and columns
  public void render(float r, float c) {
    image(img, c * TILE_WIDTH, r * TILE_WIDTH);
  }
  
  public int getWidth() { return w; }
  public int getHeight() { return h; } 
  public int getZIndex() { return zIndex; }
  public int getHex() { return hex; }
}
