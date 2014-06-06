public class Base extends Tile {

	private int lives;
	
	public Base(int xcor, int ycor) {
		super(4,xcor,ycor);
		this.setXcor(xcor);
		this.setYcor(ycor);
	}

	public void loseLife() {
		lives--;
		if (lives < 0) {
			System.out.println("Game Over.");
		}
	}

	public void setLives(int lives) {
		this.lives = lives;
	}
	
	public int getLives() {
		return lives;
	}

	// Probably don't need, as there is a set base
	public void add(Map towerdefense) {
		int xcor = this.getXcor();
		int ycor = this.getYcor();
		if (towerdefense.getMap(xcor, ycor).getValue() == 3) {
			towerdefense.setMap(this);
		} else { 
			return;
		}
	}
	
}
