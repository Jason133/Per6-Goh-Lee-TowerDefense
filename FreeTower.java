public class FreeTower extends Tile {

	private Tower here = null;

	public Tower getTower() {
		return here;
	}

	public void addTower(Tower here) {
		if (isOpen()) {
			this.here = here;
			this.setValue(5);
		} else {
			// Do nothing
		}
	}

	public boolean isOpen() {
		return here == null;
	}

	public FreeTower(int xcor, int ycor) {
		super(0, xcor, ycor);
		this.setXcor(xcor);
		this.setYcor(ycor);
	}
	
	public void add(Map towerdefense) {
		towerdefense.setMap(this);
	}

}
