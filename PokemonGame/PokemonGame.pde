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
Player player;

void setup() {
  size(1250, 950);
  frameRate(30);
  
  keyboardInput = new Controller();
  renderQueue = new PriorityQueue<Render>();
  camera = new Camera(height/TILE_WIDTH, width/TILE_WIDTH);
  
  gameObjects = new ArrayList<MonoBehaviour>();
  map = new GameBoard(
    new int[][] {
      {0, 0, 0, 0, 0, 0, 0, 0},
      {0, 2, 2, 2, 2, 2, 2, 0},
      {0, 2, 2, 2, 2, 2, 2, 0},
      {0, 2, 2, 2, 2, 2, 2, 0},
      {0, 2, 2, 2, 2, 2, 2, 0},
      {0, 2, 2, 2, 2, 2, 2, 0},
      {0, 0, 0, 0, 0, 0, 0, 0}
    },
    new boolean[][] {
      {true, true, true, true, true, true, true, true},
      {true, false, false, false, false, false, false, true},
      {true, false, false, false, false, false, false, true},
      {true, false, false, false, false, false, false, true},
      {true, false, false, false, false, false, false, true},
      {true, false, false, false, false, false, false, true},
      {true, true, true, true, true, true, true, true}
    }
  );
  /* Sprite(resource_url, name, width, height, zIndex, hex) */
  sprites = new Sprite[]{
    new Sprite("assets/grass_floor.jpeg", "GRASS_FLOOR", 1, 1, -1, 2),
    new Sprite("assets/player.png", "PLAYER", 1, 1, 2, 3)
  }; // sprites stored in memory

  /* INITIALIZE UI SYSTEM */
  UISys = new UISystem();
  UISys.getScreenUI().add(new DialogueBox("hello", 0));

  /* INITIALIZE STARTING GAME OBJECTS */
  player = new Player(2, 2);
  gameObjects.add(player);
}

void draw() {
  // clear screen
  fill(0, 0, 0);
  rect(0, 0, width, height);
  
  // draw bg
  camera.read();
  camera.render();

  // update gameobjects, render gameobjects in camera
  for (MonoBehaviour gameObject : gameObjects) {
    gameObject.update();
  }
  
  // draw sorted renders
  for (int i = 0; i < renderQueue.size(); ++i) {
    Render r = renderQueue.remove();
    if (r.getSprite().getName().equals("PLAYER")) {
      println(r.getCol());
      println(r.getRow());
    }
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

Sprite getSprite(String n) {
    for (int i = 0; i < sprites.length; ++i) {
      if (sprites[i].getName().equals(n)) return sprites[i];
    }
    return null;
}

void mouseClicked() {
  for (int x=0; x<UISys.size(); x++) {
    UISys.get(x).clicked();
  }
}
