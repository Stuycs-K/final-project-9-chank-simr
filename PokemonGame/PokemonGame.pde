UISystem newSystem;
void setup() {
  size(1200, 900);
  newSystem = new UISystem();
  newSystem.add(new DialogueBox("hello", 0));
  }

void draw() {
  newSystem.get(0).draw();
}
