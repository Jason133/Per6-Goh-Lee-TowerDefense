import java.io.File;
import java.util.Scanner;
import java.util.ArrayList;
import java.lang.Math.* ;

private int height = 14;
private int width = 15;
private int cellPixels = 50;
private int frameCounter = 1;
private PImage pm;
private int[][] map = new int[height][width];
// ArrayList of Enemies
private ArrayList<Enemy> e = new ArrayList<Enemy>();
private ArrayList<Tower> t = new ArrayList<Tower>();
// Array of Buttons (only filled 3 so far)
private Button[] b = new Button[15];
// Cell
private Cell cell;
private int spawnTileX, spawnTileY ;
private Player player = new Player() ;
private int level = 1 ;
private int totalEnemies = 10;
private int spawnSpeed = 50 ;
private boolean gameOver = false; 

// Paused checker
private boolean paused = false;
// Nothing for now
private PFont f;

public void setup() {

  // Size of Window
  size(width * cellPixels, height * cellPixels + cellPixels);

  f = createFont("Arial", 16, true);

  cell = new Cell(0, 0);

  // Load Ground and Path Images
  PImage p = loadImage("tilegroundfinal.png");
  PImage img[] = new PImage[2];
  pm = new PImage(width * cellPixels, height * cellPixels);
  img[0] = p.get(0, cellPixels, cellPixels, cellPixels);
  img[1] = p.get(0, 0, cellPixels, cellPixels);


  // Tower Button- Type 1; 
  Button towerbutton1 = new Button("Tower1.png");
  towerbutton1.setXY(0, 14);
  b[0] = towerbutton1;
  // Tower Button- Type 2; 
  Button towerbutton2 = new Button("Tower2.png");
  towerbutton2.setXY(1, 14);
  b[1] = towerbutton2;
  // Tower Button- Type 3; 
  Button towerbutton3 = new Button("Tower3.png");
  towerbutton3.setXY(2, 14);
  b[2] = towerbutton3;

  // Pause Button
  Button pausebutton = new Button("pause.png");
  // pausebutton.setup("pause.png");
  pausebutton.setXY(14, 14);
  b[14] = pausebutton;
  // Play Button
  Button playbutton = new Button("play.png");
  // playbutton.setup("play.png");
  playbutton.setXY(13, 14);
  b[13] = playbutton;

  // Load Map from map.txt file
  try {
    Scanner loadScanner = new Scanner(new File(dataPath("map.txt")));
    int column = 0;
    int row = 0;
    Boolean spawnPointFound = false;
    while (loadScanner.hasNext ()) {
      if (column > 14) {
        column = 0;
        row++;
      }
      map[row][column] = loadScanner.nextInt();
      if (!spawnPointFound && map[row][column] == 1) {
        spawnTileX = column;
        spawnTileY = row;
        spawnPointFound = true;
      }
      pm.set(column * 50, row * 50, img[map[row][column]]);
      column++;
    }
  } 
  catch (Exception e) {
    println("ERROR loading map.txt");
  }
  // Generates an enemy
  Enemy enemy = new Enemy(map);
  enemy.setX(spawnTileX);
  enemy.setY(spawnTileY);
  enemy.setLevel(level);
  e.add(enemy);
  frameRate(40);
}

public void mouseCheck() {
  int x = (int) (mouseX / 50);
  int y = (int) (mouseY / 50);
  cell.setXY(x, y);
}

public void mouseClicked() {
  // Gets the Tile where you are at (divide by 50 since its a 750x700
  // pixel)
  int x = (int) (mouseX / 50);
  int y = (int) (mouseY / 50);

  // Boolean for the check
  // Setpushed sets it to the opposite of what it was
  if (y == height && x == 0) {
    b[0].setPushed();
  } else if (y == height && x == 1) {
    b[1].setPushed();
  } else if (y == height && x == 2) {
    b[2].setPushed();
  }
  // Resumes the game
  if (y == height && x == 13) {
    paused = false;
  }
  // Pauses the game
  if (y == height && x == 14) {
    paused = true;
  }
  // If you pushed down the tower thing, and you are in range, you can put
  // towers
  if (y < height && x < width && map[y][x] == 0
    && b[0].getPushed() == true && player.getGold() >= 100) {
    map[y][x] = 2;
    player.setGold(-100);
    Tower tower = new Tower();
    // tower.setup();
    tower.setXY(x, y);
    tower.setPlayer(player);
    tower.setTowerType(0);
    t.add(tower);
  } else if (y < height && x < width && map[y][x] == 0 
    && b[1].getPushed() == true && player.getGold() >= 1000) {
    map[y][x] = 2;
    player.setGold(-1000);
    Tower tower = new Tower();
    // tower.setup();
    tower.setXY(x, y);
    tower.setPlayer(player);
    tower.setTowerType(1);
    t.add(tower);
  } else if (y < height && x < width && map[y][x] == 0 
    && b[2].getPushed() == true && player.getGold() >= 5000) {
    map[y][x] = 2;
    player.setGold(-5000);
    Tower tower = new Tower();
    // tower.setup();
    tower.setXY(x, y);
    tower.setPlayer(player);
    tower.setTowerType(2);
    t.add(tower);
  }
}


public void draw() {
  if (!gameOver) {
    if (!paused) {
      background(255);
      image(pm, 0, 0, width * cellPixels, height * cellPixels);

      String s = "Level: "+level+" Score: " + player.getScore() + " Gold: " + player.getGold() + " Lives: " + player.getLives() + "\n Towers cost: 100, 1000, and 5000. You get 10 gold per enemy killed.";
      textFont(f, 12);
      fill(0);
      textAlign(CENTER);
      text(s, 50, 700, 600, 750);

      if (totalEnemies <0 && e.size() <= 0) {
        println(totalEnemies + ":" + e.size() );
        level++ ;
        totalEnemies = 10*level ;
        try {
          Thread.sleep(2000);
        } 
        catch (InterruptedException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
        }
      }
      if (totalEnemies <= 0 && e.size() <= 0 ) {
        String s1 = "Level " + level + " Completed" ;
        textFont(f, 72);
        fill(255);
        textAlign(CENTER);
        text(s1, 50, 350, 600, 100);    
        totalEnemies--;
      }

      // Does the mouse and outline thing
      mouseCheck();
      cell.outlineMe();

      // Enemy Spawner
      if (frameCounter++ % spawnSpeed == 0 && totalEnemies > 0) {
        Enemy enemy = new Enemy(map);
        enemy.setX(spawnTileX);
        enemy.setY(spawnTileY);
        enemy.setLevel(level);
        e.add(enemy);
        totalEnemies--;
      }

      // Displays the buttons
      for (int j = 0; j < b.length; j++) {
        if (b[j] != null) {
          b[j].display();
        }
      }
      // If its killed, remove it
      for (int j = e.size () - 1; j >= 0; j--) {
        while (j >= 0 && e.get (j).isKilled()) {
          e.remove(j--);
          player.setGold(10);
        }
        while (j >= 0 && e.get (j).isSurvived()) {
          e.remove(j--);
          player.setLives(1);
        }
        // Displays it
        if (j >= 0) {
          e.get(j).display();
        }
      }

      for (int j = 0; j < t.size (); j++) {
        t.get(j).display(e);
      }
    }

    if (player.getLives() <= 0) {
      gameOver = true; 
      String s2 = "Game Over :(";
      textFont(f, 72);
      fill(255);
      textAlign(CENTER);
      text(s2, 50, 350, 600, 100);
    }
  }
}

