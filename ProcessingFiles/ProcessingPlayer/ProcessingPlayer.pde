public class ProcessingPlayer{
  
  int gold, score, lives;
  
  ProcessingPlayer(){
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
    ProcessingTower t = new Tower(towerType);
    gold -= t.getTowerCost();
  }
  
  // Towers sell for 70% of cost
  void sellTower(int towerType){
    ProcessingTower t = new Tower(towerType);
    gold += (int)(0.7 * t.getTowerCost());
  }
  
}

  // Displays the score, gold, and lives of the player
/*  PFont f;
  
  void setup(){
    size(300, 300);
    f = createFont("Arial", 16, true);
    //Player p = new Player();
  }
  
  void draw(){
    background(255);
    textFont(f, 12);
    fill(0);
    rect(100, 100, 5, 5);
    Player p = new Player();
    String s = "Score: " + p.getScore() + "    Gold: " + p.getGold() + "    Lives: " + p.getLives();
    text(s, 10, 10);
  }
  */
    
  
