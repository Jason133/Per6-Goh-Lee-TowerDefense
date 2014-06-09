import java.io.File;
import java.util.Scanner;
import java.util.ArrayList;

// Visual Grpahical Stuff
private PImage img[] = new PImage[2];  
private int i=1;
private PImage pm ;
private int[][] map = new int[14][15];
// ArrayList of Enemies
private ArrayList<Enemy>  e = new ArrayList<Enemy>();
private ArrayList<Tower>  t = new ArrayList<Tower>();  
private ArrayList<Projectile> pList = new ArrayList<Projectile>();
private ArrayList<Integer> pCoorList = new ArrayList<Integer>(); // Even numbers: xCoor; Odd numbers: yCoor
// Array of Buttons (only filled 3 so far)
private Button[] b = new Button[15]; 
// Cell
private Cell cell ;
// Paused checker
private boolean paused = false; 
// Nothing for now
private PFont f;

Player player = new Player();
int damageTaken;
int p1TempXCoor; // = tower.getTowerXCoor();
int p1TempYCoor; // = tower.getTowerYCoor();

boolean maxEnemies; // Max number of enemies spawned


// Setup
public void setup () {
  // Size of screen
  size (750, 750);
  background(200);
  // Image loading stuff
  cell = new Cell();  
  PImage p = loadImage("tileground.png");
  pm = new PImage(750, 700);
  img[0] = p.get(0, 0, 26, 26);
  img[1] = p.get(0, 26, 26, 26);  
  img[0].resize(50, 50);
  img[1].resize(50, 50);
  // Tower Button
  Button towerbutton1 = new Button(); 
  towerbutton1.setup("towerpic.png"); 
  towerbutton1.setXY(0, 14); 
  b[0] = towerbutton1;
  // Pause Button
  Button pausebutton = new Button(); 
  pausebutton.setup("pause.png");
  pausebutton.setXY(14, 14); 
  b[14] = pausebutton;
  // Play Button
  Button playbutton = new Button(); 
  playbutton.setup("play.png");
  playbutton.setXY(13, 14);
  b[13] = playbutton;
  // The Map is displayed
  try {
    Scanner loadScanner = new Scanner(new File( dataPath("map.txt") ) );
    int x = 0 ;
    int y = 0 ;
    while (loadScanner.hasNext ()) {
      if (x > 14) {
        x = 0 ;
        y++;
      }
      map[y][x] = loadScanner.nextInt() ;
      pm.set(x*50, y*50, img[map[y][x]]);

      x++;
    }
  }
  catch (Exception e) {
    println("ERROR");
  }
  // Generates an enemy
  Enemy enemy = new Enemy() ;
  enemy.setup();
  enemy.setMap(map) ;
  e.add(enemy);
}

// This checks where your mouse is, and highlights it 
public void mouseCheck() {
  int x = (int)(mouseX / 50);
  int y = (int)(mouseY / 50);
  cell.setXY(x, y);
}

// Does stuff if mouse is clicked
public void mouseClicked() {
  // Gets the Tile where you are at (divide by 50 since its a 750x700 pixel)
  int x = (int)(mouseX / 50);
  int y = (int)(mouseY / 50);
  // Used for debugging in terminal
  println(x, y) ;
  // Boolean for the check
  // Setpushed sets it to the opposite of what it was
  if (y == 14 && x == 0) {
    b[0].setPushed();
  }
  // Resumes the game
  if (y == 14 && x == 13) {
    paused = false;
  }
  // Pauses the game
  if (y == 14 && x == 14) {
    paused = true;
  }
  // If you pushed down the tower thing, and you are in range, you can put towers
  
  // We will need to change this when we have multiple towers
  if ( y < 14 && x < 13 && map[y][x] == 0 && b[0].getPushed() == true) {
    Tower tower = new Tower(1);
    if(player.getGold() >= tower.getTowerCost()){
      map[y][x] = 2 ;
      //Tower tower = new Tower();
      tower.setup();
      tower.setXY(x, y);
      t.add(tower);
      Tile tile = new Tile();
      pCoorList.add(tower.getTowerXCoor() * tile.getTileW());
      pCoorList.add(tower.getTowerYCoor() * tile.getTileH());
      player.setGold(player.getGold() - tower.getTowerCost());
    }
  }
}

