public class Controller {
  public static final int PUP = 0;
  public static final int PLEFT = 1;
  public static final int PDOWN = 2;
  public static final int PRIGHT = 3;
  boolean[] inputs;
  
  public Controller() {
    inputs = new boolean[4];
  }
  
  boolean isPressed(int code) {
    return inputs[code];
  }
  
  void press(int code) {
    if (code == 'W') {
      inputs[PUP] = true;
    } else if (code == 'A') {
      inputs[PLEFT] = true;
    } else if (code == 'S') {
      inputs[PDOWN] = true;
    } else if (code == 'D') {
      inputs[PRIGHT] = true;
    }
  }
  
  void release(int code) {
    if (code == 'W') {
      inputs[PUP] = false;
    } else if (code == 'A') {
      inputs[PLEFT] = false;
    } else if (code == 'S') {
      inputs[PDOWN] = false;
    } else if (code == 'D') {
      inputs[PRIGHT] = false;
    }
  } 
}
