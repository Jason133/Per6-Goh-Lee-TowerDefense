import java.io.File;
import java.util.ArrayList;
import java.util.Scanner;


import java.io.File;
import java.util.Scanner;

import processing.core.PApplet;
import processing.core.PImage;

public class Driver extends PApplet {
	
	
	// Really Basic Version of wave
	// No shooting mechanics
	// You can place towers
	// Enemies spawn
	
	// You have chance to place a tower (does nothing for now)
	// The enemies come
	public void wave(Map a) {
		for (int i = 0; i < 20; i++) {
			/*Scanner scan = new Scanner(System.in);
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
			}*/
			Enemy goin = new Enemy(this, a);
			addEnemyToList(a.getEnemyList(),goin);
			a.EnemyMove();
			//round(a);
			//System.out.println(a.toString());
//			try {
//			    Thread.sleep(1000);
//			} catch(InterruptedException ex) {
//			    Thread.currentThread().interrupt();
//			}
		}
	}

	public static void addEnemyToList(ArrayList<Enemy> elist, Enemy e) {
		elist.add(e);
	}
	
	
	private PImage img[] = new PImage[100];	
	private int i=0;
	private Enemy e ;
	private ArrayList<Enemy> enemyarr = new ArrayList<Enemy>();
	private ArrayList<Enemy> launched = new ArrayList<Enemy>();
	private PImage pm ;
	private int[][] map = new int[14][15];
	private Map a = new Map("/Users/jasonlee/Documents/workspace/TDProcessing/data/map.txt"); 
	
	public void setup () {
		size (750, 700);
		PImage p = loadImage("tileground.png");
		pm = new PImage(750,700);
		img[0] = p.get(0, 0, 26, 26);
		img[1] = p.get(0, 26, 26, 26);	
		img[3] = p.get(0,26,26,26);
		img[4] = p.get(0,26,26,26);
		img[0].resize(50, 50);
		img[1].resize(50, 50);
		img[3].resize(50, 50);
		img[4].resize(50, 50);
		dataPath("/Users/jlee/Documents/workspace/TDProcessing/data");
		
		try {
		Scanner loadScanner = new Scanner(new File("map.txt"));
		int x = 0 ;
		int y = 0 ;
		while (loadScanner.hasNext()) {
			if (x > 14) {
				x = 0 ;
				y++;
			}
			//image(img[loadScanner.nextInt()], x*50, y*50, 50, 50);
			map[y][x] = loadScanner.nextInt() ;
			pm.set(x*50, y*50, img[map[y][x]]);
			
			x++;
		}
		
		} catch (Exception e)  {
			
		}
		
//		for (int i = 0; i < 5; i++) {
//			Enemy c = new Enemy(this,a);
//			enemyarr.add(c);
//			for (Enemy j: launched) {
//				j.turn();
//				j.display();
//			}
//			
//			launched.add(c);
//		}
//		
		e = new Enemy(this, a) ;
		e.display();
		
	}
 
	public void draw () {
		background(pm);
		frameRate(5);
		e.turn();
		e.display();
		
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
	

	
//	public static void main(String[] args) {
//		a
////		for (int i = 0; i < a.getWidth(); i++) {
////			for (int j = 0; j < a.getLength(); j++) {
////				System.out.print(a.getMap(j, i) + ",");
////			}
////			System.out.println();
////		}
//		
//		//System.out.println(a.toString());
//		wave(a);
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
