class Tile {
  
  int xCoor, yCoor, tileW, tileH;
  boolean enemyTile, towerTile, spawnLocTile, baseTile;
  
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
  
  Tile(int value){
    tileW = 50;
    tileH = 50;
    if(value == 0){
      towerTile = true;
    }else if(value == 1){
      enemyTile = true;
    }else if(value == 3){
      baseTile = true;
    }else{
      spawnLocTile = true;
    }
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
