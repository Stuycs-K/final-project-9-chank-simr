public class DialogueBox extends UI {
  private String text;
  
  public DialogueBox(String text){
    super(10, height-(height/9), width-20, height/9);
    this.text = text;
  }
  
  public void draw(){
    fill(255);
    rect(x, y, w, h);
    fill(0);
    textSize(20);
    text(text, x+10, y+10, w-10, h-10);
  }
}
