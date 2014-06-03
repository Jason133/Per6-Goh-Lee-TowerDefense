int x, y, tileW, tileH, outsideW, outsideH;
int towerX, towerY, projectileXCoor, projectileYCoor;
int tower1W, tower1H, t1XCoor, t1YCoor, t1Range;
int enemy1XCoor, enemy1YCoor, enemy1W, enemy1H, enemyDX, enemyDY;

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
  t1Range = 200;

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
}

// ----------------------------------
// Tower Methods

// New tower! - should it be diff towers in one method or each one its own
void tower(int xCoor, int yCoor, int type) {
  if (type == 1) {
    fill(225, 80, 50);
    rect(xCoor + (tileW - tower1W)/2, yCoor + (tileH - tower1H)/2, tower1W, tower1H);
    ellipse(xCoor + tileW/2, yCoor + tileH/2, 40, 40);
  } else {
    println("Not a valid tower type");
  }
}

// will be enemy class later for parameter
boolean t1InRange(int enemyXCoor, int enemyYCoor) { 
  int diffX = abs(enemyXCoor - t1XCoor);
  int diffY = abs(enemyYCoor - t1YCoor);
  //println((sqrt(sq(diffX) + sq(diffY)) < t1Range + 200));
  return (sqrt(sq(diffX) + sq(diffY)) < t1Range);
}

// Only shoots when the enemy leaves the range
// Do I need the tower's coor as parameters? - will also use enemy class for param
void t1ShootProjectile(int towerXCoor, int towerYCoor, int targetXCoor, int targetYCoor) {
  if (t1InRange(targetXCoor, targetYCoor)) {
    //tower's projectile 
    projectileXCoor = t1XCoor + tileW/2;
    projectileYCoor = t1YCoor + tileH/2;

    ellipse(projectileXCoor, projectileYCoor, 5, 5);
    projectileSpeed = 5;

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
  }
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
  tower(t1XCoor, t1YCoor, 1);
  t1ShootProjectile(t1XCoor, t1YCoor, enemy1XCoor, enemy1YCoor);  

  //tower
  fill(225, 80, 50); 
  ellipse(towerX, towerY, 40, 40);


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

