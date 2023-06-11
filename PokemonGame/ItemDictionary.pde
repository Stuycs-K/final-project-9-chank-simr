public class ItemDictionary {
  public Potion[] potions;
  public Pokeball[] pokeballs;

  public ItemDictionary() {
    potions = new Potion[]{
      new Potion(getSprite("POTION"), "Potion", 20),
      new Potion(getSprite("SUPER_POTION"), "Super Potion", 50),
      new Potion(getSprite("HYPER_POTION"), "Hyper Potion", 200)
    };
    pokeballs = new Pokeball[] {
      new Pokeball(getSprite("POKEBALL"), "Poke Ball", "A device for catching wild Pokemon. It's thrown like a ball at a Pokemon, comfortably encapsulating its target.", 50),
      //new Pokeball(getSprite("PLAYER"), "Great Ball", "A good, high-performance Poke Ball that provides a higher catch rate than a standard Poke Ball.", 75)
    };
  }
  
  public Potion getPotion (String name) {
    for (Potion item : potions) {
      if (item.getName().equals(name)) return item;
    }
    return null;
  }
  
  public Pokeball getPokeball(String name){
    for (Pokeball item : pokeballs) {
      if (item.getName().equals(name)) return item;
    }
    return null;
  }

}
