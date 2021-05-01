/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Users;
 import org.apache.commons.codec.digest.DigestUtils;



/**
 *
 * @author TrongNhan
 */
public class UsersDAO {
    ////// phuong thuc them tai khoan
    public boolean insertUser(Users u) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO users VALUES(?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, u.getUserID());
            ps.setString(2, u.getFullName());
            ps.setString(3, u.getUserEmail());
            ps.setString(4, u.getUserPass());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
        ///kiem tra email ton tai hay chua
    public boolean checkEmail(String email){
          Connection connection = DBConnect.getConnecttion();
          String sql = "SELECT *\n" +
                        "FROM `users`\n" +
                        "WHERE `user_email` = '" + email + "'";
          PreparedStatement ps;
          try{
              ps = connection.prepareCall(sql);
              ResultSet rs = ps.executeQuery();
              while (rs.next()){
                  connection.close();
                  return true;
              }
          }catch (SQLException ex) {
              Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
          }
          return false;
          
    }
      /////kiem tra dang nhap
    public Users login(String email, String password) {
        Connection con = DBConnect.getConnecttion();
        String sql = "SELECT *\n" +
                    "FROM `users`\n" +
                    "WHERE `user_email` = '"+ email +"'\n" +
                    "AND `user_pass` = '"+ DigestUtils.md5Hex(password) +"'";

        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Users u = new Users();
                u.setUserEmail(rs.getString("user_email"));
                con.close();
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
       }
        return null;
    }
}


////


