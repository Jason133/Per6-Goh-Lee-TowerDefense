
public class EnemyTile extends Tile {
	
	private Enemy righthere = null;
	
	public Enemy getEnemy() {
		return righthere;
	}

	public void addEnemy(Enemy righthere) {
		this.righthere = righthere;
		if (isOpen()) {
			this.setValue(7);
		} else {
			// Do nothing
		}
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
