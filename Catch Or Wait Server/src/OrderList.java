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
			Stop s = StopList.containsStop(o.getStop_id()) ; 
			if(s == null ) {
				
				try {
					//getting data from oasth website
					s = scraper.scrapOASTH(o.getStop_id());
					
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			String msg ; 
			//checks if order has time left to be executed 
			if(o.checkTimeLimit()) {
				
				//finds bus arrival time in stop's info 
				msg = s.findBusArrival(o.getBus_id());
				//if msg != "" sends the message to the phone number 
				if(!msg.equals("")) {
					System.out.println(msg);
				}
					
			}
			else msg ="Sorry currently no "+o.getBus_id()+"s are coming in this stop: " + o.getStop_id() ; 
				
			
			
			
		}
	    
		//removes all stops  cause they will have different infos in 1.5 min 
		StopList.stops.removeAll(StopList.stops)  ; 
	}
}
