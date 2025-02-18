//2048
int w = 185;

class Tile {
  int i, j;
  int index;
  int x, y;
  int value;

  Tile() {
    i = floor( random(4) );
    j = floor( random(4) );

    if ( random(1) <= 0.1) {
      value = 4;
    } else {
      value = 2;
    }
    
    setIndex();
  }

  void show() {
    fill(32, 128, 255);
    x = i*200 + 15;
    y = j*200 + 15;
    rect(x, y, w, w);
    fill(255);
    text(value, x + 64, y + 128);
  }
  
  void squared(){
    value = value + value;
  }

  void setIndex() {
    index = j + 4*i;
  }
  
  void setj(int J){
    j = J;
  }
  
  int geti(){
    return i;
  }
  int getj(){
    return j;
  }
}
