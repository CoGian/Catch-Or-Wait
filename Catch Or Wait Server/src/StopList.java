import java.util.ArrayList;

public class StopList {
	
	static ArrayList<Stop> stops = new ArrayList<Stop>();
	
	//override conntains for stoplist
	static boolean containsStop(Object o) {
		
		boolean flag = false ;
		
		if(!stops.isEmpty()) {
			for(Stop s : stops) {
				if(s.getId().equals(o))
					flag = true ; 
			}
		}
		
			
		return flag ; 
	}

}
