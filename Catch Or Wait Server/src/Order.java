import java.util.*;

public class Order {
	
	private int id ; 
	private String bus_id ; 
	private String stop_id ; 
	private Date time ;
	private String phone ; 
	
	public Order(int id , String bus_id, String stop_id, Date time,String phone) {
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

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
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

	

}
