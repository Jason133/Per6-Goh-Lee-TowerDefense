int x, y, tileW, tileH, outsideW, outsideH;
int towerX, towerY, projectileXCoor, projectileYCoor;
int tower1W, tower1H, t1XCoor, t1YCoor;
int tower2W, tower2H, t2XCoor, t2YCoor;
int enemy1XCoor, enemy1YCoor, enemy1W, enemy1H, enemyDX, enemyDY, enemyHealth;

double projectileSpeed, projectileDX, projectileDY;

void setup() {  
  //background(200);
  size(750, 750);
  x = 50;
  y = 50; 
  tileW = 50;
  tileH = 50;
  outsideW = width + 100;
  outsideH = height + 100;

  projectileDX = 2;
  projectileDY = 2;
  projectileSpeed = 5;

  tower1W = tileW - 12;
  tower1H = tileH - 12;
  t1XCoor = 200;
  t1YCoor = 200;

  tower2W = tileW - 16;
  tower2H = tileH - 16;
  t2XCoor = 400;
  t2YCoor = 400;

  towerX = 125;
  towerY = 125;
  projectileXCoor = towerX;
  projectileYCoor = towerY;

  enemy1XCoor = 213;
  enemy1YCoor = 1;
  enemy1W = 24;
  enemy1H = 24;
  enemyDX = -2;
  enemyDY = 1;
  enemyHealth = 5;
}

// ----------------------------------
// Tower class

// Some data structure containing all the towers and enemies on the map

class Tower {
  int type, range;
  String projectileShape;
  Tower(int xCoor, int yCoor, int type) {
    this.type = type;
    if (type == 1) {
      fill(225, 80, 50);
      rect(xCoor + (tileW - tower1W)/2, yCoor + (tileH - tower1H)/2, tower1W, tower1H);
      ellipse(xCoor + tileW/2, yCoor + tileH/2, 40, 40);
      range = 200;
    } else if (type == 2) { 
      fill(100, 225, 80);
      rect(xCoor + (tileW - tower2W)/2, yCoor + (tileH - tower2H)/2, tower2W, tower2H);
      ellipse(xCoor + tileW/2, yCoor + tileH/2, 40, 40);
      range = 300;
    } else {
      println("Not a valid tower type");
    }
  }

  // New tower! 
  /*void tower(int xCoor, int yCoor, int type) {
   if (type == 1) {
   fill(225, 80, 50);
   rect(xCoor + (tileW - tower1W)/2, yCoor + (tileH - tower1H)/2, tower1W, tower1H);
   ellipse(xCoor + tileW/2, yCoor + tileH/2, 40, 40);
   } else if (type == 2) { 
   fill(100, 225, 80);
   rect(xCoor + (tileW - tower1W)/2, yCoor + (tileH - tower1H)/2, tower1W, tower1H);
   ellipse(xCoor + tileW/2, yCoor + tileH/2, 40, 40);
   } else {
   println("Not a valid tower type");
   }
   }*/

  int getType() {
    return type;
  }

  int getRange() {
    return range;
  }

  // will be enemy class later for parameter
  boolean inRange(int enemyXCoor, int enemyYCoor) { 
    int diffX = abs(enemyXCoor - t1XCoor);
    int diffY = abs(enemyYCoor - t1YCoor);
    //println((sqrt(sq(diffX) + sq(diffY)) < t1Range + 200));
    return (sqrt(sq(diffX) + sq(diffY)) < range);
  }

  void createProjectile(int towerXCoor, int towerYCoor/*, int targetXCoor, int targetYCoor*/) {
    if (type == 1) {
      fill(225, 80, 50);
      projectileXCoor = t1XCoor + tileW/2;
      projectileYCoor = t1YCoor + tileH/2;
      ellipse(projectileXCoor, projectileYCoor, 5, 5);
      projectileShape = "ellipse";
      //moveProjectile(towerXCoor, towerYCoor, targetXCoor, targetYCoor);
    } else if (type == 2) {
      fill(100, 225, 80);  
      projectileXCoor = t2XCoor + tileW/2;
      projectileYCoor = t2YCoor + tileH/2;
      triangle(projectileXCoor + 5, projectileYCoor - 3, projectileXCoor - 5, 
      projectileYCoor - 3, projectileXCoor, projectileYCoor + 3);
      projectileShape = "triangle";
      //moveProjectile(towerXCoor, towerYCoor, targetXCoor, targetYCoor);
    } else {
      return;
    }
  }

  void shootProjectile(int towerXCoor, int towerYCoor, int targetXCoor, int targetYCoor) {
    if (inRange(targetXCoor, targetYCoor)) {
      createProjectile(towerXCoor, towerYCoor);
      /*if (projectileShape.equals("ellipse")) {
        ellipse(projectileXCoor, projectileYCoor, 5, 5);
      } else if (projectileShape.equals("triangle")) {
        triangle(projectileXCoor + 5, projectileYCoor - 3, projectileXCoor - 5, 
        projectileYCoor - 3, projectileXCoor, projectileYCoor + 3);
      } else {
        return;
      }*/


      projectileSpeed = 5;

      // Find the distance between the projectile and the projectile's origin
      int deltaX = (enemy1XCoor + enemyDX * 3) - projectileXCoor;
      int deltaY = (enemy1YCoor + enemyDY * 3) - projectileYCoor;

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
      if (abs(projectileXCoor - enemy1XCoor) < enemy1W/4 && 
        abs(projectileYCoor - enemy1YCoor) < enemy1H/4) {
        if (abs(projectileXCoor - enemy1XCoor) > enemy1W/8 &&
          abs(projectileYCoor - enemy1YCoor) > enemy1H/8) {
          enemyHealth --;
          println(enemyHealth);
        }
        // Remove enemy from grid once it runs out of health
        if (enemyHealth <= 0) {
          enemyDX = 0;
          enemyDY = 0;
          enemy1XCoor = outsideW;
          enemy1YCoor = outsideH;
        }
        projectileDX = 0;
        projectileDY = 0;
        projectileSpeed = 0;
        projectileXCoor = outsideW;
        projectileXCoor = outsideH;
      }
      
    }
  }


