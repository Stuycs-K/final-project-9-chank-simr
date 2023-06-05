public class ItemDictionary {
  public Item[] items;

  public ItemDictionary() {
    items = new Item[]{
      new BerryOrPotion(getSprite("PLAYER"), "Oran Berry", 10),
      new BerryOrPotion(getSprite("PLAYER"), "Sitrus Berry", 30),
      new BerryOrPotion(getSprite("PLAYER"), "Potion", 20),
      new BerryOrPotion(getSprite("PLAYER"), "Super Potion", 50),
      new BerryOrPotion(getSprite("PLAYER"), "Hyper Potion", 200)
    };
  }
  
  public Item getItem (String name) {
    for (Item item : items) {
      if (item.getName().equals(name)) return item;
    }
    return null;
  }

}
