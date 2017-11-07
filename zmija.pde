Snake snake;
Food food;
int [] pressed = new int[4]; //up, down, right, left;
static ArrayList<Body> body = new ArrayList<Body>();

int zzz = 0;
int score = 0;
float textLeft = 0;

void setup() {
  size(300, 300);
  snake = new Snake();
  food = new Food();
  pressed[0] = 1;
  pressed[1] = 0;
  pressed[2] = 0;
  pressed[3] = 0;

  frameRate(20);
}

void draw() {
  background(50);
  if (zzz == 0)snake.move(pressed);

  food.display();
  snake.update();

  if (snake.eat(food)) {
    food = new Food(); 
    score++;
    if (score == 100)textLeft += 15;
    if (score == 10)textLeft += 15;
  }

  snake.display();

  if (snake.selfEat())gameOver();


  zzz = 0;

  fill(0, 100, 200);
  textSize(24);
  text(score, 285 - textLeft, 295);
}

void keyPressed() {

  if (key == CODED) {
    switch (keyCode) {
    case UP:
      pressed[0] = 1;
      pressed[1] = 0;
      pressed[2] = 0;
      pressed[3] = 0;
      println("UP");
      if (zzz == 0)snake.move(pressed);
      zzz = 1;
      break;
    case DOWN:
      pressed[0] = 0;
      pressed[1] = 1;
      pressed[2] = 0;
      pressed[3] = 0;
      println("DOWN");
      if (zzz == 0)snake.move(pressed);
      zzz = 1;
      break;
    case RIGHT:
      pressed[0] = 0;
      pressed[1] = 0;
      pressed[2] = 1;
      pressed[3] = 0;
      println("RIGHT");
      if (zzz == 0)snake.move(pressed);
      zzz = 1;
      break;
    case LEFT:
      pressed[0] = 0;
      pressed[1] = 0;
      pressed[2] = 0;
      pressed[3] = 1;
      println("LEFT");
      if (zzz == 0)snake.move(pressed);
      zzz = 1;
      break;
    case SHIFT:
      reset();
      break;
    }
  }
}

public void gameOver() {
  noLoop();
  rectMode(CENTER);
  fill(255, 0, 0);
  rect(body.get(0).bx, body.get(0).by, 10, 10);
}

public void reset() {
  noLoop();
  body.clear();
  fill(255);
  pressed[0] = 1;
  pressed[1] = 0;
  pressed[2] = 0;
  pressed[3] = 0;
  snake.move(pressed);
  food = new Food();
  body.add(new Body(width/2-5, height/2-5));
  body.add(new Body(width/2-5, height/2 + 10-5));
  body.add(new Body(width/2-5, height/2 + 20-5));
  body.add(new Body(width/2-5, height/2 + 30-5));
  body.add(new Body(width/2-5, height/2 + 40-5));
  loop();
}