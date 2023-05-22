/* 
This is a recreation of Pokemon in Processing
Recreation of Unity APIs in Processing
*/

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
  
  /* INITIALIZE STARTING GAME OBJECTS */
}

void draw() {
  
  // draw bg
  camera.read();
  camera.render();
  
  // draw gameobjects
  for (MonoBehaviour gameObject : gameObjects) {
    gameObject.update();
    
    // if game object is within camera
    gameObject.render();
  }
}

void keyPressed() {
  for (MonoBehaviour gameObject : gameObjects) {
    gameObject.keyPressed();
  }
}
