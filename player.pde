class Player {
  Tile [] tiles = new Tile[16];
  int currSize = 0; // current count of tiles on the grid

  Player() {
    newTile();
    newTile();
  }

  void show() {
    for (int i = 0; i < currSize; i++) {
      tiles[i].show();
    }
  }

  void newTile() {
    Tile temp = new Tile();
    while ( ! empty( temp.i, temp.j ) ) {//if new tile isnt empty
      temp = new Tile();
    }

    tiles[currSize] = temp;
    currSize++;
  }

  void removeTile(int iVal, int jVal) {
    //to remove a tile, I build a copy of the current tiles array but leave out the tile we want to remove
    Tile [] temp = new Tile[16];
    int tempSize = 0;
    for (int k = 0; k < currSize; k++) { //check every tile
      if (tiles[k].geti() != iVal) { //if the i coordinates match
        if (tiles[k].getj() != jVal) {//if the j coordinates match
          temp[k] = tiles[k];
          tempSize++;
        }
      }
    }
    tiles = temp;
    currSize = tempSize;
  }

  void moveUp() {
    boolean changed = false;
    for ( int k = 0; k < 4; k++) {
      for (int g = 0; g < currSize; g++) {
        int currJ = tiles[g].getj();
        int targetJ = currJ - 1;
        int iPos = tiles[g].geti();
        int targetIndex = getIndex(iPos, targetJ );

        if (currJ > 0 ) {
          if ( empty( iPos, targetJ ) ) {
            tiles[g].j--;
            changed = true;
          } else {
            //target cell isnt empty
            //check value of target cell
            if ( tiles[g].value == tiles[targetIndex].value) {
              changed = true;

              //move tile up by one and square
              //tiles[g].j--;
              tiles[g].squared();
              removeTile( iPos, targetJ);//remove target tile
            }
          }
        }
      }
      show();
      delay(35);
    }//close for loop, after each piece was moved up by one
    if (changed) {
      newTile();
    }
  }

  boolean empty(int iVal, int jVal) {
    if ( getIndex(iVal, jVal) != -1) {
      return false;
    }
    return true;
  }

  int getValue(int iVal, int jVal) { //returns the value in given i and j spots
    return tiles[getIndex( iVal, jVal)].value;
  }

  int getIndex(int iVal, int jVal) {
    for (int k = 0; k < currSize; k++) { //check every tile
      if (tiles[k].geti() == iVal) { //if the i coordinates match
        if (tiles[k].getj() == jVal) {//if the j coordinates match
          return k;
        }
      }
    }
    return -1;
  }
}
