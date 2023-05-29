/* This could definitely use an image bg instead */
public class HealthDisplay extends UI {
  public static final int healthHeight = 150;
  public static final int healthWidth = 400;
  public static final int healthbarHeight = 30;
  public static final int healthbarWidth = 200;
  
  private Pokemon pokemon;
  private boolean isPlayer;
  
  public HealthDisplay(int x, int y, boolean isPlayer) {
    super(x, y, healthWidth, healthHeight);
    
    this.isPlayer = isPlayer;
  }
  
  public HealthDisplay(int x, int y) {
    super(x, y, healthWidth, healthHeight);
    
    this.isPlayer = false;
  }
  
  public void draw() {
    if (pokemon == null) return;
    
    fill(255, 255, 255);
    
    /* DRAW BACKGROUND BOX */
    rect(x, y, w, h);
    
    /* DRAW HEALTHBAR */
    healthbar();
    
    /* WRITE POKEMON NAME */
    textSize(30);
    fill(0, 0, 0);
    text(pokemon.getName(), x+10, y+40);
    
    /* WRITE POKEMON LEVEL */
  }
  
  public void setPokemon(Pokemon p) {
    this.pokemon = p;
  }
  
  private void healthbar() {
    float healthPercent = (float) pokemon.getHP() / (float) pokemon.getMaxHP();
    
    /* BACKGROUND RED */
    fill(255, 0, 0);
    rect(x + w - healthbarWidth - 10, y+(h/2)-(healthbarHeight/2), healthbarWidth, healthbarHeight);
    /* ONTOP GREEN */
    fill(0, 255, 0);
    rect(x + w - healthbarWidth - 10, y+(h/2)-(healthbarHeight/2), healthbarWidth * healthPercent, healthbarHeight); 
    
    
    /* IF IS PLAYER, HAVE TEXT UNDER */
    if (isPlayer) {
      fill(0, 0, 0);
      textSize(25);
      text(pokemon.getHP() + "/" + pokemon.getMaxHP(), x + w - (healthbarWidth * 0.8), y + (h/2) + healthbarHeight + (25/2));
    }
  }
}
