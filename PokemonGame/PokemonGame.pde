/*
This is a recreation of Pokemon in Processing
Recreation of Unity APIs in Processing
*/
static UISystem UISys;

ArrayList<MonoBehaviour> gameObjects;
static int TILE_WIDTH = 60;
static int[][] tiles; // background
static int[][] collisionMap; // map of just collisions

static Camera camera;
static Sprite[] sprites;

void setup() {
  size(1200, 900);
  camera = new Camera(height/TILE_WIDTH, width/TILE_WIDTH);
  gameObjects = new ArrayList<MonoBehaviour>();
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

    // if game object is within camera
    gameObject.render();
  }

  // draw UI
  UISys.render();
}

void keyPressed() {
  for (MonoBehaviour gameObject : gameObjects) {
    gameObject.keyPressed();
  }
}
