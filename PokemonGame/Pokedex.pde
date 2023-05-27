public class Pokedex {
  public Pokemon[] pokemon;
  public Move[] moves;
  
  public Pokedex() {
    moves = new Move[]{
      new Move("Thunderbolt", "ELECTRIC", 20),
      new Move("Lightning", "ELECTRIC", 30),
      new Move("Quick Attack", "NORMAL", 10),
      new Move("Discharge", "ELECTRIC", 15)
    };
    pokemon = new Pokemon[]{
      new Pokemon(getSprite("PLAYER"), "Pikachu", 50, 50, 50, 100, new Move[]{ getMove("Thunderbolt"), getMove("Lightning"), getMove("Quick Attack"), getMove("Discharge") })
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
}
