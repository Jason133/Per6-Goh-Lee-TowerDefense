class Tower{
  
  int xCoor, yCoor, range, cost, type, damage;
  int outsideW, outsideH;
  int t1W, t1H;
  int projectileXCoor, projectileYCoor;
  int enemyXCoor, enemyYCoor, enemyDX, enemyDY, enemyW, enemyH, enemyHealth;
  double projectileSpeed, projectileDX, projectileDY;
  String projectileShape;
  
  Tower(int towerXCoor, int towerYCoor, int type){
    xCoor = towerXCoor;
    yCoor = towerYCoor;
    this.type = type;
    if(type == 1){
      range = 200;
      cost = 50;
      damage = 1;
    } 
  }
  
  Tower(int type){
    this.type = type;
    if(type == 1){
      range = 200;
      cost = 50;
      damage = 1;
    }
  } 
  
  int getTowerXCoor(){
    return xCoor;
  }
  int getTowerYCoor(){
    return yCoor;
  }
  int getTowerRange(){
    return range;
  }
  int getTowerType(){
    return type;
  }
  int getTowerCost(){
    return cost; 
  }
  int getTowerDamage(){
    return damage;
  }
  
  /*void displayTower(int XCoor, int YCoor, int type){
    Tile t = new Tile();
    t1W = t.getTileW() - 12;
    t1H = t.getTileH() - 12;
    if(type == 1){
      fill(225, 80, 50);
      rect(XCoor + (t.getTileW() - t1W)/2, YCoor + (t.getTileH() - t1H)/2, t1W, t1H);
      ellipse(XCoor + t.getTileW()/2, YCoor + t.getTileH()/2, 40, 40);
    } else{
      println("Not a valid tower type");
    }
  }*/
  
  void displayTower(){
    Tile t = new Tile();
    t1W = t.getTileW() - 12;
    t1H = t.getTileH() - 12;
    if(type == 1){
      fill(2255, 80, 50);
      rect(xCoor + (t.getTileW() - t1W)/2, yCoor + (t.getTileH() - t1H)/2, t1W, t1H);
      ellipse(xCoor + t.getTileW()/2, yCoor + t.getTileH()/2, 40, 40);
    }else{
      println("Not a valid tower type");
    }
  }
  
  boolean inRange(int targetXCoor, int targetYCoor){
    int diffX = abs(targetXCoor - xCoor);
    int diffY = abs(targetYCoor - yCoor);
    return (sqrt(sq(diffX) + sq(diffY)) < range);
  }
  
  void createProjectile(){
    Tile t = new Tile();
    if(type == 1){
      fill(225, 80, 50);
      ellipse(xCoor +  t.getTileW()/2, yCoor + t.getTileH()/2, 5, 5);
      //projectileShape = "ellipse";
      //Projectile p = Projectile(xCoor, yCoor, type);
      
    }
  }
  
  // NEED TO UPDATE THE PROJECTILE
  void shootProjectile(int targetXCoor, int targetYCoor){
    if (inRange(targetXCoor, targetYCoor)) {
      createProjectile();
      if(type == 1){
        ellipse(projectileXCoor, projectileYCoor, 5, 5);
      }/*else if(type == 2){
        triangle(projectileXCoor + 5, projectileYCoor - 3, projectileXCoor - 5,
        projectileYCoor - 3, projectileXCoor, projectileYCoor + 3);
      }*/else{
        println("No tower type");
      }

      projectileSpeed = 5;

      // Find the distance between the projectile and the projectile's origin
      int deltaX = (enemyXCoor + enemyDX * 3) - projectileXCoor;
      int deltaY = (enemyYCoor + enemyDY * 3) - projectileYCoor;

      // Calculate the angle at which the projectile will be launched to intercept the target
      float angle = atan2(deltaY, deltaX);
      //println(angle);

      // Break up the vector into the x and y components
      projectileDX = cos(angle) * projectileSpeed;
      projectileDY = sin(angle) * projectileSpeed;

      // Change the coords of the projectile
      projectileXCoor += projectileDX;
      projectileYCoor += projectileDY;

      // If the projectile enters the target's space, the projectile is removed from the visible grid and the enemy loses health and is removed when its health reaches 0
      if (abs(projectileXCoor - enemyXCoor) < enemyW/4 &&
        abs(projectileYCoor - enemyYCoor) < enemyH/4) {
        if (abs(projectileXCoor - enemyXCoor) > 0 &&
          abs(projectileYCoor - enemyYCoor) > 0) {
          enemyHealth --;
          println(enemyHealth);
        }
        // Remove enemy from grid once it runs out of health
        if (enemyHealth <= 0) {
          enemyDX = 0;
          enemyDY = 0;
          enemyXCoor = outsideW;
          enemyYCoor = outsideH;
        }
        projectileDX = 0;
        projectileDY = 0;
        projectileSpeed = 0;
        projectileXCoor = outsideW;
        projectileXCoor = outsideH;
      }
    }
  }
  
}
 
 /* 
  void setup(){
    int outsideW, outsideH;
    
    size(750, 750);
    outsideW = width + 100;
    outsideH = width + 100;
    
    projectileDX = 2;
    projectileDY = 2;
    projectileSpeed = 5;
    
    projectileXCoor = towerX + tileW/2;
    projectileYCoor = towerY + tileH/2;
    
    enemyXCoor = 213;
    enemyYCoor = 1;
    enemyW = 24;
    enemyH = 24;
    enemyDX = -2;
    enemyDY = 1;
    enemyHealth = 10;
  }
  
  void draw(){
    background(255);
    Tower t = new Tower(100, 100, 1);
    t.displayTower(t.getTowerXCoor(), t.getTowerYCoor(), t.getTowerType());
  }
  */



