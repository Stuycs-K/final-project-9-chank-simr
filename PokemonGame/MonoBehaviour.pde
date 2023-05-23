public class MonoBehaviour {
  private int x;
  private int y;
  
  public MonoBehaviour (int x, int y) {
    gameObjects.add(this);
    this.x = x;
    this.y = y;
  }
  
  public void update() {
  
  }
  
  public void keyPressed() {
    
  }
  
  public void render() {
  // default render is empty
  }
  
  public int getX() { return x; }
  public int getY() { return y; }
}
