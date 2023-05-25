public class Button extends UI {
  private String text;
  private color c;
  private Executable onclick;
  
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
  }
  
  public void onClick() {
    onclick.run();
  }
}
