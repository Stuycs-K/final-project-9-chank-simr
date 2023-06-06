public class ItemDictionary {
  public Item[] items;

  public ItemDictionary() {
    items = new Item[]{
      new Potion(getSprite("PLAYER"), "Potion", 20),
      new Potion(getSprite("PLAYER"), "Super Potion", 50),
      new Potion(getSprite("PLAYER"), "Hyper Potion", 200), 
      new Pokeball(getSprite("PLAYER"), "Normal Pokeball", 50)
    };
  }
  
  public Item getItem (String name) {
    for (Item item : items) {
      if (item.getName().equals(name)) return item;
    }
    return null;
  }

}
