
public class SpawnLoc extends EnemyTile {

	public SpawnLoc(int xcor, int ycor) {
		super(xcor,ycor);
		this.setValue(3);
		this.setXcor(xcor);
		this.setYcor(ycor);
	}
	
	public Tile copy() {
		Tile newTile = new Tile(this.value, this.xcor, this.ycor);
		return newTile;
	}
	

}
