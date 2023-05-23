public class Pokemon{
  Sprite image;
  String name;
  String type;
  int xp;
  int attack;
  int defense;
  int speed;
  int health;
  ArrayList <Moves> pokemonMoves;
  ArrayList <Moves> learnableMoves;
  public Pokemon(Sprite img, String n, String t, int exp, int att, int def, int spe, int hp, ArrayList <Moves> curMoves, ArrayList <Moves>futMoves){
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
}
