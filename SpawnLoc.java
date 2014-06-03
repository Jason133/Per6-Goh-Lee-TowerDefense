
public class SpawnLoc extends Tile {

	public SpawnLoc(int xcor, int ycor) {
		super(3,xcor,ycor);
		this.setXcor(xcor);
		this.setYcor(ycor);
	}
	
	public Tile copy() {
		Tile newTile = new Tile(this.value, this.xcor, this.ycor);
		return newTile;
	}
	

}
