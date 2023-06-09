public class Pokeball extends Item{
  private int catchRate;
  private Pokemon pokemon;
  
  //info should be from (0,100]
  public Pokeball (Sprite i, String s, int info){
    super(i, s);
    catchRate = info;
    pokemon = null;
  }
  public int getCatchRate(){
    return catchRate;
  }
  public Pokemon getPokemon(){
    return pokemon;
  }
  public void setPokemon(Pokemon p){
    pokemon = p;
  }
  
  //Returns true if the Pokemon is catched, and false otherwise
  public boolean useItem(Pokemon p){
    if (pokemon != null){
      return false;
    }
    else{
      if (Math.random() * 100 < catchRate){
        pokemon = p;
        return true;
      }
      else return false;
    }
  }
  public Item copy() {
    Pokeball newPokeball = new Pokeball(getSprite(), getName(), catchRate);
    newPokeball.setPokemon (pokemon);
    return newPokeball;
  }
}
