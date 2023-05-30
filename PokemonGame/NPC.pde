public class NPC extends MonoBehaviour {
  private String[] dialogue;
  private Pokemon[] NPCPokemon;
  boolean canBattle;
  private Sprite NPCSprite;
  public NPC(String[] messages, Pokemon[] pokemonToBattle, int startingRow, int startingCol) {
    super(startingRow, startingCol);

    NPCSprite = getSprite("PLAYER");
    dialogue = messages;
    NPCPokemon = pokemonToBattle;
    canBattle = true;
  }
  public NPC(String[] messages, int startingRow, int startingCol) {
    super(startingRow, startingCol);

    NPCSprite = getSprite("PLAYER");
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
    // render NPC sprite
    NPCSprite.render(getRow() - player.getRow() + (height/(2* TILE_WIDTH)), getCol() - player.getCol() + (width/(2* TILE_WIDTH)));
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
