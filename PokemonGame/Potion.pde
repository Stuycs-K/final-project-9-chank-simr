public class Potion extends Item{
  private int healAmount;
  
  public Potion (Sprite i, String s, int info){
    super(i, s);
    healAmount = info;
  }
  public int getHealAmount(){
    return healAmount;
  }
  public int useItem(Pokemon pokemon){
    if (pokemon.getHP() + getHealAmount() > pokemon.getMaxHP() ){
      int curHP = pokemon.getHP();
      pokemon.setHP(pokemon.getMaxHP() );
      return pokemon.getMaxHP() - curHP;
    }
    else{
      pokemon.setHP(pokemon.getHP() + getHealAmount() );
      return getHealAmount();
    }
  }
  public Item copy() {
    return new Potion(image, name, healAmount);
  }
}
