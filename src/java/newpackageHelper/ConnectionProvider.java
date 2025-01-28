/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package newpackageHelper;

import java.sql.*;

public class ConnectionProvider {
    
    //this variable connection will store all the connection to fire the query
   private static Connection con;
   public static Connection getConnection(){
      try {

            if (con == null) {
                //driver class load
                Class.forName("com.mysql.cj.jdbc.Driver");

                //create a connection..
                con = DriverManager.
                        getConnection("jdbc:mysql://localhost:3306/project1", "root", "123456");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }

}