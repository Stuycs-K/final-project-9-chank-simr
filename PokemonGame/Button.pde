public class Button extends UI {
  boolean clicked;
  public Button(int xloc, int yloc, int wid, int hei, String info, int identifier){
    super(xloc, yloc, wid, hei, info, identifier);
    clicked = false;
  }
  public void draw(){
    fill(255);
    rect(x, y, w, h);
    fill(0);
    text(text, x+10, y+10, w-10, h-10);
  }
  void mouseClicked() {
    if (x<mouseX && mouseX<(x + w) && y<mouseY && mouseY<(y+h)) clicked = true;
  }
  public boolean isClicked(){
    return clicked;
  }
  
}
