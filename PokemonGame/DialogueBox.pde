public class DialogueBox extends UI {
  private String text;
  private Executable onNext;
  private boolean done = false;
  private int lifetime = 30; // last for at least this many frames before disappearing. used to fix bug where dialoguebox would disappear immediately due to the spacebar from the previous dialoguebox that led to it.
  
  public DialogueBox(String text, Executable onNext){
    super(10, height-(height/9), width-20, height/9);
    this.text = text;
    this.onNext = onNext;
  }
  
  public DialogueBox(String text) {
    super(10, height-(height/9), width-20, height/9);
    this.text = text;
  }
  
  public void draw(){
    if (done) return;
    
    /* 
    if key is down, on next
    */
    if (
      keyboardInput.isDown(Controller.PSPACE) && lifetime == 0
    ) {
      // unpause player
      player.unpause();
      // run next
      if (onNext != null) onNext.run();
      // set done
      done = true;
      
      // remove self from UI
      // issue, space bar removes next dialgoue box as well
      
      UISys.getScreenUI().remove(this);
      return;
    }
    
    player.pause();
    
    fill(255);
    rect(x, y, w, h);
    fill(0);
    textSize(20);
    text(text, x+10, y+10, w-10, h-10);
    
    lifetime = max(lifetime-1, 0);
  }
}
