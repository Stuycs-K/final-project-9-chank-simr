import java.util.PriorityQueue;

/*
This is a recreation of Pokemon in Processing
Recreation of Unity APIs in Processing
*/
static UISystem UISys;

ArrayList<MonoBehaviour> gameObjects;
static int TILE_WIDTH = 50;

Camera camera;
Sprite[] sprites;

PriorityQueue<Render> renderQueue;

Controller keyboardInput;

GameBoard map;

void setup() {
  size(1200, 900);
  frameRate(30);
  
  keyboardInput = new Controller();
  camera = new Camera(height/TILE_WIDTH, width/TILE_WIDTH);
  gameObjects = new ArrayList<MonoBehaviour>();
  map = new GameBoard("DIRECTORYNAME");
  sprites = new Sprite[]{

  }; // sprites stored in memory

  /* INITIALIZE UI SYSTEM */
  UISys = new UISystem();
  UISys.getScreenUI().add(new DialogueBox("hello", 0));

  /* INITIALIZE STARTING GAME OBJECTS */
  gameObjects.add(new Player(0, 0));
}

void draw() {
  // clear screen
  fill(0, 0, 0);
  rect(0, 0, width, height);
  
  // draw bg
  camera.read();
  camera.render();

  // draw gameobjects
  for (MonoBehaviour gameObject : gameObjects) {
    gameObject.update();

    // if game object is within camera (replace this later)
    gameObject.render();
  }
  
  // draw sorted renders
  for (int i = 0; i < renderQueue.size(); ++i) {
    Render r = renderQueue.remove();
    image(
      r.getSprite().getImage(), 
      r.getCol() * TILE_WIDTH,
      r.getRow() * TILE_WIDTH 
    );
  }

  // draw UI
  UISys.render();
  fill(0, 255, 0);
}

void keyPressed() {
  keyboardInput.press(keyCode);
}

void keyReleased() {
  keyboardInput.release(keyCode);
}
