public class Bag {
  private ArrayList <Potion> potions;
  private ArrayList <Pokeball> pokeballs;

  public Bag() {
    potions = new ArrayList <Potion> ();
    pokeballs = new ArrayList <Pokeball> ();
  }
  public ArrayList<Potion> getPotions() {
    return potions;
  }
  public ArrayList <Pokeball> getPokeballs() {
    return pokeballs;
  }
  public void addPotion (Potion p) {
    potions.add(p);
  }
  public void addPokeball(Pokeball p) {
    pokeballs.add(p);
  }
  public Potion removePotion (String p) {
    for (int i = 0; i < potions.size(); i++) {
      if (potions.get(i) == null) continue;
      if (potions.get(i).getName().equals(p)) {
        return potions.remove(i);
      }
    }

    println("Bag.remove(String p): none of the specified item left");
    return null;
  }
  public Pokeball removePokeball (String p) {
    for (int i = 0; i < potions.size(); i++) {
      if (pokeballs.get(i) == null) continue;
      if (pokeballs.get(i).getName().equals(p)) {
        return pokeballs.remove(i);
      }
    }

    println("Bag.remove(String p): none of the specified item left");
    return null;
  }
  
  public Potion getPotion(String p) {
    for (int i = 0; i < potions.size(); i++) {
      if (potions.get(i) == null) continue;
      if (potions.get(i).getName().equals(p)) {
        return potions.get(i);
      }
    }
    
    return null;
  }
}
