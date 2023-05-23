public class UI {
  int x;
  int y;
  int w;
  int h;
  String text;
  int tag;
  public UI(int xloc, int yloc, int wid, int hei, String info, int identifier){
    x = xloc;
    y = yloc;
    w = wid;
    h = hei;
    text = info;
    tag = identifier;
  }
  public int tag(){
    return tag;
  }
  public void draw(){
  }
  
}
