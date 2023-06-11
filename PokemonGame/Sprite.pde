/* SPRITES CAN BE DIFFERENT SIZES (different # of tiles) */
public class Sprite {
  private PImage img;
  private int w;
  private int h;
  private int hex; // what hex value corresponds to this sprite (for map editor)
  private int zIndex;
  private String name;
  
  // width and height in tiles
  // potentially create a z-index? 
  public Sprite(String resourceUrl, String name, int w, int h, int zIndex, int hex) {
    img = loadImage(resourceUrl);
    this.w = w;
    this.h = h;
    this.zIndex = zIndex;
    this.hex = hex;
    this.name = name;
    img.resize(w * TILE_WIDTH, h * TILE_WIDTH);
  }
  
  // queue renders first to accomodate z-index 
  // support decimal value row and columns
  public void render(float r, float c) {
    renderQueue.add(new Render(r, c, this));
  }
  /* RENDER ABSOLUTE BASED ON PLAYER LOCATION */
  public void renderAbsolute(float r, float c) {
     int playerRow = player.getRow();
     int playerCol = player.getCol();
     int centerRow = camera.getRows()/2;
     int centerCol = camera.getCols()/2;
     
     renderQueue.add(new Render(r-playerRow+centerRow- ((1 - player.getWalkProgress()) * player.getLookVector()[0]), c-playerCol+centerCol- ((1 - player.getWalkProgress()) * player.getLookVector()[1]), this));
  }
  
  public String getName() { return name; }
  public int getWidth() { return w; }
  public int getHeight() { return h; } 
  public int getZIndex() { return zIndex; }
  public int getHex() { return hex; }
  public PImage getImage() { return img; }
}
