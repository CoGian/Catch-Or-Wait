import java.sql.Time;
import java.time.LocalTime;
import java.util.*;

public class Order {
	
	private int id ; 
	private String bus_id ; 
	private String stop_id ; 
	private Time time ;
	private String phone ; 
	
	public Order(int id , String bus_id, String stop_id, Time time,String phone) {
	    this.id = id ;
		this.bus_id = bus_id;
		this.stop_id = stop_id;
		this.time = time;
		this.phone = phone  ; 
	}

	public String getBus_id() {
		return bus_id;
	}

	public void setBus_id(String bus_id) {
		this.bus_id = bus_id;
	}

	public String getStop_id() {
		return stop_id;
	}

	public void setStop_id(String stop_id) {
		this.stop_id = stop_id;
	}

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = time;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	} 
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public void deleteFromDB()
	{
		DBconnector connector = new DBconnector() ; 
		connector.deleteOrder(this);
	}

	//checks if this order has only 5 min or less
	public boolean checkTimeLimit() {

			Time t =  time ; 
			t.setMinutes(t.getMinutes()-5);
			if(t.toLocalTime().compareTo(LocalTime.now())<= 0 ) 
				return false ; 
			return true ;
			
	}


}
