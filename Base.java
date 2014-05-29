public class Base extends Tile{

    private int lives;
    
    public void loseLife(){
	lives --;
	if(lives < 0){
	    System.out.println("Game Over.");
	}
    }

    public int getLives(){
	return lives;
    }

}
    
