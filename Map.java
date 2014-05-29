
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
	
	
	public Map(int row, int column) {
		map = new Tile[row][column];
		for (int i = 0; i < map.length; i++) {
			for (int j = 0; j < map[i].length; j++) {
				Tile a = new Tile(-1,i,j);
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
	
	public int getLength() {
		return map.length;
	}

	public int getWidth() {
		return map[0].length;
	}
	
	
	
}
