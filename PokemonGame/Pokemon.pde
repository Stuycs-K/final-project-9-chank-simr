public class Pokemon {
  private Sprite image;
  private String name;
  private String type;
  private int xp;
  private int attack;
  private int defense;
  private int speed;
  private int health;
  private ArrayList <Moves> pokemonMoves;
  private ArrayList <Moves> learnableMoves;
  public Pokemon(Sprite img, String n, String t, int exp, int att, int def, int spe, int hp, ArrayList <Moves> curMoves, ArrayList <Moves>futMoves) {
    image = img;
    name = n;
    type = t;
    xp = exp;
    attack = att;
    defense = def;
    speed = spe;
    health = hp;
    pokemonMoves = curMoves;
    learnableMoves = futMoves;
  }
  public Sprite getImg(){
    return image;
  }
  public String getName() {
    return name;
  }
  public String getType() {
    return type;
  }
  public int getXP(){
    return xp;
  }
  public int getAtt(){
    return attack;
  }
  public int getDef(){
    return defense;
  }
  public int getSpeed(){
    return speed;
  }
  public int getHP(){
    return health;
  }
  public ArrayList <Moves> getMoves(){
    return pokemonMoves;
  }
  public ArrayList <Moves> getFutMoves(){
    return learnableMoves;
  }
  
  public void decreaseHP(int amount) {
    health -= amount;
  }
  public void useNormalAttack(Pokemon foe) {
  }
}
