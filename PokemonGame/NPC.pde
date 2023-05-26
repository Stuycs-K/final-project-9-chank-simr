public class NPC extends MonoBehaviour {
  private ArrayList<String> dialogue;
  private ArrayList<Pokemon> NPCPokemon;
  boolean canBattle;
  private Sprite NPCSprite;
  public NPC(Sprite sprite, ArrayList<String> messages, ArrayList<Pokemon> pokemonToBattle) {
    NPCSprite = sprite;
    dialogue = messages;
    NPCPokemon = pokemonToBattle;
    canBattle = true;
  }
  public NPC(Sprite sprite, ArrayList<String> messages) {
    NPCSprite = sprite;
    dialogue = messages;
    canBattle = false;
  }
  public ArrayList<String> getDialogue() {
    return dialogue;
  }
  public ArrayList<Pokemon> getPokemon() {
    return NPCPokemon;
  }
  public boolean getBattleStatus() {
    return canBattle;
  }
  public Sprite getSprite() {
    return NPCSprite;
  }
  public void interact() {
    UISys.getScreenUI().add(
      new DialogueBox(
      dialogue.get(0),
      new Executable() {
      for (int x=1; x<dialogue.size(); x++) {
        public void run() {
          UISys.getScreenUI().add(
            new DialogueBox(
            "This is the end of the dialogue"
            )
            );
        }
      }
    }
    )
    println("interacted");
  }
}
