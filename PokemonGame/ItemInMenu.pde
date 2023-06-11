public class ItemInMenu extends Button {
  private Item item;
  private int count;

  public ItemInMenu(int x, int y, Item i, Executable e, int c) {
    super(x, y, 470, 50, i.getName(), color(255, 255, 255), e);
    item = i;
    count = c;
  }

  public void draw() {
    if (item == null) return;
    
    fill(255, 255, 255);
    /* DRAW BACKGROUND BOX */
    rect(x, y, w, h);

    /* WRITE ITEM NAME */
    textSize(30);
    fill(0);
    text(item.getName(), x+75, y+35);
    
    /* WRITE ITEM COUNT*/
    text("x " + count, x + 470 - 80, y+35);
    
    /* DRAW ITEM SPRITE*/
    PImage spriteImage = item.getSprite().getImage().copy();
    spriteImage.resize(0, 40);
    image(spriteImage, x+5, y+5);

    lifetime = max(lifetime-1, 0);
  }
}