  // Only shoots when the enemy leaves the range
  // Do I need the tower's coor as parameters? - will also use enemy class for param
  /*  void shootProjectile(int towerXCoor, int towerYCoor, int targetXCoor, int targetYCoor) {
   if (inRange(targetXCoor, targetYCoor)) {
   //tower's projectile 
   if (type == 1) {
   fill(225, 80, 50);
   projectileXCoor = t1XCoor + tileW/2;
   projectileYCoor = t1YCoor + tileH/2;
   ellipse(projectileXCoor, projectileYCoor, 5, 5);
   } else if (type == 2) {
   fill(100, 225, 80);  
   projectileXCoor = t2XCoor + tileW/2;
   projectileYCoor = t2YCoor + tileH/2;
   triangle(projectileXCoor + 5, projectileYCoor - 3, projectileXCoor - 5, 
   projectileYCoor - 3, projectileXCoor, projectileYCoor + 3);
   } else {
   return;
   }
   }
   projectileSpeed = 5;
   
   //this line makes them connected like one is pulling the other
   //projectileDX = -1 * (projectileXCoor - enemy1XCoor)/(enemyDX * 30);
   
   // Find the distance between the projectile and the projectile's origin
   int deltaX = (enemy1XCoor + enemyDX * 3) - projectileXCoor;
   int deltaY = (enemy1YCoor + enemyDY * 3) - projectileYCoor;
   
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
   if (abs(projectileXCoor - enemy1XCoor) < enemy1W/4 && 
   abs(projectileYCoor - enemy1YCoor) < enemy1H/4) {
   if (abs(projectileXCoor - enemy1XCoor) > enemy1W/8 &&
   abs(projectileYCoor - enemy1YCoor) > enemy1H/8) {
   enemyHealth --;
   println(enemyHealth);
   }
   if (enemyHealth <= 0) {
   enemyDX = 0;
   enemyDY = 0;
   enemy1XCoor = outsideW;
   enemy1YCoor = outsideH;
   }
   projectileDX = 0;
   projectileDY = 0;
   projectileSpeed = 0;
   projectileXCoor = outsideW;
   projectileXCoor = outsideH;
   }
   }
   */
}



// ----------------------------------


void draw() {
  background(200);
  // Makes a grid of tiles
  for (int i = 0; i < width / 50; i ++) {
    for (int j = 0; j < height / 50; j ++) {
      fill(0, 160, 50); // red, blue, green
      rect(tileW * i, tileH * j, tileW, tileH);
    }
  }

  // Testing tower method
  Tower t1 = new Tower(t1XCoor, t1YCoor, 1);
  Tower t2 = new Tower(t2XCoor, t2YCoor, 2);
  t1.shootProjectile(t1XCoor, t1YCoor, enemy1XCoor, enemy1YCoor);
  t2.shootProjectile(t2XCoor, t2YCoor, enemy1XCoor, enemy1YCoor);

  //tower
  //fill(225, 80, 50); 
  //ellipse(towerX, towerY, 40, 40);

  /*
  //tower's projectile 
   ellipse(projectileXCoor, projectileYCoor, 5, 5);
   //this line makes them connected like one is pulling the other
   //projectileDX = -1 * (projectileXCoor - enemy1XCoor)/(enemyDX * 30);
   
   // Find the distance between the projectile and the projectile's origin
   int deltaX = (enemy1XCoor + enemyDX * 3) - projectileXCoor;
   int deltaY = (enemy1YCoor + enemyDY * 3) - projectileYCoor;
   
   // Calculate the angle at which the projectile will be launched to intercept the target
   float angle = atan2(deltaY, deltaX);
   
   // Break up the vector into the x and y components
   projectileDX = cos(angle) * projectileSpeed;
   projectileDY = sin(angle) * projectileSpeed;
   
   // Change the coords of the projectile
   projectileXCoor += projectileDX;
   projectileYCoor += projectileDY;
   
   // If the projectile enters the target's space, it is removed from the visible grid
   if (abs(projectileXCoor - enemy1XCoor) < enemy1W/4 && 
   abs(projectileYCoor - enemy1YCoor) < enemy1H/4) {
   projectileDX = 0;
   projectileDY = 0;
   projectileSpeed = 0;
   projectileXCoor = outsideW;
   projectileXCoor = outsideH;
   }
   */

  // enemy1
  fill(100, 175, 50);
  rect(enemy1XCoor, enemy1YCoor, enemy1W, enemy1H);
  enemy1XCoor += enemyDX;
  enemy1YCoor += enemyDY;
  //reverse direction if hits edge of window
  if (enemy1XCoor > width - enemy1W || enemy1XCoor < 0) {
    enemyDX *= -1;
  }
  if (enemy1YCoor > height - enemy1H || enemy1YCoor < 0) {
    enemyDY *= -1;
  }
}  

// it may be hard to calculate the pos of enemy so long ranged 
//     units should be some sort of laser rather than a projectile
//     especially if there are corners for the enemy path

// Possible upgrade: fast foward or slow down
// Focus on a specified enemy using cursor location (pressed)

