
public class EnemyTile extends Tile {
	
	private Enemy righthere = null;
	
	public Enemy getEnemy() {
		return righthere;
	}

	public void addEnemy(Enemy c) {
		if (isOpen()) {
			righthere = c;
			this.setValue(7);
		} else {
			// Do nothing
		}
	}
	
	public void removed() {
		// This occurs when function is called, indicating the enemy has left
		righthere = null;
		this.setValue(1);
	}
	
	public boolean isOpen() {
		return righthere == null;
	}

	public EnemyTile(int xcor, int ycor) {
		super(1,xcor,ycor);
		this.setXcor(xcor);
		this.setYcor(ycor);
	}

	
	
}
