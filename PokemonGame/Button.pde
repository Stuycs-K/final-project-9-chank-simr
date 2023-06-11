public class Button extends UI {
  private String text;
  private color c;
  private Executable onclick;
  
  private int lifetime = 10; // last for at least this many frames
  
  public Button(int x, int y, int w, int h, String text, color c, Executable onclick){
    super(x, y, w, h);
    this.text = text;
    this.onclick = onclick;
    this.c = c;
  }
  
  public void draw(){
    fill(c);
    rect(x, y, w, h);
    fill(0);
    // center text
    text(text, x+10, y+(h/2)-10, w-10, h-10);
    lifetime = max(lifetime-1, 0);
  }
  
  public void onClick() {
    if (lifetime == 0) {
      onclick.run();
      lifetime = 10;
    }
  }
}
