public class NPC{
  private ArrayList<DialogueBox> dialogue;
  private ArrayList<Pokemon> NPCPokemon;
  private Sprite NPCSprite;
  public NPC(Sprite sprite){
    NPCSpite = sprite;
    dialogue.add(new DialogueBox("Hello!"));
    NPCPokemon.add(Pokedex.getPokemon("Pikachu").copy(); //need to reimplement copy
  }
  public ArrayList<DialogueBox> getDialogue(){
    return dialogue;
  }
  public ArrayList<Pokemon> getPokemon(){
    return NPCPokemon;
  }
}
