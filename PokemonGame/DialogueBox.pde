public class DialogueBox extends UI {
  public DialogueBox(String info, int identifier){
    super(10, height-height/8, 100, 1000, info, identifier);
  }
  public void draw(){
    rect(x,y, w, h);
  }

}
