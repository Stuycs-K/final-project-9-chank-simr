public class UISystem{
  ArrayList<UI> screenUI;

  public UISystem() {
    screenUI = new ArrayList<UI>();
  }
  
  public ArrayList<UI> getScreenUI() {
    return screenUI;
  }

  public void render() {
    for (UI element : screenUI) {
      element.draw();
    }
  }
}
