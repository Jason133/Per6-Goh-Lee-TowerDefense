import java.util.ArrayList;

public class Enemy {

	protected ArrayList<EnemyTile> visited = new ArrayList<EnemyTile>();
	protected int xcor, ycor;
	protected Map world;
	protected static SpawnLoc startPoint;
	protected EnemyTile currentloc;
	protected EnemyTile nextloc;

	// Spawns the Enemy at the spawn Point
	public Enemy(Map world) {
		this.world = world;
		// Find the Spawn Location
		if (startPoint != null) {
			// Prevents excessive Time use
			Tile go = startPoint;
			currentloc = new EnemyTile(startPoint.getXcor(),startPoint.getYcor());
			xcor = currentloc.getXcor();
			ycor = currentloc.getYcor();
		} else {
			// Haven't spawned before yet
			for (int i = 0; i < world.getWidth(); i++) {
				for (int j = 0; j < world.getLength(); i++) {
					if (world.getMap(i, j).getValue() == 3) {
						startPoint = (SpawnLoc) world.getMap(i, j);
						currentloc = (EnemyTile) world.getMap(i, j);
						xcor = currentloc.getXcor();
						ycor = currentloc.getYcor();
					}
				}
			}
		}
		visited.add((EnemyTile) currentloc);
	}

	// Gets the Next location to move
	public EnemyTile nextMove() {
		EnemyTile next = (EnemyTile) new Tile(1, 2, 3);
		boolean isValid = false;
		while (!isValid) {
			EnemyTile temp = (EnemyTile) next.copy();
			if (world.getMap(xcor + 1, ycor).getValue() == 1
					&& (xcor + 1 < world.getLength())) {
				// Keep Going
				next = (EnemyTile) world.getMap(xcor + 1, ycor);
				if (hasVisited(next)) {
					next = temp; 
				}
			} else if (world.getMap(xcor, ycor + 1).getValue() == 1
					&& (ycor + 1 < world.getWidth())) {
				next = (EnemyTile) world.getMap(xcor, ycor + 1);
				if (hasVisited(next)) {
					next = temp; 
				}
			} else if (world.getMap(xcor - 1, ycor).getValue() == 1
					&& (xcor - 1 >= 0)) {
				next = (EnemyTile) world.getMap(xcor - 1, ycor);
				if (hasVisited(next)) {
					next = temp; 
				}
			} else if (world.getMap(xcor, ycor - 1).getValue() == 1
					&& (ycor - 1 >= 0)) {
				next = (EnemyTile) world.getMap(xcor, ycor - 1);
				if (hasVisited(next)) {
					next = temp; 
				}
			}
			if (next != temp) {
				isValid = true;
			}
		}
		return next;
	}
	
	// Checks if has Visited Before
	public boolean hasVisited(Tile a) {
		for (int i = 0; i < visited.size(); i++) {
			if (visited.get(i).equals(a)) {
				return false;
			}
		}
		return true;
	}

	// Needs more work on this
	public void turn() {
		// Update the Previous Map
		nextloc = nextMove();
		currentloc = nextloc;
		xcor = currentloc.getXcor();
		ycor = currentloc.getYcor();
		

	}

}
