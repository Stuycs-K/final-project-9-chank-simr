/* 
GameBoard should accept "dir" argument. In asset folder, 
there should be a directory that contains a
map.png
collisions.png

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
}
