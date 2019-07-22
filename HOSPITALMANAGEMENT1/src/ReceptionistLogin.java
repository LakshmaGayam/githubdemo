import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;

public class ReceptionistLogin extends HttpServlet {
private static String urlstring = "jdbc:mysql://localhost:3306/mysql";    
  private static String username = "root";   
  private static String password = "Lokesh@546";
  private static Connection connection=null;

  public static Connection getConnection() {
  if(connection==null){

      try {
          Class.forName("com.mysql.jdbc.Driver");
          try {
              connection = DriverManager.getConnection(urlstring, username, password);
              System.out.println("connection creates");
          } catch (SQLException ex) {
              System.out.println("Failed to create the database connection."); 
          }
      } catch (ClassNotFoundException ex) {
          System.out.println("Driver not found."); 
      }
      
  }
  return connection;
  }
}