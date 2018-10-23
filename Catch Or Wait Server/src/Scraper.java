import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;


public class Scraper {


	public void scrapOASTH(String stop_id) throws InterruptedException  {
		
		WebDriver driver = new ChromeDriver();
		System.out.println("Open Oasth Website");
		
		
		
		driver.get("http://oasth.gr/#el/stopinfo/screen/"+stop_id+"/");
		
		Thread.sleep(1000);
		// Capture all the arivals details
		List<WebElement> arrivals = driver.findElements(By.xpath("//*[@id=\"contentsArea\"]/div[3]/div/div[2]/div[3]/ul/li"));

		// Displays the number of arrivals captured inside the list
		System.out.println("List size detected  " + arrivals.size() + "\n");

		// Declares an iterator to fetch the Entries
		java.util.Iterator<WebElement> it = arrivals.iterator();

		ArrayList<String> arriving_buses = new ArrayList<>(); 
		ArrayList<String> arrival_times = new ArrayList<>(); 
		// Print the arrival times on the console 
		while (it.hasNext()) {

			 String[] array1 = it.next().getText().split("\n");
			 String busno = array1[0] ; 
			 String arrival = array1[2] ; 
			 arriving_buses.add(busno) ; 
			 arrival_times.add(arrival) ; 
			 System.out.println( busno + " "+ arrival );
					
		}
		
		//save arrivals on stop list 
		if(!arrivals.isEmpty()) {
			DBconnector connector = new DBconnector(); 
			Stop s = new Stop(stop_id,connector.findStopNameByID(stop_id), arriving_buses, arrival_times) ; 
			StopList.stops.add(s) ; 
		}
		

	   driver.close();
	
		 
	}
}
