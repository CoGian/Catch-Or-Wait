import java.io.IOException;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;


public class Scraper {


	public void scrapOASTH(String bus_id,String stop_id) throws InterruptedException  {
		
		WebDriver driver = new ChromeDriver();
		System.out.println("Open Oasth Website");
		
		
		
		driver.get("http://oasth.gr/#el/stopinfo/screen/1134/");
		

		Thread.sleep(4000);
		

		// Capture all the arivals details
		List<WebElement> arrivals = driver.findElements(By.xpath("//*[@id=\"contentsArea\"]/div[3]/div/div[2]/div[3]/ul/li"));

		// Displays the number of arrivals captured inside the list
		System.out.println("List size detected  " + arrivals.size() + "\n");

		// Declares an iterator to fetch the Entries
		java.util.Iterator<WebElement> it = arrivals.iterator();

		//index number
		int index = 1;

		// Print the arrivals on the console
		while (it.hasNext()) {

			 String[] array1 = it.next().getText().split("\n");
			 String busno = array1[0] ; 
			 String arrival = array1[2] ; 
			System.out.println(index +" "+ busno + " "+ arrival );
			index++;

		}

			
	
		 
	}
}
