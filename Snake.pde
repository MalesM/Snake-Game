public class Snake {
  int bodySize = 10;
  float dx, dy;
  int direction;
 
  public Snake() {
    body.add(new Body(width/2-5, height/2-5));
    body.add(new Body(width/2-5, height/2 + 10-5));
    body.add(new Body(width/2-5, height/2 + 20-5));
    body.add(new Body(width/2-5, height/2 + 30-5));
    body.add(new Body(width/2-5, height/2 + 40-5));
    direction = 0;
    dx = 0;
    dy = -10;
  }

  public void move(int[] m) {
    if (m[0] == 1 && direction != 1) {
      dx = 0;
      dy = -10;
      direction = 0;
    } else if (m[1] == 1 && direction != 0) {
      dx = 0;
      dy = 10;
      direction = 1;
    } else if (m[2] == 1 && direction != 3) {
      dx = 10;
      dy = 0;
      direction = 2;
    } else if (m[3] == 1 && direction != 2) {
      dx = -10;
      dy = 0;
      direction = 3;
    }
  }

  public void update() {
    selfEat();

    if (body.get(0).bx+5 > width) {
      body.get(0).bx = 5;
    } else if (body.get(0).bx-5 < 0) {
      body.get(0).bx = width-5;
    } else if (body.get(0).by+5 > height) {
      body.get(0).by = 5;
    } else if (body.get(0).by-5 < 0) {
      body.get(0).by = height-5;
    } 

    for (int i = body.size() - 1; i > 0; i--) {
      body.get(i).bx = body.get(i-1).bx;
      body.get(i).by = body.get(i-1).by;
    }

    body.get(0).by += dy;
    body.get(0).bx += dx;
  }

  public void display() {
    rectMode(CENTER);
    for (Body b : body) {
      rect(b.bx, b.by, bodySize, bodySize);
    }
  }

  public boolean eat(Food f) {
    Body b = body.get(0);
    if (b.bx == f.x && b.by == f.y) {
      body.add(new Body(body.get(body.size()-1).bx, body.get(body.size()-1).by));
      return true;
    } else return false;
  }

  public boolean selfEat() {
    Body b = body.get(0);
    for (int i = 1; i < body.size(); i++) {
      if (b.bx == body.get(i).bx && b.by == body.get(i).by) {
        return true;
      }
    }
    return false;
  }
}