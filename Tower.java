
public class Tower extends Tile {

	public Tower(int xcor, int ycor) {
		super(2,xcor,ycor);
		this.setXcor(xcor);
		this.setYcor(ycor);
	}
	
	public void add(Map towerdefense) {
		int xcor = this.getXcor();
		int ycor = this.getYcor();
		if (towerdefense.getMap(xcor, ycor).getValue() == 0) {
			towerdefense.setMap(this);
		} else { 
			return;
		}
	}
	

}
