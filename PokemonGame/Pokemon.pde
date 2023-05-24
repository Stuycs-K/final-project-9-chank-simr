public class Pokemon {
  private Sprite image;
  private String name;
  private String type;
  private int xp;
  private int attack;
  private int defense;
  private int speed;
  private int curHealth;
  private int maxHealth;
  private ArrayList <Moves> pokemonMoves;
  private ArrayList <Moves> learnableMoves;
  
  //Constructor for Pokemon
  public Pokemon(Sprite img, String n, String t, int exp, int att, int def, int spe, int hp, ArrayList <Moves> curMoves, ArrayList <Moves>futMoves) {
    image = img;
    name = n;
    type = t;
    xp = exp;
    attack = att;
    defense = def;
    speed = spe;
    maxHealth = hp;
    curHealth = maxHealth;
    pokemonMoves = curMoves;
    learnableMoves = futMoves;
  }
  
  //Accessor methods for Pokemon
  public Sprite getImg() {
    return image;
  }
  public String getName() {
    return name;
  }
  public String getType() {
    return type;
  }
  public int getXP() {
    return xp;
  }
  public int getAtt() {
    return attack;
  }
  public int getDef() {
    return defense;
  }
  public int getSpeed() {
    return speed;
  }
  public int getCurHP() {
    return curHealth;
  }
  public int getMaxHP() {
    return maxHealth;
  }
  public ArrayList <Moves> getMoves() {
    return pokemonMoves;
  }
  public ArrayList <Moves> getFutMoves() {
    return learnableMoves;
  }

  //Mutator methods for Pokemon
  public void changeName (String newName) {
    name = newName;
  }
  public void changeXP (int exp) {
    xp = exp;
  }
  public void changeAtt (int att) {
    attack = att;
  }
  public void changeDef (int def) {
    defense = def;
  }
  public void changeSpeed (int spe) {
    speed = spe;
  }
  public void changeCurHP (int curHP) {
    curHealth = curHP;
  }
  public void changeMaxHP (int maxHP) {
    maxHealth = maxHP;
  }
  
  //applies the damage of a selected move on a Pokemon foe
  public void useAttack(Pokemon foe, int moveNum) {
    int damage = getMoves().get(moveNum).getDmg() + getAtt();
    if (damage > getDef()){
      foe.changeCurHP(foe.getCurHP() + getDef() - (getMoves().get(moveNum).getDmg() + getAtt()) );
    }
  }
}
