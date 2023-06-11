public class NPC extends MonoBehaviour {
  private String[] dialogue;
  private Pokemon[] NPCPokemon;
  boolean canBattle;
  private Sprite npcFront;
  private Sprite npcBack;
  private Sprite npcLeft;
  private Sprite npcRight;
  private int[] lookVector;
  
  public NPC(String[] messages, Pokemon[] pokemonToBattle, int startingRow, int startingCol) {
    super(startingRow, startingCol);

    npcFront = getSprite("NPC_FRONT");
    npcBack = getSprite("NPC_BACK");
    npcLeft = getSprite("NPC_LEFT");
    npcRight = getSprite("NPC_RIGHT");
    
    lookVector = new int[]{1, 0};
    
    dialogue = messages;
    NPCPokemon = pokemonToBattle;
    canBattle = true;
  }
  public NPC(String[] messages, int startingRow, int startingCol) {
    super(startingRow, startingCol);

    npcFront = getSprite("NPC_FRONT");
    npcBack = getSprite("NPC_BACK");
    npcLeft = getSprite("NPC_LEFT");
    npcRight = getSprite("NPC_RIGHT");
    
    lookVector = new int[]{1, 0};
    
    dialogue = messages;
    canBattle = false;
  }
  public String[] getDialogue() {
    return dialogue;
  }
  public Pokemon[] getPokemon() {
    return NPCPokemon;
  }
  public boolean getBattleStatus() {
    return canBattle;
  }
  
  public void render() {
    getLookSprite().renderAbsolute(row, col);
  }
  
  public void interact() {
    /* LOOK TOWARDS PLAYER */
    lookVector[0] = -player.getLookVector()[0];
    lookVector[1] = -player.getLookVector()[1];
    
    DialogueBox dBox = new DialogueBox(
      dialogue[dialogue.length-1],
      new Executable() {
        public void run() {
          if (canBattle){
            ((BattleGameState) gameStates[GameState.BATTLE]).start(NPCPokemon, "Vicious NPC");
          }
        }
      }
    );
    
    for (int i = dialogue.length-2; i >= 0; --i) {
      final DialogueBox tempBox = dBox;
      dBox = new DialogueBox(
        dialogue[i],
        new Executable() {
          public void run() {
            UISys.getScreenUI().add(tempBox);
          }
        }
      );
    }
    
    UISys.getScreenUI().add(dBox);
  }
  
  public Sprite getLookSprite() {
    Sprite currentSprite = npcFront;
    
    if (lookVector[0] == 1 && lookVector[1] == 0) {
      currentSprite = npcFront;
    } else if (lookVector[0] == -1 && lookVector[1] == 0) {
      currentSprite = npcBack;
    } else if (lookVector[0] == 0 && lookVector[1] == 1) {
      currentSprite = npcRight;
    } else if (lookVector[0] == 0 && lookVector[1] == -1) {
      currentSprite = npcLeft;
    }
    
    return currentSprite;
  }
}
