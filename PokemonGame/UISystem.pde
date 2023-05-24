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
  public int size(){
    return screenUI.size();
  }

  public void render() {
    for (UI element : screenUI) {
      element.draw();
    }
  }
}
