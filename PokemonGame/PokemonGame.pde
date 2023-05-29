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
int gameState = GameState.DEFAULT; // GameState.DEFAULT, GameState.BATTLE

Pokedex pokedex;

void setup() {
  size(1250, 850);
  frameRate(30);
  
  /* Sprite(resource_url, name, width, height, zIndex, hex) */
  sprites = new Sprite[]{
    new Sprite("assets/tiles/grass.png", "GRASS_FLOOR", 1, 1, -1, 0X00FF00),
    new Sprite("assets/tiles/path.png", "PATH", 1, 1, 0, 0XFFFF00),
    new Sprite("assets/player.png", "PLAYER", 1, 1, 2, -1)
  }; // sprites stored in memory
  
  // pokedex
  pokedex = new Pokedex();
  
  keyboardInput = new Controller();
  renderQueue = new PriorityQueue<Render>();
  gameStates = new GameState[]{new DefaultGameState(), new BattleGameState()};

  /* INITIALIZE UI SYSTEM */
  UISys = new UISystem();
  /* USAGE EXAMPLES
  UISys.getScreenUI().add(
    new DialogueBox(
      "hello",
      new Executable() {
        public void run() {
          UISys.getScreenUI().add(
            new DialogueBox(
              "This is the end of the dialogue"
            )
          );
        }
      }
    )
  );
  
  UISys.getScreenUI().add(
    new Button(
      10, 30, 100, 200, 
      "Hello", 
      color(255, 255, 255),
      new Executable(){ 
        public void run() {
          println("HEY");
          println("HI");
        } 
      } 
     )
   );
   */
  
  
  /* DEBUG */
  /* TEST BATTLES */
  UISys.getScreenUI().add(
    new Button(
      10, 40, 200, 100,
      "Start Battle",
      color(255, 255, 255),
      new Executable() {
        public void run() {
          ((BattleGameState) gameStates[GameState.BATTLE]).start(new Pokemon[]{ pokedex.getPokemon("Pikachu"), pokedex.getPokemon("Pikachu") }, "PKMN-NERD Randy");
        }
      }
    )
  );
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
  
  // update frame count
  keyboardInput.update();
  
  // debug
  debug.log("FRAMERATE: " + frameRate);
  debug.log("SCREEN_UI: " + UISys);
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
  for (int x=0; x < UISys.size(); x++) {
    if (UISys.get(x) == null) continue;
    UISys.get(x).clicked();
  }
}
