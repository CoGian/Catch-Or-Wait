import java.sql.*;

public class DBconnector {
	
	private Connection myConn ;
	
	public void initiate_connection() {
	//establishing connection with wampserver 
	try
	{
	    //loading the jdbc driver
	    Class.forName("com.mysql.jdbc.Driver");         
	    //Open a connection
	    System.out.print("Connecting to a selected database... ");
	    //get a connection to database
	    myConn=DriverManager.getConnection("jdbc:mysql://localhost:3306/catch_the_bus?useUnicode=true&characterEncoding=utf8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
	   
	   
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
	
	
	
	public void add_stop(String id,String name){
		Statement stmt;
		try {
			 //create a statement
			stmt = myConn.createStatement();
			//execute sql update
			int rs = stmt.executeUpdate("INSERT INTO `stops` (`id`, `name`) VALUES ('"+ id +"', '"+ name + "')");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void add_bus(String id,String name,String href)
	{
		Statement stmt;
		try {
			 //create a statement
			stmt = myConn.createStatement();
			//execute sql update
			int rs = stmt.executeUpdate("INSERT INTO `buses` (`id`, `name`) VALUES ('"+ id +"', '"+ name + "','"+href+")");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}
	
	//checks for any order which can be done 
	public void run() {
		
		
	}

}
