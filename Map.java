import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.LineNumberReader;
import java.util.Scanner;

public class Map {

	private Tile[][] map;

	public void setMap(Tile a) {
		int ycor = a.getYcor();
		int xcor = a.getXcor();
		map[ycor][xcor] = a;
	}

	public Tile getMap(int xcor, int ycor) {
		return map[ycor][xcor];
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
					Tile wat = new Tile(blah, rows, cols);
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

	// Got Rid of this, have a new constructor to read in text files

	/*
	 * public Map(int row, int column) { map = new Tile[row][column]; for (int i
	 * = 0; i < map.length; i++) { for (int j = 0; j < map[i].length; j++) {
	 * Tile a = new Tile(-1, i, j); map[i][j] = a; } } }
	 */

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

	public int getLength() {
		return map.length;
	}

	public int getWidth() {
		return map[0].length;
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
					FreeTower a = new FreeTower(i, j);
					map[i][j] = a;
				} else if (map[i][j].getValue() == 1) {
					Enemy a = new Enemy(i, j);
					map[i][j] = a;
				} else if (map[i][j].getValue() == 3) {
					SpawnLoc a = new SpawnLoc(i, j);
					map[i][j] = a;
				} else if (map[i][j].getValue() == 4) {
					Base a = new Base(i, j);
					map[i][j] = a;
				} else {
					// Do nothing
				}
			}
		}
	}

}
