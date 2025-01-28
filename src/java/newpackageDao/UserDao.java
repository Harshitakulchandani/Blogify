/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package newpackageDao;

import java.sql.*;
import newpackageEntities.UserInfo;
public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //method to insert user to data base:
    public boolean saveUser(UserInfo user) {
        boolean f = false;
        try {
            //user -->database

            String query = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }
    //get user by email and password ---> for login page
    
    public  UserInfo getUserbyEmailandPassword(String email , String password){
        UserInfo user=null;
        try{
            String query="select *from user where email=?and password=?";
            PreparedStatement psmt=con.prepareStatement(query);
            psmt.setString(1, email);
            psmt.setString(2,password);
            //store the data in form of result set
           ResultSet set=  psmt.executeQuery();
           //AGAR EK BHI ROW HAI..SET.NEXT()
           if(set.next()){
            user=new UserInfo();
           //idhar set function k under table ke fields rkhne hai to access the data from database
           
           String name=set.getString("name");
            user.setName(name);
            user.setId(set.getInt("id"));
            user.setEmail(set.getString("email"));
            user.setPassword(set.getString("password"));
            user.setGender(set.getString("gender"));
            user.setAbout(set.getString("about"));
            user.setDateTime(set.getTimestamp("rdate"));
            user.setProfile(set.getString("profile"));
           }
        }catch(Exception e){
          e.printStackTrace();
        }
        
        return user;
    }
 /// to update the fields of user
      public boolean updateUser(UserInfo user){
          boolean f=false;
          try{
              String query="update user set name=? , email=? , password=? , gender=? , about=? , profile=? where id=?";
              PreparedStatement ps=con.prepareStatement(query);
              ps.setString(1, user.getName());
              ps.setString(2, user.getEmail());
              ps.setString(3, user.getPassword());
              ps.setString(4, user.getGender());
              ps.setString(5, user.getAbout());
              ps.setString(6, user.getProfile());
              ps.setInt(7, user.getId());
              ps.executeUpdate();
              f=true;
              
          }catch(Exception e){
           e.printStackTrace();
          }
      return f;
      }
}
