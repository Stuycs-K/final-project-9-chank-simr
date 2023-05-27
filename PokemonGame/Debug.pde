public class Debug {
  private boolean ACTIVE = true;
  
  private String debugString;
  
  public Debug () {
    debugString = "";
  }
  
  public void log(String message) {
    debugString += message + "\n";
  }
  
  public void tick() {
    if (!ACTIVE) return;
    
    if (debugString.length() > 0) {
      textSize(20);
      fill(0, 255, 0);
      text(debugString, 20, 20);
      debugString = "";
    }
  }
}
