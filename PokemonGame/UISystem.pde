public class UISystem{
  ArrayList<UI> screenUI;
  
  public UISystem() {
    screenUI = new ArrayList<UI>();
  } 
  
  public void add(UI element) {
    screenUI.add(element);
  }
  
  public void remove(UI element) {
    screenUI.remove(element.tag());
  }
}
