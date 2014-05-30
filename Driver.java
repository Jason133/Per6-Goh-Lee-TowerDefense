
public class Driver {
	
	public static void map1 (Map a) {
		for (int i = 0; i < a.getLength(); i++) {
			FreeTower b = new FreeTower(i,0);
			a.setMap(b);
		}
		for (int i = 0; i < a.getLength(); i++) {
			Tower b = new Tower(i,1);
			a.setMap(b);
		}
	}

	public static void main(String[] args) {
		Map a = new Map("BalancedMap.txt");
		System.out.println(a.toString());
		//Map a = new Map(10,10);
		//map1(a);
		//System.out.println(a.toString());
		// PRELIMINARY TESTING
		// FreeTower b = new FreeTower(5,7);
		//b.add(a);
		//Tower c = new Tower(5,7);
		//c.add(a);
		//System.out.println(a.toString());
	}

}
