class ProcessingProjectile {
  
  int xCoor, yCoor, damage, speed, dX, dY, type;
  int targetXCoor, targetYCoor, targetDX, targetDY;
  
  ProcessingProjectile(int towerXCoor, int towerYCoor, int type){
    xCoor = towerXCoor;
    yCoor = towerYCoor;
    this.type = type;
  }
  
}
