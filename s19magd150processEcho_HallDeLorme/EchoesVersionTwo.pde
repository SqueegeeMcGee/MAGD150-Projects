class Tile{
  
  int size = 64; //or 32?
  //64 means 8x8 maze
  //32 means 16x16 maze
  boolean traversable;
  int x;
  int y;
  
  Tile(boolean trav, int x, int y){
    traversable = trav;
    this.x = x;
    this.y = y;
  }
  
}
