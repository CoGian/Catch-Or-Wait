import java.util.*;

public class OrderList extends TimerTask {

	
	static ArrayList<Order> orders = new ArrayList<Order>();
	
	//add orders 
	public void run() {
		DBconnector connector = new DBconnector();
		connector.getOrders();
		
		for(Order o : orders) {
			Scraper scraper = new Scraper(); 
			
			try {
				scraper.scrapOASTH(o.getBus_id(), o.getStop_id());
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	    
		
	}
}
