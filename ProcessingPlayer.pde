class Player {

  int gold, score, lives;

  Player() {
    gold = 200;
    score = 0;
    lives = 20;
  }

  // Accessors
  int getGold() {
    return gold;
  }
  int getScore() {
    return score;
  }
  int getLives() {
    return lives;
  }

  // Mutators
  void setScore(int score) {
    this.score = score;
  }
  void setGold(int gold) {
    this.gold = gold;
  }
  void setLives(int lives) {
    this.lives = lives;
  }

  void purchaseTower(int towerType) {
    Tower t = new Tower(towerType);
    gold -= t.getTowerCost();
  }

  // Towers sell for 70% of cost
  void sellTower(int towerType) {
    Tower t = new Tower(towerType);
    gold += (int)(0.7 * t.getTowerCost());
  }

  void updateDisplay() {
    String s = "Score: " + score + " Gold: " + gold + " Lives: " + lives;
    PFont f;
    f = createFont("Arial", 16, true);
    textFont(f, 16);
    fill(0);
    textAlign(CENTER);
    text(s, width/2, 725);
  }
}

// Displays the score, gold, and lives of the player
//PFont f;

// For enemy:
int enemyXCoor, enemyYCoor, enemyHealth;
int projectileXCoor, projectileYCoor;
//float dX, dY;
//float speed = 100;
//int outsideW = width + 100;
//int outsideH = height + 100;

void setup() {
  size(750, 750);
  Enemy e = new Enemy(1);
  Tower t = new Tower(100, 100, 1);
  enemyHealth = e.getEnemyHealth();
  //f = createFont("Arial", 16, true);
  //Player p = new Player();
}

void draw() {
  int outsideW = width + 100;
  int outsideH = height + 100;
  background(255);
  // Use TOWER TILE LATER
  // Makes a grid of tiles
  Tile tile = new Tile();
  for (int i = 0; i < width / 50; i ++) {
    for (int j = 0; j < height / 50; j ++) {
      fill(0, 160, 50); // red, blue, green
      rect(tile.getTileW() * i, tile.getTileH() * j, tile.getTileW(), tile.getTileH());
    }
  }

  /*
  Tower t = new Tower(100, 100, 1);
   t.displayTower(100, 100, 1);
   if(t.inRange(e.getEnemyXCoor(), e.getEnemyYCoor())){
   t.shootProjectile(e.getEnemyXCoor(), e.getEnemyYCoor());
   }
   */

  Player p = new Player();
  p.updateDisplay();
  p.purchaseTower(1);

  Enemy e = new Enemy(enemyXCoor, enemyYCoor, 1);
  /*if (enemyXCoor > width - e.getEnemyW() || enemyXCoor < 0) {
   e.setEnemyDX(e.getEnemyDX() * - 1);
   }
   if (enemyYCoor > height - e.getEnemyH() || enemyYCoor < 0) {
   e.setEnemyDY(e.getEnemyDY() * - 1);
   }*/
  e.move();
  enemyXCoor += e.getEnemyDX();
  enemyYCoor += e.getEnemyDY();
  boolean notDead = true;
  if(notDead){
    if (enemyXCoor > width - e.getEnemyW() && abs(enemyXCoor - outsideW) > 50) {
      enemyXCoor = 0;
    }
    if (enemyYCoor > height - e.getEnemyH() && abs(enemyYCoor - outsideH) > 50) {
      enemyYCoor = 0;
    }
  }
  
  Tower t = new Tower(100, 100, 1);
  t.displayTower(100, 100, 1);


  //int projectileXCoor = t.getTowerXCoor() + tile.getTileW()/2;
  //int projectileYCoor = t.getTowerYCoor() + tile.getTileH()/2;
  //ellipse(projectileXCoor + t.getTowerXCoor() + tile.getTileW()/2, projectileYCoor + t.getTowerYCoor() + tile.getTileH()/2, 5, 5);

  /*float dX, dY;
   int speed = 5;
   int outsideW = width + 100;
   int outsideH = height + 100;
   */
  if (t.inRange(e.getEnemyXCoor(), e.getEnemyYCoor())) {
    //ellipse(projectileXCoor, projectileYCoor, 5, 5);
    ellipse(projectileXCoor + tile.getTileW()/2 /*+ t.getTowerXCoor() + tile.getTileW()/2*/, projectileYCoor + tile.getTileH()/2 /*+ t.getTowerYCoor() + tile.getTileH()/2*/, 5, 5);

    // Find the distance between the projectile and the projectile's origin
    int deltaX = (e.getEnemyXCoor() + e.getEnemyDX() * 3) - projectileXCoor;
    int deltaY = (e.getEnemyYCoor() + e.getEnemyDY() * 3) - projectileYCoor;

    // Calculate the angle at which the projectile will be launched to intercept the target
    float angle = atan2(deltaY, deltaX);

    int speed = 7;

    // Break up the vector into the x and y components
    float dX = (cos(angle) * speed);
    float dY = (sin(angle) * speed);

    // Change the coords of the projectile
    projectileXCoor += dX;
    projectileYCoor += dY;

    // If the projectile enters the target's space, the projectile is removed from the visible grid and the target loses health and is removed when its health reaches 0
    if (abs(projectileXCoor - e.getEnemyXCoor()) < 10 &&
      abs(projectileYCoor - e.getEnemyYCoor()) < 10) {
      /*if (abs(projectileXCoor - e.getEnemyXCoor) > 0 &&
       abs(projectileYCoor - e.getEnemyYCoor) > 0) {*/
      e.setEnemyHealth(enemyHealth --);
      println(e.getEnemyHealth());
      //}
      // Remove target from grid once it runs out of health
      if (enemyHealth <= 0) {
        notDead = false;
        e.setEnemyDX(0);
        e.setEnemyDY(0);
        //e.setEnemyXCoor(outsideW);
        //e.setEnemyYCoor(outsideW);
        enemyXCoor = outsideW;
        enemyYCoor = outsideH;
      }
      dX = 0;
      dY = 0;
      speed = 0;
      projectileXCoor = t.getTowerXCoor();
      projectileYCoor = t.getTowerYCoor();
    }
  }

  /*if (enemyXCoor > width - e.getEnemyW() || enemyXCoor < 0) {
   e.setEnemyDX(e.getEnemyDX() * - 1);
   }
   if (enemyYCoor > height - e.getEnemyH() || enemyYCoor < 0) {
   e.setEnemyDY(e.getEnemyDY() * - 1);
   }*/
}




