public class Pokedex {
  public Pokemon[] pokemon;
  public Move[] moves;
  
  public Pokedex() {
    moves = new Move[]{
      new Move("Thunderbolt", "ELECTRIC", 20),
      new Move("Lightning", "ELECTRIC", 30),
      new Move("Quick Attack", "NORMAL", 10),
      new Move("Discharge", "ELECTRIC", 15),
      
      new Move("Tackle", "NORMAL", 5),
      new Move("Water Gun", "WATER", 20),
      new Move("Water Pulse", "WATER", 30),
      new Move("Rain Dance", "WATER", 35),
      
      new Move("Growl", "NORMAL", 5),
      new Move("Vine Whip", "GRASS", 30),
      new Move("Leech Seed", "GRASS", 20),
      new Move("Poison Powder", "POISON", 10),
      
      new Move("Scratch", "NORMAL", 5),
      new Move("Ember", "FIRE", 10),
      new Move("Fire Fang", "FIRE", 20),
      new Move("Flamethrower", "FIRE", 35),
    };
    pokemon = new Pokemon[]{
      new Pokemon(getSprite("PLAYER"), "Pikachu", 50, 50, 50, 100, new Move[]{ getMove("Thunderbolt"), getMove("Lightning"), getMove("Quick Attack"), getMove("Discharge") }),
      new Pokemon(getSprite("PLAYER"), "Squirtle", 50, 50, 50, 100, new Move[]{ getMove("Tackle"), getMove("Water Gun"), getMove("Water Pulse"), getMove("Rain Dance") }),
      new Pokemon(getSprite("PLAYER"), "Bulbasaur", 50, 50, 50, 100, new Move[]{ getMove("Growl"), getMove("Vine Whip"), getMove("Leech Seed"), getMove("Poison Powder") }),
      new Pokemon(getSprite("PLAYER"), "Charmander", 50, 50, 50, 100, new Move[]{ getMove("Scratch"), getMove("Ember"), getMove("Fire Fang"), getMove("Flamethrower") }),
    };
  }
  
  public Move getMove(String name) {
    for (Move move : moves) {
      if (move.getName().equals(name)) return move;
    }
    return null;
  }
  
  public Pokemon getPokemon(String name) {
    for (Pokemon p : pokemon) {
      if (p.getName().equals(name)) return p.copy();
    }
    return null;
  }
  
  public Pokemon getRandomPokemon() {
    return pokemon[(int) (Math.random() * pokemon.length)];
  }
}
