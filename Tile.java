
public class Tile {
	// 0 = freetower
	// 2 = tower occupied
	// 1 = enemy path
	// 3 = Base (where they attack from) 
	// 4 = spawn place
	protected int value;
	
	// On the 2D array, these are the locations
	protected int xcor; 
	protected int ycor;
	
	// Setters/Getters
	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public int getXcor() {
		return xcor;
	}

	public void setXcor(int xcor) {
		this.xcor = xcor;
	}

	public int getYcor() {
		return ycor;
	}

	public void setYcor(int ycor) {
		this.ycor = ycor;
	}

	// Constructor 
	// Takes int value, xcor, ycor
	public Tile(int value, int xcor, int ycor) {
		this.value = value;
		this.xcor = xcor;
		this.ycor = ycor;
	}
	
	public Tile copy() {
		Tile newTile = new Tile(this.value, this.xcor, this.ycor);
		return newTile;
	}
	
	public String toString() {
		String res = ""; 
		res += value; 
		return res;
	}
}
