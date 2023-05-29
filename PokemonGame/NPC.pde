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
    NPCSprite.render(getRow() - player.getRow() + (height/2), getCol() - player.getCol() + (width/2));
  }
  public void interact() {
    System.out.println("works");
    /*
    UISys.getScreenUI().add(
      new DialogueBox(
      dialogue.get(0),
      new Executable() {
      for (int x=1; x<dialogue.size(); x++) {
        run() {
          UISys.getScreenUI().add(
            new DialogueBox(
            "This is the end of the dialogue"
            )
            );
        }
      }
    }
    );
    println("interacted");
    */
  }
}
