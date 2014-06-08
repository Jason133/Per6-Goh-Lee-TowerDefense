class Projectile {

  int xCoor, yCoor, damage, speed, type;
  int targetXCoor, targetYCoor, targetDX, targetDY, targetHealth;
  int outsideW, outsideH;
  float dX, dY;
  String projectileShape;

  Projectile(int towerXCoor, int towerYCoor, int type) {
    xCoor = towerXCoor;
    yCoor = towerYCoor;
    speed = 5;
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

  void changeDirection(int targetXCoor, int targetYCoor) {
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
      /*if (abs(projectileXCoor - targetXCoor) > 0 &&
       abs(projectileYCoor - targetYCoor) > 0) {*/
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

}
    /* belongs in tower
     void createProjectile(){
     ProcessingTile t = new Tile();
     Tower tow = new Tower(1);
     if(tow.getTowerType() == 1){
     fill(225, 80, 50);
     ellipse(xCoor +  t.getTileW()/2, yCoor + t.getTileH()/2, 5, 5);
     projectileShape = "ellipse";
     }
     }
     
     
     // NEED TO UPDATE THE PROJECTILE
     void shootProjectile(int targetXCoor, int targetYCoor) {
     if (inRange(targetXCoor, targetYCoor)) {
     createProjectile();
     if (type == 1) {
     ellipse(projectileXCoor, projectileYCoor, 5, 5);
     }else if(type == 2){
     triangle(projectileXCoor + 5, projectileYCoor - 3, projectileXCoor - 5,
     projectileYCoor - 3, projectileXCoor, projectileYCoor + 3);
     }
     else {
     println("No tower type");
     }
     
     projectileSpeed = 5;
     
     // Find the distance between the projectile and the projectile's origin
     int deltaX = (targetXCoor + targetDX * 3) - projectileXCoor;
     int deltaY = (targetYCoor + targetDY * 3) - projectileYCoor;
     
     // Calculate the angle at which the projectile will be launched to intercept the target
     float angle = atan2(deltaY, deltaX);
     //println(angle);
     
     // Break up the vector into the x and y components
     projectileDX = cos(angle) * projectileSpeed;
     projectileDY = sin(angle) * projectileSpeed;
     
     // Change the coords of the projectile
     projectileXCoor += projectileDX;
     projectileYCoor += projectileDY;
     
     // If the projectile enters the target's space, the projectile is removed from the visible grid and the target loses health and is removed when its health reaches 0
     if (abs(projectileXCoor - targetXCoor) < targetW/4 &&
     abs(projectileYCoor - targetYCoor) < targetH/4) {
     if (abs(projectileXCoor - targetXCoor) > 0 &&
     abs(projectileYCoor - targetYCoor) > 0) {
     targetHealth --;
     println(targetHealth);
     }
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
     }
     }
     */
     


