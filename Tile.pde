//2048
int w = 185;

class Tile {
  color [] colour = {#eee4da, #ede0c8, #f4b17a, #f59563, #e68467, #e46747, #e9d17f, #e8cd72, #e7ca66, #eec746, #ecc230, #fe3d3e};
  int colorIndex = 0;
  int numCol = #7e7063;
  int i, j, value;
  boolean ready = true;

  Tile() {
    i = floor( random(4) );
    j = floor( random(4) );

    if ( random(1) <= 0.1) {
      value = 4;
      colorIndex++;
    } else {
      value = 2;
    }
  }

  void show() {
    fill(colour[colorIndex]);
    int x = i*200 + 15;
    int y = j*200 + 15;
    rect(x, y, w, w);
    fill(numCol);
    textAlign(CENTER, CENTER);
    text(value, x + w/2, y + w/2);
  }

  void squared() {
    if (ready) {
      value = value + value;
      if (colorIndex < colour.length) {
        colorIndex++;
      }
      if (value == 8) {
        numCol = color(255);
      }
    }
    ready = false;
  }

}
