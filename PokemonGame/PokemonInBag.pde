public class PokemonInBag extends Button{
  public static final int healthHeight = 50;
  public static final int healthWidth = 470;
  public static final int healthbarHeight = 15;
  public static final int healthbarWidth = 200;
  private Pokemon pokemon;

  public PokemonInBag(int x, int y, Pokemon p, Executable e) {
    super(x, y, healthWidth, healthHeight, p.getName(), color(255, 255, 255), e);
    pokemon = p;
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
    text(pokemon.getName(), x+75, y+35);
    
    /* WRITE HP */
    textSize(10);
    text("HP:", x+280, y+45);
    textSize(20);
    
    /* DRAW POKEMON SPRITE*/
    PImage spriteImage = pokemon.getFrontImage().getImage().copy();
    spriteImage.resize(0, 40);
    image(spriteImage, x+5, y+5);    
    
    /* WRITE POKEMON LEVEL */
  }

  private void healthbar() {
    float healthPercent = (float) pokemon.getHP() / (float) pokemon.getMaxHP();

    /* BACKGROUND RED */
    fill(255, 0, 0);
    rect(x + w - healthbarWidth - 10, y+(h/2)-(healthbarHeight/2), healthbarWidth, healthbarHeight);
    /* ONTOP GREEN */
    fill(0, 255, 0);
    rect(x + w - healthbarWidth - 10, y+(h/2)-(healthbarHeight/2), healthbarWidth * healthPercent, healthbarHeight);


    fill(0, 0, 0);
    textSize(15);
    text(pokemon.getHP() + "/" + pokemon.getMaxHP(), x + w - (healthbarWidth * 0.7), y + (h/2) + healthbarHeight + 5);
  }
}
