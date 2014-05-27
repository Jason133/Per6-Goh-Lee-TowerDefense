
public class Enemy {

	private int health; 
	private int defenseval;
	private int speed; 
	private int position; 
	private int direction;
	public static final int NORTH = 0;
	public static final int EAST = 90; 
	public static final int SOUTH = 180;
	public static final int WEST = 270;
	
	public Enemy() {
		health = 100; 
		defenseval = 1;
		speed = 1;
		direction = EAST;
	}

}
