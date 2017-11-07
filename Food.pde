public class Food {

  public float x, y;

  public Food() {
    generate();
  }

  public void display() {
    fill(255);
    rectMode(CENTER);
    rect(x, y, 10, 10);
  }

  public void generate() {
    int a;
    while (true) {
      a = 0;
      x = (int(random(1/2, (width - 10)/10)))*10+5;
      y = (int(random(1/2, (height - 10)/10)))*10+5;
      for (int i = 0; i < body.size(); i++) {
        if (body.get(i).bx == x && body.get(i).by == y) {
          a++;
        }
      }
      if (a == 0)return;
    }
  }
}