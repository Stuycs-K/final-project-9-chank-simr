/* This could definitely use an image bg instead */
public class PokemonInMenu extends Button {
  public static final int healthHeight = 100;
  public static final int healthWidth = 500;
  public static final int healthbarHeight = 30;
  public static final int healthbarWidth = 200;
  private Pokemon pokemon;

  public PokemonInMenu(int x, int y, Pokemon p, Executable e) {
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
    text(pokemon.getName(), x+150, y+40);
    
    /* WRITE HP */
    textSize(20);
    text("HP:", x+250, y+60);
    
    /* DRAW POKEMON SPRITE*/
    PImage spriteImage = pokemon.getImage().getImage();
    spriteImage.resize(0, healthHeight-healthHeight/3);
    image(spriteImage, x+30, y+20);
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
    textSize(25);
    text(pokemon.getHP() + "/" + pokemon.getMaxHP(), x + w - (healthbarWidth * 0.8), y + (h/2) + healthbarHeight + (25/2));
  }
}
