import java.util.*;

public class OrderList extends TimerTask {

	
	static ArrayList<Order> orders = new ArrayList<Order>();
	
	/*runs every 1.5 min  it moves orders from DB to orders list  to be executed 
	 *  and calls scrapOASTH function and 
	 */
	
	public void run() {
		
	
		
		DBconnector connector = new DBconnector();
		connector.getOrders();
		Scraper scraper = new Scraper(); 
		
		for(Order o : orders) {
			//checks if scraping has be done for stop by another order in the same time period
			if(!StopList.containsStop(o.getStop_id())) {
				
				try {
					//getting data from oasth website
					scraper.scrapOASTH(o.getStop_id());
					
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
				
			
			
			
		}
	    
		StopList.stops.removeAll(StopList.stops)  ; 
	}
}
