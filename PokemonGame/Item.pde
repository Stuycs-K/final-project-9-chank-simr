public class Item{
  private String name;
  private Sprite image;
  
  public Item(Sprite i, String s){
    name = s;
    image = i;
  }
  public String getName(){
    return name;
  }
  public Sprite getSprite(){
    return image;
  }
  public Item copy() {
    return new Item(image, name);
  }
  
}
