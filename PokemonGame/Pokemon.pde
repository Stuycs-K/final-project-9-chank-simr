public class Pokemon {
  private Sprite image;
  private String name;
  private String type;
  private int xp;
  private int attack;
  private int defense;
  private int speed;
  private int health;
  private int maxHealth;
  private Move[] pokemonMoves;
  private ArrayList <Move> learnableMoves;
  
  //Constructor for Pokemon
  public Pokemon(Sprite image, String name, int attack, int defense, int speed, int maxHealth, Move[] pokemonMoves) {
    this.image = image;
    this.name = name;
    this.attack = attack;
    this.defense = defense;
    this.speed = speed;
    this.maxHealth = maxHealth;
    this.health = maxHealth;
    this.pokemonMoves = new Move[4];
    if (pokemonMoves.length > 4) {
      System.out.println("Error: Pokemon can only have 4 moves");
    }
    
    for (int i = 0; i < min(pokemonMoves.length, 4); ++i) {
      this.pokemonMoves[i] = pokemonMoves[i];
    }
    // type = type;
    // xp = xp;
    
    // learnableMoves = learnableMoves;
  }
  
  //Accessor methods for Pokemon
  public Sprite getImage() {
    return image;
  }
  public String getName() {
    return name;
  }
  public int getAttack() {
    return attack;
  }
  public int getDefense() {
    return defense;
  }
  public int getSpeed() {
    return speed;
  }
  public int getHP() {
    return health;
  }
  public int getMaxHP() {
    return maxHealth;
  }
  public Move[] getMoves() {
    return pokemonMoves;
  }
  /*
  public ArrayList <Moves> getFutMoves() {
    return learnableMoves;
  }
  public String getType() {
    return type;
  }
  public int getXP() {
    return xp;
  }
  */

  //Mutator methods for Pokemon
  public void changeName (String newName) {
    name = newName;
  }
  /*
  public void setXP (int xp) {
    this.xp = xp;
  }
  */
  
  public void setAttack (int att) {
    this.attack = att;
  }
  public void setDef (int def) {
    this.defense = def;
  }
  public void setSpeed (int spe) {
    this.speed = spe;
  }
  public void setHP (int curHP) {
    this.health = curHP;
  }
  public void setMaxHP (int maxHP) {
    this.maxHealth = maxHP;
  }
  
  //applies the damage of a selected move on a Pokemon foe
  public void useAttack(Pokemon foe, Move move) {
    int damage = 0;
    try {
      damage = move.getDamage() + getAttack();
    } catch (NullPointerException e) { e.printStackTrace(); }

    foe.setHP(max(foe.getHP() + getDefense() - damage, 0));
  }
  
  public Pokemon copy() {
    return new Pokemon(image, name, attack, defense, speed, maxHealth, pokemonMoves);
  }
}
