import java.sql.*;
import java.util.ArrayList;

public class DBconnector {
	
	private Connection myConn ;
	private Statement stmt;
	ResultSet rs;
	
	public void openconnection() {
	//establishing connection with wampserver 
	try
	{
	    //loading the jdbc driver
	    Class.forName("com.mysql.cj.jdbc.Driver");         
	    //Open a connection
	    System.out.println("Connecting to a selected database... ");
	    //get a connection to database
	    myConn=DriverManager.getConnection("jdbc:mysql://localhost:3306/catch_the_bus?useSSL=true&useUnicode=true&characterEncoding=utf8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
	   
	   
	  }
	  catch(SQLException e)
	  {
	           System.out.println(e);   
	  }
	  catch(Exception e)
	  {
	           
			System.out.println(e);
	    }

	
		
	}
	
	private void closeConnection() {
		try {
			if (rs != null) {
				rs.close();
			}
			
			if (stmt != null) {
				stmt.close();
			}
			
			if (myConn != null) {
				myConn.close();
			}
		}
		catch (Exception e) {
			
		}
	}
	
	
	public void add_stop(String id,String name){
		openconnection();
		
		try {
			 //create a statement
			stmt = myConn.createStatement();
			//execute sql update
		    stmt.executeUpdate("INSERT INTO `stops` (`id`, `name`) VALUES ('"+ id +"', '"+ name + "')");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			closeConnection();
		}
		
	}
	
	public void add_bus(String id,String name,String href)
	{
		openconnection();
		try {
			 //create a statement
			stmt = myConn.createStatement();
			//execute sql update
			stmt.executeUpdate("INSERT INTO `buses` (`id`, `name`) VALUES ('"+ id +"', '"+ name + "','"+href+")");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection();
		}

		
	}
	
	
	
	//checks for any order which must have time-10 <= local time 
	public void getOrders() {
		
		
		try {
			openconnection();
			 //create a statement
			stmt = myConn.createStatement();
			//execute querry
			ResultSet rs = stmt.executeQuery("select * from orders where SUBTIME(time, '0:10:0') <= CURRENT_TIME()");
			
			while(rs.next()) {				
				
						
				Order o = new Order(rs.getInt("id"), rs.getString("bus_id"), rs.getString("stop_id"), rs.getTime("time"), 
										rs.getString("phone"));
				System.out.println(o.getPhone());
				o.delete();
				OrderList.orders.add(o);

			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		
		
		
		
		
	}



	public void deleteOrder(Order order) {
		// TODO Auto-generated method stub
		openconnection();
		try {
			 //create a statement
			stmt = myConn.createStatement();
			//execute sql update
			stmt.executeUpdate("DELETE FROM orders WHERE id="+order.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection();  
		}
	}

}
