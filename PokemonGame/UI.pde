public class UI {
  protected int x;
  protected int y;
  protected int w;
  protected int h;
  protected String id;
  
  public UI(int x, int y, int w, int h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    /* GENERATE RANDOM ID FOR THIS COMPONENT */
    boolean idExists = false;
    do {
      this.id = "" + ((int) (Math.random() * 10000));
      for (UI ui : UISys.getScreenUI()) {
        if (ui.getId() == this.id) {
          idExists = true;
          break;
        } 
      } 
    } while (idExists);
  }
  
  public void draw(){
  }
  
  public void clicked(){
    if (x<mouseX && mouseX<(x + w) && y<mouseY && mouseY<(y+h)) onClick();
  }
  
  public void onClick() {
  
  }
  
  public int getX() { return x; }
  public int getY() { return y; }
  public int getWidth() { return w; }
  public int getHeight() { return h; }
  public String getId() { return id; }
  
}
