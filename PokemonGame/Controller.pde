public class Controller {
  public static final int PUP = 0;
  public static final int PLEFT = 1;
  public static final int PDOWN = 2;
  public static final int PRIGHT = 3;
  public static final int PSPACE = 4;
  public static final int PE = 5;
  
  boolean[] inputs;
  boolean[] inputsDown; // only for the frame the input is down
  
  public Controller() {
    inputs = new boolean[6];
    inputsDown = new boolean[6];
  }
  
  boolean isPressed(int code) {
    return inputs[code];
  }
  
  boolean isDown(int code) {
    return inputsDown[code];
  }
  
  void press(int code) {
    if (code == 'W') {
      inputs[PUP] = true;
      inputsDown[PUP] = true;
    } else if (code == 'A') {
      inputs[PLEFT] = true;
      inputsDown[PLEFT] = true;
    } else if (code == 'S') {
      inputs[PDOWN] = true;
      inputsDown[PDOWN] = true;
    } else if (code == 'D') {
      inputs[PRIGHT] = true;
      inputsDown[PRIGHT] = true;
    } else if (code == 32) {
      inputs[PSPACE] = true;
      inputsDown[PSPACE] = true;
    } else if (code == 'E') {
      inputs[PE] = true;
      inputsDown[PE] = true;
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
    } else if (code == 32) {
      inputs[PSPACE] = false;
    } else if (code == 'E') {
      inputs[PE] = false;
    }
  } 
  
  void update() {
    // convert all keydowns to false if true
    if (inputsDown[PUP]) inputsDown[PUP] = false;
    if (inputsDown[PLEFT]) inputsDown[PLEFT] = false;
    if (inputsDown[PDOWN]) inputsDown[PDOWN] = false;
    if (inputsDown[PRIGHT]) inputsDown[PRIGHT] = false;
    if (inputsDown[PSPACE]) inputsDown[PSPACE] = false;
    if (inputsDown[PE]) inputsDown[PE] = false;
  }
}
