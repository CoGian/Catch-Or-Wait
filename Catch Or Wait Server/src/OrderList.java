import java.util.*;

public class OrderList extends TimerTask {

	
	static ArrayList<Order> orders = new ArrayList<Order>();
	
	//add orders 
	public void run() {
		DBconnector connector = new DBconnector();
		connector.getOrders();
	    
	}
}
