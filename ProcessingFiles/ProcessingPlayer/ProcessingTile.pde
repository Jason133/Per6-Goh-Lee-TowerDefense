class Tile {
  
  int xCoor, yCoor, tileW, tileH;
  
  Tile(int xCoor, int yCoor){
    this.xCoor = xCoor;
    this.yCoor = yCoor;
    tileW = 50;
    tileH = 50;
  }
  
  Tile(){
    tileW = 50;
    tileH = 50;
  }
  
  int getTileXCoor(){
    return xCoor;
  }
  int getTileYCoor(){
    return yCoor;
  }
  int getTileW(){
    return tileW;
  }
  int getTileH(){
    return tileH;
  }
  
}