class Player {
  private int gold = 200;
    private int score = 0;
    private int lives = 50;
    
  public int getGold() {
    return gold;
  }
  public void setGold(int gold) {
    this.gold += gold;
  }
  public int getScore() {
    return score;
  }
  public void setScore(int score) {
    this.score += score;
  }
  public int getLives() {
    return lives;
  }
  public void setLives(int lives) {
    this.lives -= lives;
  }
}
