public class Render implements Comparable {
  private Sprite sprite;
  private float row, col;
  
  public int compareTo(Object other) {
    Render otherRender = (Render) other;
    
    if (otherRender.sprite.getZIndex() < sprite.getZIndex()) return 1;
    if (otherRender.sprite.getZIndex() > sprite.getZIndex()) return -1;
    return 0;
  }
  
  public Render(float row, float col, Sprite sprite) {
    this.row = row;
    this.col = col;
    this.sprite = sprite;
  }
  
  public float getRow() { return row; }
  public float getCol() { return col; }
  public Sprite getSprite() { return sprite; }
}
