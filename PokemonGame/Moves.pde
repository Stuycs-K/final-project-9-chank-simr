public class Moves{
  private String name;
  private String type;
  private int damage;
  public Moves(String n, String t, int dmg){
    name = n;
    type = t;
    damage = dmg;
  }
  public String getName(){
    return name;
  }
  public String getType(){
    return type;
  }
  public int getDmg(){
    return damage;
  }
}
