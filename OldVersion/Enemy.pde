import processing.core.PApplet;
import processing.core.PImage;

  static class EnemyImage {
      static Boolean initialized = false ;
      static PImage pg ;
  }

public class Enemy {

  public int x, y, speed;
  public int x1 = 0, y1 = 0;
  private int up = 0, down = 1, left = 2, right = 3;
  public int direction = 3;
  private int[][] map;
  private boolean killed = false;
  private boolean survived = false ;
  private int health;
  private PGraphics pg ;

  Enemy(int[][] map) {
     health = 300;
    x = 0; // All stripes start at 0
    y = 0;
    speed = 5 ;
    
    if (!EnemyImage.initialized) {
      EnemyImage.pg = loadImage("enemy.png");
      EnemyImage.pg.resize(50, 50);
      EnemyImage.initialized = true ;
    }
    
      pg = createGraphics(50,50) ;
      pg.beginDraw();
      pg.image(EnemyImage.pg,0,0);
      pg.fill(255,255,0);
      pg.rect(0,0,50,5) ;
      pg.endDraw();


    this.map = new int[map.length][map[0].length];
    for (int i = 0; i < map.length; i++)
      for (int j = 0; j < map[i].length; j++)
        this.map[i][j] = map[i][j];
  }
  
  public int getX() {
    return x;
  }

  public void setX(int x) {
    this.x = x;
    this.x1 = x*50 ;
  }

  public int getY() {
    return y;
  }

  public void setY(int y) {
    this.y = y;
    this.y1 = y*50;
  }

  public int getX1() {
    return x1;
  }

  public void setX1(int x1) {
    this.x1 = x1;
  }

  public int getY1() {
    return y1;
  }

  public void setY1(int y1) {
    this.y1 = y1;
  }
  public boolean isKilled() {
    return killed;
  }

  public boolean isSurvived() {
    return survived;
  }
  
  public int getHealth() {
    return health;
  }

  public void damage(int damage) {
    health = health - damage;
    if (health < 0)
      this.killed = true;
  }

  public void setSpeed(int speed) {
    this.speed = speed;
  }

  // Draw stripe
  void display() {

    if (map[y][x + 1] == 1) {
      direction = 3;
      x1 += speed;
      if (x1 > (x*50 + 50)) {
        x1 = x*50 + 50 ;
      }
    } else if (y < 13 && (map[y + 1][x] == 1)) {
      direction = 1;
      y1 += speed;
      if (y1 > (y*50 + 50)) {
        y1 = y*50 + 50 ;
      }
    } else if (x > 0 && (map[y][x - 1] == 1)) {
      direction = 2;
      x1 -= speed;
      if (x1 < x*50 - 50) {
        x1 = x*50 -50 ;
      }
    } else if (map[y - 1][x] == 1) {
      direction = 0;
      y1 -= speed;
      if (y1 < y*50-50) {
        y1 = y*50-50 ;
      }
    } else {
      survived = true;
    }
    // check borders
    if ((direction == left || direction == right) && (x1 % 50 == 0)) {
      if (map[y][x + 1] == 1) {
        x++;
      } else if (x > 0 && (map[y][x - 1] == 1)) {
        x--;
      }
    } else if ((direction == up || direction == down) && (y1 % 50 == 0)) {
      if (y < 13 && (map[y + 1][x] == 1)) {
        y++;
      } else if (map[y - 1][x] == 1) {
        y--;
      }
    }
    map[y][x] = 0;
      pg.beginDraw();
      pg.fill(0,0,0);
      float percentage = (float)health/(float)300*(float)50;
      pg.rect((int)percentage,0, 50-(int)percentage,5) ;
      pg.endDraw();
      image(pg, x1, y1, 50, 50);
  }

}

