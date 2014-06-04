import java.util.ArrayList;
import java.util.Scanner;


public class Driver {
	
	
	// Really Basic Version of wave
	// No shooting mechanics
	// You can place towers
	// Enemies spawn
	
	// You have chance to place a tower (does nothing for now)
	// The enemies come
	public static void wave(Map a) {
		for (int i = 0; i < 20; i++) {
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
			Enemy goin = new Enemy(a);
			addEnemyToList(a.getEnemyList(),goin);
			a.EnemyMove();
			//round(a);
			System.out.println(a.toString());
			try {
			    Thread.sleep(1000);
			} catch(InterruptedException ex) {
			    Thread.currentThread().interrupt();
			}
		}
	}

	public static void addEnemyToList(ArrayList<Enemy> elist, Enemy e) {
		elist.add(e);
	}
	
	
	
	/*
	public static void round(Map a) {
		
		for (int i=a.getLength()-1; i >= 0; i--) {
			for (int j=a.getWidth()-1; j >= 0 ; j--) {
				if (a.getMap(i, j).getValue() == 7) {
					((EnemyTile) a.getMap(i, j)).go();
				}
			}
		}
	}
	*/
	

	
	public static void main(String[] args) {
		Map a = new Map("BalancedMap.txt");
		System.out.println(a.toString());
		wave(a);
		//System.out.println(a.getMap(0, 3).getXcor() + "," + a.getMap(0,3).getYcor());
		//System.out.println(a.getMap(3,0).getXcor() + "," + a.getMap(3,0).getYcor());
		//System.out.println(a.getLength());
		//System.out.println(a.getWidth());
		
		//Enemy b = new Enemy(a);
		//Enemy c = new Enemy(a);
		//System.out.println(a.toString());

		//round(a);
		
		//System.out.println(a.toString());
		
		
		/*
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
		*/
		
		
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
