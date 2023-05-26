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
      UI ui = screenUI.get(i);
      ui.draw();
    }
  }
}
