
public class Enemy extends Tile {

	protected int health; 
	protected int defenseval;
	protected int speed;  
	protected int direction;
	public static final int NORTH = 0;
	public static final int EAST = 90; 
	public static final int SOUTH = 180;
	public static final int WEST = 270;
	
	public Enemy(int xcor, int ycor) {
		super(5,xcor,ycor);
		health = 100; 
		defenseval = 1;
		speed = 1;
		direction = EAST;
	}

}
