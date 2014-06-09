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

  /*void purchaseTower(int towerType) {
    Tower t = new Tower(towerType);
    if(gold >= t.getTowerCost()){
      gold -= t.getTowerCost();
    }
  }

  // Towers sell for 70% of cost
  void sellTower(int towerType) {
    Tower t = new Tower(towerType);
    gold += (int)(0.7 * t.getTowerCost());
  }*/

  void updateDisplay() {
    String s = "Score: " + score + " Gold: " + gold + " Lives: " + lives;
    PFont f;
    f = createFont("Arial", 16, true);
    textFont(f, 18);
    fill(0);
    textAlign(CENTER);
    text(s, width/2, 730);
  }
}
