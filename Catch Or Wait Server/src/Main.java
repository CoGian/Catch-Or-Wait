import java.util.*;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		class SayHello extends TimerTask {
				    
		    public void run() {
		    	System.out.println("Ho World!"); 
		    }
		}
		
		Timer timer = new Timer();
		timer.schedule(new SayHello(), 0, 5000);

	}

}
