
public class Map {

	private Tile[][] map;
	
	public Map(int row, int column) {
		map = new Tile[row][column];
		for (int i = 0; i < map.length; i++) {
			for (int j = 0; j < map[i].length; j++) {
				Tile a = new Tile(0,i,j);
				map[i][j] = a;
			}
		}
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
	
	
	
	
	
}
