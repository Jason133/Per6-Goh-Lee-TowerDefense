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
			// Spawn Point Located
			SpawnLoc go = startPoint;
			// Gets the current Point
			currentloc = new EnemyTile(startPoint.getXcor(),startPoint.getYcor());
			// Next Point
			nextloc = spawnNext(go);
			// Sets the current x,y variables
			xcor = currentloc.getXcor();
			ycor = currentloc.getYcor();
		} else {
			// Haven't spawned before yet
			// Hunts for that 3
			for (int i = 0; i < world.getLength(); i++) {
				for (int j = 0; j < world.getWidth(); j++) {
					if (world.getMap(i,j).getValue() == 3) {
						// Sets the starting Point
						startPoint = (SpawnLoc) world.getMap(i, j);
						// Sets the current Point
						currentloc = (EnemyTile)world.getMap(i, j);
						// Sets the Next point
						nextloc = spawnNext(startPoint);
						// Sets the coordinates
						xcor = currentloc.getXcor();
						ycor = currentloc.getYcor();
					}
				}
			}
		}
		// Adds that we visited our home base
		visited.add(currentloc);
		updateMap();
		System.out.println("Map Updated");
	}
	
	
	// Gets available opening after spawning
	public EnemyTile spawnNext(SpawnLoc a) {
		int xcorr = a.getXcor();
		int ycorr = a.getYcor();
		EnemyTile next = new EnemyTile(0,0);
		// Checks all 4 cases, finds out which is the next path after the spawn location
		if (world.getMap(xcorr+1, ycorr).getValue() == 1 && (xcor+1<world.getLength())){
			next = (EnemyTile)(world.getMap(xcorr+1,ycorr));
		} else if ((world.getMap(xcorr, ycorr+1).getValue() == 1 && (ycor+1<world.getWidth()))) {
			next = (EnemyTile)(world.getMap(xcorr,ycorr+1));
		} else if ((world.getMap(xcorr-1, ycorr).getValue() == 1 && (xcor+1>=0))) {
			next = (EnemyTile)(world.getMap(xcorr-1,ycorr));
		} else if ((world.getMap(xcorr, ycorr-1).getValue() == 1 && (ycor+1>=0))) {
			next = (EnemyTile)(world.getMap(xcorr,ycorr-1));
		}
		return next;
	}
	
	// Checks if you have visited this yet
	public boolean hasVisited(EnemyTile a) {
		for (int i = 0; i < visited.size(); i++) {
			if (visited.get(i).equals(a)) {
				return false;
			}
		}
		return true;
	}
	
	public void updateMap() {
		((EnemyTile)(world.getMap(currentloc.getXcor(), currentloc.getYcor()))).addEnemy(this);
	}
	// Gets the Next location to move
	/*
	public Tile nextMove() {
		Tile next = (Tile) new Tile(1, 2, 3);
		boolean isValid = false;
		while (!isValid) {
			Tile temp = (Tile) next.copy();
			if (world.getMap(xcor + 1, ycor).getValue() == 1
					&& (xcor + 1 < world.getLength())) {
				// Keep Going
				next = (Tile) world.getMap(xcor + 1, ycor);
				if (hasVisited(next)) {
					next = temp; 
				}
			} else if (world.getMap(xcor, ycor + 1).getValue() == 1
					&& (ycor + 1 < world.getWidth())) {
				next = (Tile) world.getMap(xcor, ycor + 1);
				if (hasVisited(next)) {
					next = temp; 
				}
			} else if (world.getMap(xcor - 1, ycor).getValue() == 1
					&& (xcor - 1 >= 0)) {
				next = (Tile) world.getMap(xcor - 1, ycor);
				if (hasVisited(next)) {
					next = temp; 
				}
			} else if (world.getMap(xcor, ycor - 1).getValue() == 1
					&& (ycor - 1 >= 0)) {
				next = (Tile) world.getMap(xcor, ycor - 1);
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
		currentloc.removed();
		nextloc = (EnemyTile)nextMove();
		currentloc = nextloc;
		xcor = currentloc.getXcor();
		ycor = currentloc.getYcor();
		((EnemyTile)(world.getMap(xcor, ycor))).addEnemy(this);
	}
	*/
}
