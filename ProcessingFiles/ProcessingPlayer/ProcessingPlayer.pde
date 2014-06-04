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
  
    
  
