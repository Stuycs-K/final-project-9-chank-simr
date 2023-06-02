public class RenderQueue {
  ArrayList<ArrayList<Render>> renders;
  
  public RenderQueue(int numIndexes) {
    renders = new ArrayList<ArrayList<Render>>();
    for (int i = 0; i < numIndexes; ++i) {
      renders.add(new ArrayList<Render>());
    }
  }
  
  public void add(Render r) {
    renders.get(r.getSprite().getZIndex()).add(r);
  }
  
  public void render() {
    for (int i = 0; i < renders.size(); ++i) {
      for (int k = 0; k < renders.get(i).size(); ++k) {
        Render r = renders.get(i).remove(0);
        
        image(
          r.getSprite().getImage(), 
          r.getCol() * TILE_WIDTH,
          r.getRow() * TILE_WIDTH 
        );
        
        
      }
    }
  }
}
