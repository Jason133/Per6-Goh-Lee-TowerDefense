
public class Tile {
	// 0 = freetower
	// 2 = tower
	// 1 = enemy path/ enemy (to be decided) 
	private int value;
	
	// On the 2D array, these are the locations
	private int xcor; 
	private int ycor;
	
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
	
	public String toString() {
		String res = ""; 
		res += value; 
		return res;
	}
	
	
	
	
	
	
	

}
