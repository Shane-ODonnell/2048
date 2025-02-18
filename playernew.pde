class Player2 {
  int score = 0;
  ArrayList<Tile> tiles = new ArrayList<Tile>();

  Player2() {
    newTile();
    newTile();
  }

  void show() {
    for (int i = 0; i < tiles.size(); i++) {
      tiles.get(i).show();
    }
    textAlign(CORNER, CENTER);
    text(score, 185*4 + 90 , 165);
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

  void ready() {
    for (int h = 0; h < tiles.size(); h++) {
      tiles.get(h).ready = true; //ready up all tiles for fusion
    }
  }

  //-------------------------------------------------------------------------------------------------
  void moveUp() {
    int pos, target;
    boolean changed = false;

    for (int l = 0; l < 4; l++) { //move 4 times

      //the code of this loop starts in the left column second row, and moves every present tile up one postion.

      for (int i = 0; i < 4; i++) { //starting in the left column
        for (int j = 1; j < 4; j++) { //starting in the second row
          pos = getIndex(i, j); //find the position of tile i,j in the array list
          target = getIndex(i, j - 1 ); //find the target

          if (pos != -1) { // if there is a tile in position i,j.
            if (empty(i, j - 1)) {//if the tile above this tile is empty
              tiles.get(pos).j--; //move the tile up one position
              changed = true;  // add new tile later
            } //if the above tile isnt empty, check if it has the same value, also check that both tiles are ready to fuse
            else if (fuse(target, pos))
                changed = true ;
          
          }
        }
      }
      show();
    }
    ready();
    if (changed) //if the board changed at all, add a new tile
      newTile();
  }
  //-------------------------------------------------------------------------------------------------
  void moveRight() {
    int pos, target;
    boolean changed = false;

    for (int l = 0; l < 4; l++) { //move 4 times

      //the code of this loop starts in the left column second row, and moves every present tile up one postion.

      for ( int j = 0; j < 4; j++) { // starting in row 1
        for ( int i = 1; i < 4; i++) { // starting in column 2

          pos = getIndex(i, j); //find the position of tile i,j in the array list
          target = getIndex(i - 1, j ); //find the target

          if (pos != -1) { //if tile i,j is present in array list
            if (empty(i - 1, j)) {//if the tile to the right is empty
              tiles.get(pos).i--; //move the tile right one position
              changed = true;  // add new tile later
            } //if the above tile isnt empty, check if it has the same value, also check that both tiles are ready to fuse
           else if (fuse(target, pos))
                changed = true ;
          
          }
        }
      }
      show();
    }
    ready();
    if (changed) //if the board changed at all, add a new tile
      newTile();
  }


  //-------------------------------------------------------------------------------------------------
  void moveLeft() {
    int pos, target;
    boolean changed = false;

    for (int l = 0; l < 4; l++) { //move 4 times

      //the code of this loop starts in the left column second row, and moves every present tile up one postion.

      for ( int j = 0; j < 4; j++) { // starting in row 1
        for ( int i = 2; i >= 0; i--) { // starting in column 2

          pos = getIndex(i, j); //find the position of tile i,j in the array list
          target = getIndex(i + 1, j ); //find the target

          if (pos != -1) { //if tile i,j is present in array list
            if (empty(i + 1, j)) {//if the tile to the left is empty
              tiles.get(pos).i++; //move the tile left position
              changed = true;  // add new tile later
            } //if the above tile isnt empty, check if it has the same value, also check that both tiles are ready to fuse
            else if (fuse(target, pos))
                changed = true ;
          
          }
        }
      }


      show();
    }
    ready();
    if (changed) //if the board changed at all, add a new tile
      newTile();
  }


  //-------------------------------------------------------------------------------------------------
  void moveDown() {
    int pos, target;
    boolean changed = false;

    for (int l = 0; l < 4; l++) { //move 4 times

      //the code of this loop starts in the left column second row, and moves every present tile up one postion.

      for (int i = 0; i < 4; i++) {
        for (int j = 2; j >= 0; j--) {


          pos = getIndex(i, j); //find the position of tile i,j in the array list
          target = getIndex(i, j + 1); //find the target

          if (pos != -1) { //if tile i,j is present in array list
            if (empty(i, j + 1)) {//if the tile below is empty
              tiles.get(pos).j++; //move the tile up one position
              changed = true;  // add new tile later
            } //if the above tile isnt empty, check if it has the same value, also check that both tiles are ready to fuse
            else if (fuse(target, pos))
                changed = true ;
          }
        }
      }

      show();
    }
    ready();
    if (changed) //if the board changed at all, add a new tile
      newTile();
  }
  //-------------------------------------------------------------------------------------------------

  boolean fuse(int target, int pos) {
    if (tiles.get(target).value == tiles.get(pos).value && tiles.get(pos).ready && tiles.get(target).ready) {
      tiles.get(pos).squared(); //add the two values
      score = score + tiles.get(pos).value;
      tiles.remove(target); //remove target tile
      return true; //add new tile later
    }
    return false;
  }

  boolean empty(int iVal, int jVal) {
    if ( getIndex(iVal, jVal) != -1) {
      return false;
    }
    return true;
  }

  int getIndex(int iVal, int jVal) {
    for (int i = 0; i < tiles.size(); i++) { //check every tile
      if (tiles.get(i).i == iVal) { //if the i coordinates match
        if (tiles.get(i).j == jVal) {//if the j coordinates match
          return i;
        }
      }
    }
    return -1;
  }
}
