import java.util.ArrayList;

public class Stop {
	
	private String id ;
	private String name ; 
	private ArrayList<String> arriving_buses = new ArrayList<>()  ; 
	private ArrayList<String> arrival_times = new ArrayList<>() ;
	
	public Stop(String id, String name, ArrayList<String> arriving_buses, ArrayList<String> arrival_times) {
		
		this.id = id;
		this.name = name;
		this.arriving_buses = arriving_buses;
		this.arrival_times = arrival_times;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ArrayList<String> getBus_id() {
		return arriving_buses;
	}

	public void setBus_id(ArrayList<String> bus_id) {
		this.arriving_buses = bus_id;
	}

	public ArrayList<String> getArrivals_times() {
		return arrival_times;
	}

	public void setArrivals_times(ArrayList<String> arrivals_times) {
		this.arrival_times = arrivals_times;
	} 
	
	
	

}
