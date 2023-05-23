public class DialogueBox extends UI {
  public DialogueBox(String info, int identifier){
    super(10, height-height/9, width-20, height/9, info, identifier);
  }
  public void draw(){
    fill(255);
    rect(x, y, w, h);
    fill(0);
    textSize(20);
    text(text, x+10, y+10, w-10, h-10);
  }

}
