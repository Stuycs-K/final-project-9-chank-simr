public class Item{
  private String name;
  private String description;
  private Sprite image;
  
  public Item(Sprite i, String s, String d){
    name = s;
    image = i;
    description = d;
  }
  public String getName(){
    return name;
  }
  public Sprite getSprite(){
    return image;
  }
  public Item copy() {
    return new Item(image, name, description);
  }
  
}
