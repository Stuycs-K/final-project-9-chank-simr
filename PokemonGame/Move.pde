public class Move{
  private String name;
  private String type;
  private int damage;
  
  //Constructor for moves
  public Move(String n, String t, int dmg){
    name = n;
    type = t;
    damage = dmg;
  }
  
  //Accessor methods for moves
  public String getName(){
    return name;
  }
  public String getType(){
    return type;
  }
  public int getDamage(){
    return damage;
  }
}
