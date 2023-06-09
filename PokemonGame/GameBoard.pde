/* 
GameBoard should accept "dir" argument. In asset folder, 
there should be a directory that contains a
tilemap.png
collisionmap.png

map.png uses hex values to determine tiles
collisions.png should be the same dimensions as map.png 
uses #fff squares to determine which areas are collidable.
You can edit multiple layers in photoshop in png to easily accomplish this

GameBoard should also manage z-indexes and renders of GameObjects
*/

public class GameBoard {
  public int[][] tiles;
  public boolean[][] collisions;
  
  public GameBoard(String dir) {
    String folder = "assets/" + dir;
    PImage tilemap = loadImage(folder + "/tilemap.png");
    PImage collisionmap = loadImage(folder + "/collisionmap.png");
    
    if (tilemap.width != collisionmap.width || tilemap.height != collisionmap.height) {
      println("ERROR: tilemap and collisionmap are of different dimensions");
      return;
    }
    
    tiles = new int[tilemap.height][tilemap.width];
    collisions = new boolean[collisionmap.height][collisionmap.width];
    
    for (int r = 0; r < tilemap.height; ++r) {
      for (int c = 0; c < tilemap.width; ++c) {
        tiles[r][c] = Integer.parseInt(hex(tilemap.get(c, r), 6), 16);
        
        if (Integer.parseInt(hex(collisionmap.get(c, r), 6), 16) == 0X000000) {
          collisions[r][c] = true;
        }
      }
    }
  }
  
  /* FOR TESTING ONLY */
  public GameBoard(int[][] t, boolean[][] c) {
    this.tiles = t;
    this.collisions = c;
  }
  
  public boolean canWalkOn(int r, int c) {
    // out of bounds check
    if (
      r < 0 ||
      r >= tiles.length ||
      c < 0 || 
      c >= tiles[0].length
    ) return false;
    
    // collision check
    return !collisions[r][c];
  }
  
  public String toString() {
    String result = "";
    // print collisions
    for (int r = 0; r < collisions.length; ++r) {
      for (int c = 0; c < collisions[r].length; ++c){
        result += collisions[r][c] ? "." : " ";
      }
      result += "\n";
    }
    
    return result;
  }
  
  public Sprite getTileSprite(int r, int c) {
    for (Sprite s : sprites) {
      if (s.getHex() == tiles[r][c]) {
        
        /* render based on walk delays */
        return s;
      }
    }
    
    return null;
  }
}