// Draw Method
public void draw () {
  // Commented the below out
  //background(pm);
  // Runs if it is NOT PAUSED 
  if (!paused) {
    image(pm, 0, 0, 750, 700);
    // Does the mouse and outline thing
    mouseCheck();
    cell.outlineMe();
    // Enemy Spawner
    //if (i++ % 40 == 0) {
      //if(!maxEnemies){
      //for(int z = 0; z < 10; z ++){
      Enemy enemy = new Enemy() ;
      enemy.setup();
      enemy.setMap(map) ;
      e.add(enemy);
      //}
      //maxEnemies = true;
      //}
  }
    // Displays the buttons
    for (int j = 0; j < b.length; j++) {
      if (b[j] != null) {
        b[j].display();
      }
    }
    // If its killed, remove it
    for (int j = 0; j < e.size (); j++) {
      while (e.get (j).isKilled()) {
        e.remove(j);
      }
      // Displays it
      e.get(j).display();
    }
  }
  // Displays score, gold, and lives
  // Wack titty - jumble of text on the bottom 
  player.updateDisplay();
  
  // --------------  Partitioned
  
  // Each tower checks if there is an enemy within its range using the target's x and y coordinates
  // then proceeds to load a projectile, which act's like a heat-seeking missle
  for(int i = 0; i < t.size(); i ++){
  //for(Tower tower: t){
    int target = 0;
    Tile tile = new Tile();
    /*while(! t.get(i).inRange(e.get(target).getEnemyXCoor(), e.get(target).getEnemyYCoor())){
      target ++;
    }*/
    if(! t.get(i).inRange(e.get(target).getEnemyXCoor(), e.get(target).getEnemyYCoor())){
      target ++;
    }
    if(t.get(i).inRange(e.get(target).getEnemyXCoor(), e.get(target).getEnemyYCoor())){
      Projectile p = new Projectile(pCoorList.get(i * 2), pCoorList.get(i * 2 + 1), t.get(i).getTowerType());
      if(t.get(i).getTowerType() == 1){
        fill(225, 80, 50);
        ellipse(pCoorList.get(i * 2) /** tile.getTileW()*/ + tile.getTileW()/2, pCoorList.get(i * 2 + 1)/* * tile.getTileH()*/ + tile.getTileW()/2, 20, 20);
        p.setProjectileXCoor(pCoorList.get(i * 2));
        p.setProjectileYCoor(pCoorList.get(i * 2 + 1));
      }
      p.changeDirection(e.get(target));
      pCoorList.set(i * 2, p.getProjectileXCoor());
      pCoorList.set(i * 2 + 1, p.getProjectileYCoor());

      int distX = pCoorList.get(i * 2) - e.get(target).getEnemyXCoor();
      int distY = pCoorList.get(i * 2 + 1) - e.get(target).getEnemyYCoor();
      //println(target);

      //println(distX + ", " + distY);
      // If the enemy and the projectile are near each other, the enemy will take damage and possibly die
      if((abs(distX) < 50) && (abs(distY) < 50)){
        p.setProjectileXCoor(t.get(0).getTowerXCoor() * tile.getTileW());
        p.setProjectileYCoor(t.get(0).getTowerYCoor() * tile.getTileH());
        pCoorList.set(i * 2, p.getProjectileXCoor());
        pCoorList.set(i * 2 + 1, p.getProjectileYCoor());
        // Deals appropriate amount of damage and removes the enemy if it runs out of health
        damageTaken += t.get(i).getTowerDamage();
        if(e.get(target).getEnemyHealth() - damageTaken <= 0){
          player.setGold(player.getGold() + e.get(target).getEnemyBounty());
          player.setScore(player.getScore() + e.get(target).getEnemyPointWorth());
          e.get(target).setEnemyXCoor(width + 100); //
          e.get(target).setEnemyYCoor(height + 100);
          e.remove(target);
          println("Killed an enemy");
        }
      }
                
      // If the projectile is out of the boundaries of the screen, it returns to the tower's coordinates
      if(pCoorList.get(i * 2) - width > 10 || pCoorList.get(i * 2 + 1) - height > 10){
        p.setProjectileXCoor(t.get(i).getTowerXCoor() * tile.getTileW());
        p.setProjectileYCoor(t.get(i).getTowerYCoor() * tile.getTileH());
        pCoorList.set(i * 2, p.getProjectileXCoor());
        pCoorList.set(i * 2 + 1, p.getProjectileYCoor());
      }
    }    
  }
  
  // ---------------- Partitioned
   
  
  // Below ALWAYS RUNS
  for (int j = 0; j < t.size (); j++) {
    t.get(j).display();
  }
}

