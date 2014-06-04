import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.LineNumberReader;
import java.util.ArrayList;
import java.util.Scanner;

public class Map {

	private Tile[][] map;
	private ArrayList<Enemy> EnemyList = new ArrayList<Enemy>();

	public ArrayList<Enemy> getEnemyList() {
		return EnemyList;
	}

	public void setEnemyList(ArrayList<Enemy> enemyList) {
		EnemyList = enemyList;
	}

	public void setMap(Tile a) {
		int ycor = a.getYcor();
		int xcor = a.getXcor();
		map[ycor][xcor] = a;
	}

	public Tile getMap(int xcor, int ycor) {
		return map[ycor][xcor];
	}

	public int getLength() {
		return map[0].length;
	}

	public int getWidth() {
		return map.length;
	}

	// Takes a filename
	// Reads it into the 2D array
	// Mapifies everything correctly, so now there are all tiles
	public Map(String filename) {
		try {
			File file = new File(filename);
			Scanner scanner = new Scanner(file);
			BufferedReader reader = new BufferedReader(new FileReader(filename));
			int lines = 0;
			try {
				while (reader.readLine() != null)
					lines++;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// Now we have lines

			map = new Tile[lines][15];

			int rows = 0;
			int cols = 0;

			while (scanner.hasNext()) {
				String a = scanner.next();
				if (a == " ") {
					// Do nothing, keep going
					// } else if (cols > 14) {
					// rows++;
					// cols = 0;
				} else {
					if (cols > 14) {
						rows++;
						cols = 0;
					}
					int blah = Integer.parseInt(a);
					Tile wat = new Tile(blah, cols, rows);
					map[rows][cols] = wat;
					cols++;
				}
			}
			scanner.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		mapify();
	}

	public String toString() {
		String res = "";
		for (int i = 0; i < map.length; i++) {
			for (int j = 0; j < map[i].length; j++) {
				res += map[i][j] + " ";
			}
			res += "\n";
		}
		return res;
	}

	// Reading files in
	// Counts lines
	public int countLines(String filename) throws IOException {
		LineNumberReader reader = new LineNumberReader(new FileReader(filename));
		int cnt = 0;
		String lineRead = "";
		while ((lineRead = reader.readLine()) != null) {
		}

		cnt = reader.getLineNumber();
		reader.close();
		return cnt;
	}

	// Instantiates all the tiles
	// Freetowers are where towers can be stored
	// Enemy is where enemies can be stored
	// SpawnLoc is the start
	// Base is the end
	public void mapify() {
		for (int i = 0; i < map.length; i++) {
			for (int j = 0; j < map[i].length; j++) {
				if (map[i][j].getValue() == 0) {
					FreeTower a = new FreeTower(j, i);
					map[i][j] = a;
				} else if (map[i][j].getValue() == 1) {
					EnemyTile a = new EnemyTile(j, i);
					map[i][j] = a;
				} else if (map[i][j].getValue() == 3) {
					SpawnLoc a = new SpawnLoc(j, i);
					map[i][j] = a;
				} else if (map[i][j].getValue() == 4) {
					Base a = new Base(j, i);
					map[i][j] = a;
				} else {
					// Do nothing
				}
			}
		}
	}
	
	public void addStuff() {
		Scanner a = new Scanner(System.in);
		int readin = 0; 
		while (readin != 1) {
			// Can be replaced by Mouse later on if using GUI
			System.out.println("Add Tower, Type (1)");
		    readin = Integer.parseInt(a.next());
		}
		int xcor,ycor = -9001;
		System.out.println("Input x-cor of where to put in");
		xcor = Integer.parseInt(a.next());
		System.out.println("Input y-cor of where to put in");
		ycor = Integer.parseInt(a.next());
		if (this.getMap(xcor, ycor).getValue() != 0) {
			System.out.println("Invalid Location");
		} else { 
			((FreeTower)(this.getMap(xcor,ycor))).addTower(new Tower());
			System.out.println("Tower added!");
		}
		
	}
	
	
	public void EnemyMove() {
		for (int i = 0; i < EnemyList.size(); i++) {
			EnemyList.get(i).turn();
		}
	}

}
