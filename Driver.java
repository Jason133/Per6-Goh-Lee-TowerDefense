import java.util.Scanner;


public class Driver {

	public static void main(String[] args) {
		Map a = new Map("BalancedMap.txt");
		System.out.println(a.toString());
		System.out.println(a.getLength());
		System.out.println(a.getWidth());
		
		Scanner scan = new Scanner(System.in);
		boolean keepGoing = true;
		while (keepGoing) {
			System.out.println("If you want to quit, type -1, else type in anything");
			int goingon = Integer.parseInt(scan.next());
			if (goingon == -1) {
				keepGoing = false;
			} else {
				a.addStuff();
			}
			System.out.println(a.toString());
		}
		
		
		
		// Future Note that it must be in this format
		
		
		/*
		for (int i = 0; i < a.getLength(); i++) {
			for (int j = 0; j < a.getWidth(); j++) {
				if (a.getMap(i, j).getValue() == 0) {
					FreeTower b = (FreeTower) a.getMap(i, j);
					b.addTower(new Tower());
				}
			}
		}
		
		System.out.println(a.toString());
		
		System.out.println(a.getMap(6,1));
		*/
	}

}
