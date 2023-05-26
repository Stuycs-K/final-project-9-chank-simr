public class BattleGameState extends GameState {
  private Pokemon[] enemyPokemon;
  
  public BattleGameState() {
    super();
  }
  
  public void draw() {
    
  }
  
  public void setEnemyPokemon(Pokemon[] enemyPokemon) {
    this.enemyPokemon = enemyPokemon;
  }
}