/*
class Player{
 
 int gold, score, lives;
 
 Player(){
 gold = 200;
 score = 0;
 lives = 20;
 }
 
 // Accessors 
 int getGold(){
 return gold;
 }
 int getScore(){
 return score;
 }
 int getLives(){
 return lives;
 }
 
 // Mutators
 void setScore(int score){
 this.score = score;
 }
 void setGold(int gold){
 this.gold = gold;
 }
 void setLives(int lives){
 this.lives = lives;
 }
 
 void purchaseTower(int towerType){
 Tower t = new Tower(towerType);
 gold -= t.getTowerCost();
 }
 
 // Towers sell for 70% of cost
 void sellTower(int towerType){
 Tower t = new Tower(towerType);
 gold += (int)(0.7 * t.getTowerCost());
 }
 
 }
 
 // Displays the score, gold, and lives of the player
 PFont f;
 
 void setup(){
 size(750, 750);
 f = createFont("Arial", 16, true);
 //Player p = new Player();
 }
 
 void draw(){
 background(255);
 // Use TOWER TILE LATER
 // Makes a grid of tiles
 Tile tile = new Tile();
 for(int i = 0; i < width / 50; i ++){
 for(int j = 0; j < height / 50; j ++){
 fill(0, 160, 50); // red, blue, green
 rect(tile.getTileW() * i, tile.getTileH() * j, tile.getTileW(), tile.getTileH());
 }
 }
 
 Tower t = new Tower(100, 100, 1);
 t.displayTower(100, 100, 1);
 
 // Displays player's score, gold, and lives
 textFont(f, 16);
 fill(0);
 Player p = new Player();
 String s = "Score: " + p.getScore() + "      Gold: " + p.getGold() + "      Lives: " + p.getLives();
 text(s, 285, 725);
 
 
 }
 
 */
