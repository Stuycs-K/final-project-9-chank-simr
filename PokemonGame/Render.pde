public class Render {
  private Sprite sprite;
  private float row, col;
  
  public Render(float row, float col, Sprite sprite) {
    this.row = row;
    this.col = col;
    this.sprite = sprite;
  }
  
  public float getRow() { return row; }
  public float getCol() { return col; }
  public Sprite getSprite() { return sprite; }
}
