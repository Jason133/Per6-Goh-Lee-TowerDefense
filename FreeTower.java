
public class FreeTower extends Tile {

	public FreeTower(int xcor, int ycor) {
		super(0,xcor,ycor);
		this.setXcor(xcor);
		this.setYcor(ycor);
	}
	
	// Note that this is reversed
	// I am assuming you are going left to right is x axis and 
	// up down is y axis
	public void add(Map towerdefense) {
		towerdefense.setMap(this);
	}

}
