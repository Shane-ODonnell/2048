//2048

PImage Background;
Player test = new Player();

void setup() {
  size(816, 816);
  Background = loadImage("Background.png");
  textSize(128);
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
}
