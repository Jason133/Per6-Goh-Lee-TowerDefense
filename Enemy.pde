class Enemy {
  // Has its own x,y tile and speed
  private int tileX, tileY, speed;
  // Its pixel x,y
  private int x, y;
  //directions set
  private int up = 0, down = 1, left = 2, right = 3 ;
  //initally set right
  private int direction = 3 ;
  // runs with papplet
  private PApplet parent;
  // 2d int array map
  private int [][] map ;
  private boolean killed = false ;
  private PImage pi = loadImage("enemy.png");
  int type, health, lifeCost, bounty, pointWorth;
  
  int getEnemyXCoor(){
    return x;
  }
  int getEnemyYCoor(){
    return y;
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
  int getEnemyPointWorth(){
    return pointWorth;
  }
  
  void setEnemyXCoor(int xCoor){
    x = xCoor;
  }
  void setEnemyYCoor(int yCoor){
    y = yCoor;
  }
  void setEnemyHealth(int health){
    this.health = health;
  }
       
  ArrayList<Integer> getEnemyPath(){
    try{
      Scanner s = new Scanner(new File(dataPath("map.txt")));
      ArrayList<Integer> enemyPath = new ArrayList<Integer>();
      int counter = 0;
      while(s.hasNext()){
        if(s.nextInt() == 1){
          enemyPath.add((int)(counter/15)); // Row
          enemyPath.add(counter % 15); // Column
        }
      }
      return enemyPath;
    }
    catch(Exception e){
      println("Error");
      return null;
    }
  }
  
  int getEnemyTileX(){
    return (int)(x / 50);
  }
  int getEnemyTileY(){
    return (int)(y / 50);
  }
        

  void setup() {
    tileX = 0;              // All stripes start at 0
    speed = 2;
    tileY=0;
    x=0;
    y=0;
  }
  
  Enemy(){
    tileX = 0;              // All stripes start at 0
    speed = 2;
    tileY=0;
    x=0;
    y=0;
  }
  
  Enemy(int spawnX, int spawnY, int type){
    //this.spawnX = spawnX;
    //this.spawnY = spawnY;
    x = spawnX;
    y = spawnY;
    this.type = type;
    if(type == 1){
      //enemyW = 24;
      //enemyH = 24;
      //dX = 2;
      //dY = 2;
      speed = 2;
      health = 1;
      bounty = 10;
      lifeCost = 1;
      fill(100, 175, 50);
    }
  }
  
  // Spawns at origin
  Enemy(int type){
    x = 0;
    y = 0;
    if(type == 1){
      //enemyW = 24;
      //enemyH = 24;
      //dX = 2;
      //dY = 2;
      speed = 2;
      health = 1;
      bounty = 10;
      lifeCost = 1;
      fill(100, 175, 50);
    }
  }  

  void setMap(int[][] map) {
    this.map = new int[map.length][map[0].length] ;
    for (int i=0; i<map.length; i++)
      for (int j=0; j<map[i].length; j++)
        this.map[i][j]=map[i][j];
  }

  Boolean isKilled() {
    return killed ;
  }

  // Draw stripe
  // Displays and movement changers
  void display() {
    if (map[tileY][tileX+1] == 1) {
      direction = 3 ;
      x+=speed ;
    } else if ( tileY < 13 && (map[tileY+1][tileX] == 1)) {
      direction = 1 ;
      y+=speed ;
    } else if ( tileX > 0 && (map[tileY][tileX-1] == 1) ) {
      direction = 2 ;
      x-=speed ;
    } else if (map[tileY-1][tileX] == 1) {
      direction = 0 ;
      y-=speed ;
    } else {
      killed = true ;
    }
    //check borders
    if ( ( direction == left || direction == right) && (x % 50 == 0 ) ) {
      if (map[tileY][tileX+1] == 1) {
        tileX++ ;
      } else if ( tileX > 0 && (map[tileY][tileX-1] == 1) ) {
        tileX-- ;
      }
    } else if ( ( direction == up || direction == down) && (y % 50 == 0 ) ) {
      if ( tileY < 13 && (map[tileY+1][tileX] == 1)) {
        tileY++ ;
      } else if (map[tileY-1][tileX] == 1) {
        tileY--;
      }
    }
    map[tileY][tileX] = 0 ;
    image(pi, x, y, 50, 50);
  }
}

