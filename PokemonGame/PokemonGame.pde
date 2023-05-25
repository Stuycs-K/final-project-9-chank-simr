import java.util.PriorityQueue;

/*
This is a recreation of Pokemon in Processing
 Recreation of Unity APIs in Processing
 */
static int TILE_WIDTH = 50;

UISystem UISys;
Debug debug = new Debug();

Sprite[] sprites;
PriorityQueue<Render> renderQueue;

Controller keyboardInput;
Player player;

/* DEFAULT GAME STATE VARIABLES */
Camera camera;
GameBoard map;

GameState[] gameStates;
int gameState = GameState.DEFAULT;

void setup() {
  size(1250, 950);
  frameRate(30);
  
  /* Sprite(resource_url, name, width, height, zIndex, hex) */
  sprites = new Sprite[]{
    new Sprite("assets/grass_floor.jpeg", "GRASS_FLOOR", 1, 1, -1, 2),
    new Sprite("assets/player.png", "PLAYER", 1, 1, 2, 3)
  }; // sprites stored in memory
  
  keyboardInput = new Controller();
  renderQueue = new PriorityQueue<Render>();
  gameStates = new GameState[]{new DefaultGameState()};

  /* INITIALIZE UI SYSTEM */
  UISys = new UISystem();
  UISys.getScreenUI().add(new DialogueBox("hello", 0));
}

void draw() {
  // clear screen
  fill(0, 0, 0);
  rect(0, 0, width, height);
  
  gameStates[gameState].draw();
  
  // rendering based on PriorityQueue sorted by z-index of sprite
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
  
  // debug
  debug.log("FRAMERATE: " + frameRate);
  debug.tick();
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
