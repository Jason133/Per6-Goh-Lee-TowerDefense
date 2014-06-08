import java.util.ArrayList;

import processing.core.PApplet;
import processing.core.PImage;

public class Enemy {

	private PApplet parent;
	protected ArrayList<EnemyTile> visited = new ArrayList<EnemyTile>();
	protected int xcor, ycor;
	protected Map world;
	protected static SpawnLoc startPoint;
	protected EnemyTile currentloc;
	protected EnemyTile nextloc;

	// Spawns the Enemy at the spawn Point
	public Enemy(PApplet p, Map world) {
		this.world = world;
		// Haven't spawned before yet
		// Hunts for that 3
		// Only should run once
		parent = p;
		boolean hasloaded = false;
		for (int i = 0; i < world.getLength(); i++) {
			for (int j = 0; j < world.getWidth(); j++) {
				if (world.getMap(i, j).getValue() == 3) {
					hasloaded = true;
					// Sets the starting Point
					startPoint = (SpawnLoc) world.getMap(i, j);
					// Finds where to hatch it (using spawnNext method)
					EnemyTile hatch = spawnNext(startPoint);
					// Temporary for now
					if (hatch == null) {
						return;
					}
					// Sets the current Point
					currentloc = hatch;
					// Adds the enemy into this slot
					currentloc.addEnemy(this);
					world.setMap(currentloc);
					// Sets the Next point
					//nextloc = spawnNext(currentloc);
					// Sets the coordinates
					xcor = currentloc.getXcor();
					ycor = currentloc.getYcor();
					break;
				}
			}
			if (hasloaded) { 
				break;
			}
		}
		// Adds that we visited our home base
		visited.add(currentloc);
		//updateMap();
	}

	/*
	 * 
	 * if (startPoint != null) {
	 * 
	 * // Prevents excessive Time use // Spawn Point Located SpawnLoc go =
	 * startPoint; // Gets the current Point currentloc = new
	 * EnemyTile(startPoint.getXcor(),startPoint.getYcor()); // Next Point
	 * nextloc = spawnNext(go); // Sets the current x,y variables xcor =
	 * currentloc.getXcor(); ycor = currentloc.getYcor(); } else {
	 */

	// Gets available opening after spawning
	public EnemyTile spawnNext(EnemyTile a) {
		int xcorr = a.getXcor();
		int ycorr = a.getYcor();
		EnemyTile next = new EnemyTile(0, 0);
		// Checks all 4 cases, finds out which is the next path after the spawn
		// location
		if ((xcor + 1 < world.getLength())
				&& world.getMap(xcorr + 1, ycorr).getValue() == 1
				&& (hasVisited((EnemyTile) world.getMap(xcorr + 1, ycorr)) == false)) {
			next = (EnemyTile) (world.getMap(xcorr + 1, ycorr));
		} else if ((ycor + 1 < world.getWidth()) 
				&& world.getMap(xcorr, ycorr + 1).getValue() == 1
				&& (hasVisited((EnemyTile) world.getMap(xcorr, ycorr + 1)) == false)) {
			next = (EnemyTile) (world.getMap(xcorr, ycorr + 1));
		} else if ((xcor - 1 >= 0)
				&& world.getMap(xcorr - 1, ycorr).getValue() == 1
				&& (hasVisited((EnemyTile) world.getMap(xcorr - 1, ycorr)) == false)) {
			next = (EnemyTile) (world.getMap(xcorr - 1, ycorr));
		} else if ((ycor - 1 >= 0)
				&& world.getMap(xcorr, ycorr - 1).getValue() == 1
				&& (hasVisited((EnemyTile) world.getMap(xcorr, ycorr - 1)) == false)) {
			next = (EnemyTile) (world.getMap(xcorr, ycorr - 1));
		} else {
			return null;
		}
		return next;
	}

	// Checks if you have visited this yet
	public boolean hasVisited(EnemyTile a) {
		for (int i = 0; i < visited.size(); i++) {
			if (visited.get(i).equals(a)) {
				return true;
			}
		}
		return false;
	}

	//public void updateMap() {
		//((EnemyTile) (world.getMap(currentloc.getXcor(), currentloc.getYcor())))
			//	.addEnemy(this);
	//}

	
	
	
	public void movement(EnemyTile next) {
		// Firstly, change your currentloc back into no enemy, as you are moving
		currentloc.removed();
		// You're passed in the next location
		// First, move yourself there first
		int newx = next.getXcor();
		int newy = next.getYcor();
		// Sets the x,y coordinates
		xcor = newx;
		ycor = newy;
		// Sets the current location
		currentloc = (EnemyTile) world.getMap(xcor, ycor);
		currentloc.addEnemy(this);
		// Adds it to the visited pile
		visited.add(currentloc);
	}
	
	public void turn() {
		nextloc = this.spawnNext(currentloc);
		movement(nextloc);
	}
	
	public void display() {
		PImage pi = parent.loadImage("image.jpg");
		parent.image(pi, 50*xcor, 50*ycor, 50, 50);
		//movement(pi);
	}
	
}
