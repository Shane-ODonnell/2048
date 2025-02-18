/*/
class Player {
  int score = 0;
  ArrayList<Tile> tiles = new ArrayList<Tile>();

  Player() {
    newTile();
    newTile();
  }

  void show() {
    for (int i = 0; i < tiles.size(); i++) {
      tiles.get(i).show();
    }
  }

  void newTile() {
    Tile temp = new Tile();
    while ( ! empty( temp.i, temp.j ) ) {//if new tile isnt empty
      temp = new Tile();
    }
    tiles.add(temp);
  }

  void removeTile(int iVal, int jVal) {
    tiles.remove(getIndex(iVal, jVal));
  }

  //-------------------------------------------------------------------------------------------------
  void moveUp() {
    boolean changed = false;

    for ( int k = 0; k < 4; k++) {
      for (int g = 0; g <  tiles.size(); g++) {

        int currJ = tiles.get(g).getj();
        int targetJ = currJ - 1;
        int iPos = tiles.get(g).geti();
        int targetIndex = getIndex(iPos, targetJ );

        if (currJ > 0 ) {
          if ( empty( iPos, targetJ ) ) {
            tiles.get(g).j--;
            changed = true;
          } else {
            //target cell isnt empty
            //check value of target cell
            if ( tiles.get(g).value == tiles.get(targetIndex).value) {
              changed = true;
              score = score + tiles.get(g).value*2;

              //move tile up by one and square
              tiles.get(g).j--;
              if (tiles.get(g).ready ==false) {
                tiles.get(g).squared();
                removeTile( iPos, targetJ);//remove target tile
              }
            }
          }
        }
      }
      show();
      delay(35);
    }//close for loop, after each piece was moved up by one
    if (changed) {
      newTile();
      for (int i = 0; i < tiles.size(); i++) {
        tiles.get(i).ready = false;
      }
    }
  }
  //-------------------------------------------------------------------------------------------------

  boolean empty(int iVal, int jVal) {
    if ( getIndex(iVal, jVal) != -1) {
      return false;
    }
    return true;
  }

  int getValue(int iVal, int jVal) { //returns the value in given i and j spots
    return tiles.get(getIndex( iVal, jVal)).value;
  }

  int getIndex(int iVal, int jVal) {
    for (int i = 0; i < tiles.size(); i++) { //check every tile
      if (tiles.get(i).geti() == iVal) { //if the i coordinates match
        if (tiles.get(i).getj() == jVal) {//if the j coordinates match
          return i;
        }
      }
    }
    return -1;
  }
}
//*/
