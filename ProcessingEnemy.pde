class Enemy {
  
  int xCoor, yCoor, dX, dY, speed, type;
  int health, lifeCost, bounty;
  int enemyW, enemyH;
  //int spawnX, spawnY;
  //ArrayList<EnemyTile> visited;
  //EnemyTile nextLoc, currLoc; TargetLoc for base?
  
  Enemy(int spawnX, int spawnY, int type){
    //this.spawnX = spawnX;
    //this.spawnY = spawnY;
    xCoor = spawnX;
    yCoor = spawnY;
    this.type = type;
    if(type == 1){
      enemyW = 24;
      enemyH = 24;
      dX = 3;
      dY = 0;
      health = 10;
      bounty = 10;
      lifeCost = 1;
      fill(100, 175, 50);
    }
  }
  
  // Spawns at origin
  Enemy(int type){
    if(type == 1){
      enemyW = 24;
      enemyH = 24;
      dX = 2;
      dY = 1;
      health = 10;
      bounty = 10;
      lifeCost = 1;
      fill(100, 175, 50);
    }
  }
  
  int getEnemyXCoor(){
    return xCoor;
  }
  int getEnemyYCoor(){
    return yCoor;
  }
  int getEnemyDX(){
    return dX;
  }
  int getEnemyDY(){
    return dY;
  }
  int getEnemySpeed(){
    return speed;
  }
  int getEnemyType(){
    return type;
  }
  int getEnemyHealth(){
    return health;
  }
  int getEnemyBounty(){
    return bounty;
  }
  int getEnemyLifeCost(){
    return lifeCost;
  }
  int getEnemyW(){
    return enemyW;
  }
  int getEnemyH(){
    return enemyH;
  }
  
  void setEnemyXCoor(int xCoor){
    this.xCoor = xCoor;
  }
  void setEnemyYCoor(int yCoor){
    this.yCoor = yCoor;
  }
  void setEnemyDX(int dx){
    dX = dx;
  }
  void setEnemyDY(int dy){
    dY = dy;
  }
  void setEnemyHealth(int health){
    this.health = health;
  }
  
  void displayEnemy(){
    rect(xCoor, yCoor, enemyW, enemyH);
  }
  
  // Fake move: just bounces around
  void move(){
    //if(type == 1){
    displayEnemy();
    xCoor += dX;
    yCoor += dY;
    //}
    
    /*if(xCoor > width - enemyW){
      xCoor = 0;
    }
    if(yCoor > height - enemyH){
      yCoor = 0;
    }*/
    
    
    // Reflect off walls
    /*if(xCoor > width - enemyW){
      xCoor = width - enemyW - dX - 30;
      dX *= -1;
    } else if(xCoor < 0){
      xCoor = dX + 30;
      dX *= -1;
    }
    //println("Changed dx");
    if(yCoor > height - enemyH){
      yCoor = height -  enemyH - dY - 30;
      dY *= -1;
    } else if(yCoor < 0){
      yCoor = dY + 30;
      dY *= -1;
    }
    //println("Changed dy");
    println(dX + ", " + dY);
    println(xCoor + ", " + yCoor);*/
  }
  
  
}
  
