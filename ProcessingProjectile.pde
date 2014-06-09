class Projectile {

  int xCoor, yCoor, damage, speed, type;
  int targetXCoor, targetYCoor, targetDX, targetDY, targetHealth;
  int outsideW, outsideH;
  float dX, dY;
  String projectileShape;

  Projectile(int towerXCoor, int towerYCoor, int type) {
    xCoor = towerXCoor;
    yCoor = towerYCoor;
    speed = 8;
    outsideW = width + 100;
    outsideH = height + 100;
    this.type = type;
    if (type == 1) {
      damage = 1;
      projectileShape = "ellipse";
    }
  }

  int getProjectileXCoor() {
    return xCoor;
  }
  int getProjectileYCoor() {
    return yCoor;
  }

  void setProjectileXCoor(int xCoor) {
    this.xCoor = xCoor;
  }
  void setProjectileYCoor(int yCoor) {
    this.yCoor = yCoor;
  }
  
  // ---------------- Partitioned

  void changeDirection(Enemy e){
    ArrayList<Integer> enemyPath = e.getEnemyPath();
    Tile tile = new Tile();
    int enemyTileXCoor = e.getEnemyTileX();
    int enemyTileYCoor = e.getEnemyTileY();
    for(int i = 0; i < enemyPath.size() - 1; i += 2){ 
      if(enemyPath.get(i) == enemyTileXCoor && enemyPath.get(i + 1) == enemyTileYCoor){
        try{
          targetXCoor = enemyPath.get(i + 2) * tile.getTileW();
          targetYCoor = enemyPath.get(i + 3) * tile.getTileH();
        }
        catch(IndexOutOfBoundsException exception){
          targetXCoor = enemyPath.get(i) * tile.getTileW();
          targetYCoor = enemyPath.get(i + 1) * tile.getTileH();
        }
      }
    }
    float deltaX = sqrt(pow(xCoor, 2) + pow(targetXCoor, 2));
    float deltaY = sqrt(pow(yCoor, 2) + pow(targetYCoor, 2));
    
    // Calculate the angle at which the projectile will be launched to intercept the target
    float angle = atan2(deltaY, deltaX);

    // Break up the vector into the x and y components
    dX = (cos(angle) * speed);
    dY = (sin(angle) * speed);
    
    xCoor += dX;
    yCoor += dY;
    
    if (abs(xCoor - targetXCoor) < 15 &&
      abs(yCoor - targetYCoor) < 15) {
      //if (abs(projectileXCoor - targetXCoor) > 0 && abs(projectileYCoor - targetYCoor) > 0) {
      targetHealth --;
      //}
      // Remove target from grid once it runs out of health
      if (targetHealth <= 0) {
        targetDX = 0;
        targetDY = 0;
        targetXCoor = outsideW;
        targetYCoor = outsideH;
      }
      dX = 0;
      dY = 0;
      speed = 0;
      xCoor = outsideW;
      yCoor = outsideH;
      //}
    }
    
  }
  
  
  // ---------------- Partitioned

/*
  void changeDirection(int targetXCoor, int targetYCoor) {
    
    // For heat-seeking ): 
    //if (projectileShape.equals("ellipse")) {
    //ellipse(xCoor, yCoor, 5, 5);

    // Find the distance between the projectile and the projectile's origin
    int deltaX = (targetXCoor + targetDX * 3) - xCoor;
    int deltaY = (targetYCoor + targetDY * 3) - yCoor;

    // Calculate the angle at which the projectile will be launched to intercept the target
    float angle = atan2(deltaY, deltaX);

    // Break up the vector into the x and y components
    dX = cos(angle) * speed;
    dY = sin(angle) * speed;

    // Change the coords of the projectile
    xCoor += dX;
    yCoor += dY;

    // If the projectile enters the target's space, the projectile is removed from the visible grid and the target loses health and is removed when its health reaches 0
    if (abs(xCoor - targetXCoor) < 15 &&
      abs(yCoor - targetYCoor) < 15) {
      //if (abs(projectileXCoor - targetXCoor) > 0 && abs(projectileYCoor - targetYCoor) > 0) {
      targetHealth --;
      //}
      // Remove target from grid once it runs out of health
      if (targetHealth <= 0) {
        targetDX = 0;
        targetDY = 0;
        targetXCoor = outsideW;
        targetYCoor = outsideH;
      }
      dX = 0;
      dY = 0;
      speed = 0;
      xCoor = outsideW;
      yCoor = outsideH;
      //}
    }
    */  

}

     


