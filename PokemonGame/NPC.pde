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
    System.out.println("works");
    UISys.getScreenUI().add(
      new DialogueBox(
      dialogue[0],
      new Executable() {
      public void run() {
        for (int i = 1; i<dialogue.length; i++) {
          UISys.getScreenUI().add(
            new DialogueBox(
            dialogue[i],
            new Executable() {
            public void run() {
            }
          }
          )
          );
        }
      }
    }
    )
    );
  }
}
