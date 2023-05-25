public class MonoBehaviour {
  protected int row;
  protected int col;
  
  public MonoBehaviour (int row, int col) {
    gameObjects.add(this);
    this.row = row;
    this.col = col;
  }
  
  public void update() {
  
  }
  
  public void render() {
  // default render is empty
  }
  
  public int getRow() { return row; }
  public int getCol() { return col; }
}
