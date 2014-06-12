class Tower {
  int x, y;
  private int centerX, centerY ;
  private PImage pi ;
  private int speed;
  private Player player;
  private int towerType = 0 ;
  private int damage = 5 ;
    void setup(int type) {
      x = 0;
      y=0;


    }
    
  public void setTowerType(int type) {
      if (type == 0 ) {
        towerType = 0 ;
        damage = 25 ;
        pi = loadImage("Tower1.png");
      } else if (type ==1) {
        towerType = 1 ;
        damage = 100 ;
        pi = loadImage("Tower2.png") ;
      } else {
        towerType = 2 ;
        damage = 250 ;
        pi = loadImage("Tower3.png") ;
      }
  }
    
  public void setPlayer(Player p) {
    this.player = p;
  }
  
    public void setXY(int x, int y) {
      this.x = x ;
      this.y = y;
    }

  void display(ArrayList<Enemy> e) {
    image(pi, x * 50, y * 50, 50, 50);
    speed--;
    if (speed < 0) {
      speed = 5 ;
      for (int k = 0; k < e.size(); k++) {
        if (inRange(x, y, e.get(k).getX(), e.get(k).getY())) {
          // Below is what is used to draw line and do damage and calculate score
          if (towerType == 0) {
            stroke(255);
          } else if (towerType == 1) {
            stroke(255,0,0);
          } else if (towerType == 2) {
            stroke(0,255,255);
          }
          strokeWeight(4);
          
          line(x * 50 + 25, y * 50 + 25,
              e.get(k).getX1() + 25, e.get(k).getY1() + 25);
          e.get(k).damage(damage);
          player.setScore(1);
          k = e.size() + 1;

        }
      }
    }
  }

  public Boolean inRange(int tx, int ty, int ex, int ey) {
    int dx = (tx * 50 + 25) - (ex * 50 + 25);
    int dy = (ty * 50 + 25) - (ey * 50 + 25);
    double d = Math.sqrt((double) ((dy * dy) + dx * dx));
    if (d > 75) {
      return false;
    } else {
      return true;
    }
  }
}
