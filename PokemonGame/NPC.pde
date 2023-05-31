public class NPC extends MonoBehaviour {
  private String[] dialogue;
  private Pokemon[] NPCPokemon;
  boolean canBattle;
  private Sprite NPCSprite;
  public NPC(String[] messages, Pokemon[] pokemonToBattle, int startingRow, int startingCol) {
    super(startingRow, startingCol);

    NPCSprite = getSprite("NPC");
    dialogue = messages;
    NPCPokemon = pokemonToBattle;
    canBattle = true;
    map.tiles[startingRow][startingCol] = NPCSprite.getHex();
  }
  public NPC(String[] messages, int startingRow, int startingCol) {
    super(startingRow, startingCol);

    NPCSprite = getSprite("NPC");
    dialogue = messages;
    canBattle = false;
    map.tiles[startingRow][startingCol] = NPCSprite.getHex();
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
  
  public void interact() {
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
}
