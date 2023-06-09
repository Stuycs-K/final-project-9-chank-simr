public class UISystem{
  private ArrayList<UI> screenUI;

  public UISystem() {
    screenUI = new ArrayList<UI>();
  }
  
  public ArrayList<UI> getScreenUI() {
    return screenUI;
  }
  public UI get(int index){
    return screenUI.get(index);
  }
  public UI remove (int index){
    UI removed = screenUI.remove(index);
    return removed;
  }
  
  public UI get(String id) {
    for (UI ui : screenUI) {
      if (ui.getId().equals(id)) return ui;
    }
    
    println("UISystem.get(String id): invalid id provided");
    return null;
  }
  
  public UI remove(String id) {
    for (int i = 0; i < screenUI.size(); ++i) {
      if (screenUI.get(i) == null) continue;
      if (screenUI.get(i).getId().equals(id)) {
        return screenUI.remove(i);
      }
    }
    
    println("UISystem.remove(String id): invalid id provided");
    return null;
  }
  
  public int size(){
    return screenUI.size();
  }

  public void render() {
    // iterate backwards incase ui tries to remove itself
    for (int i = screenUI.size()-1; i >= 0; --i) {
      if (i > screenUI.size()-1) continue;
      
      UI ui = screenUI.get(i);
      if (ui == null) continue;
      ui.draw();
    }
  }
  
  public String toString() {
    String returnStr = "";
    
    for (int i = 0; i < screenUI.size(); ++i) {
      if (screenUI.get(i) == null) continue;
      String name = screenUI.get(i).getClass().getName();
      if (i == screenUI.size() - 1) {

        returnStr += name.substring("PokemonGame".length() + 1);
      } else {
        returnStr += name.substring("PokemonGame".length() + 1) + ", ";
      }
    }
    
    return "{" + returnStr + "}";
  }
}
