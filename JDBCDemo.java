/*
  Practical C2. Implement MYSQL database connectivity with Java
*/

import java.sql.*;

public class JDBCDemo
{
  public static void main(String args[])
  {
    try
    {
       /*
          Steps for Establishing Connection between Java Application and Database
       */
      String url = "jdbc:mysql://localhost:3306/practicals?autoReconnect=true&useSSL=false";    
      String user = "anonymous";
      String pass = "gotohell"; 

      //1. Load and Register Driver
      Class.forName("com.mysql.jdbc.Driver");
      
      //2. Establish a connection between Java Application and Database
      Connection con = DriverManager.getConnection(url, user, pass) ;

      //3. Create Statement Object
      Statement st = con.createStatement();
      
      //4. Send and Execute SQL queries
      ResultSet rs = st.executeQuery("SELECT * FROM user");  

      //5. Process the result from ResultSet object
      while(rs.next())
      {
         System.out.println(rs.getString(1)); 
      } 

      //6. Close the Connection   	  
      con.close();
    }
    catch(Exception e)
    {
       System.out.println(e.toString().trim());	    
    }
  }
}    
