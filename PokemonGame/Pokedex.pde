public class Pokedex {
  public Pokemon[] pokemon;
  public Move[] moves;
  
  public Pokedex() {
    moves = new Move[]{
      new Move("Thunderbolt", "ELECTRIC", 20)
    };
    
    pokemon = new Pokemon[]{
      new Pokemon(getSprite("PLAYER"), "Pikachu", 50, 50, 50 ,100, new Move[] {getMove("Thunderbolt")});
    };
  }
  
  public Move getMove(String name) {
    for (Move move : moves) {
      if (move.getName().equals(name)) return move;
    }
    return null;
  }
}
