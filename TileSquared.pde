//2048

PImage Background;
Player2 test = new Player2();

void setup() {
  size(1090, 816); // 34 + 50
  Background = loadImage("Background.png");
  textSize(100);
  noStroke();
}

void draw() {
  refresh();
  test.show();
}

void keyPressed(){
  if( key == 'w' || key == 'W'){
    test.moveUp();
  }
  else if( key == 'a' || key == 'A'){
    test.moveRight();
  }
  else if( key == 'd' || key == 'D'){
    test.moveLeft(); //moveDown()
  }
  else if( key == 's' || key == 'S'){
    test.moveDown();
  }
  if(key == 'ö' || key == 'Ö'){
    test = new Player2();
  }
}

void refresh() {
  background(187);
  image(Background, 0, 0);
}
