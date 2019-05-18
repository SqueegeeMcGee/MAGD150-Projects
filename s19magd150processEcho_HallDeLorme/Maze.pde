class Maze{
  
  Tile[] tiles;
  int mazeNumber;
  
  Maze(Tile[] tiles, int num){
    this.tiles = tiles;
    mazeNumber = num;
  }
  
  void drawMaze(){
    for(int i = 0; i < 64; i++){
      
      if(tiles[i].traversable){
        fill(5, 25);
      }
      else{
        fill(0);
      }
      
      rect(tiles[i].x, tiles[i].y, tiles[i].size, tiles[i].size);
    }
  }
}
