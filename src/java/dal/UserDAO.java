/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Users;

/**
 *
 * @author duong
 */
public class UserDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Users checkLogin(String email, String plainPasswordInput) {
        try {
            String query = "SELECT * FROM users WHERE email = ? AND password = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, plainPasswordInput); // không dùng hash
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Users(
                        rs.getInt("user_id"),
                        rs.getInt("role_id"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getBoolean("gender"),
                        rs.getString("phone_number"),
                        rs.getString("address"),
                        rs.getDate("date_of_birth"),
                        rs.getString("image"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at"),
                        rs.getBoolean("status"),
                        rs.getString("reset_password_token"),
                        rs.getTimestamp("reset_password_expiry")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
   public void createUserFromGoogle(Users user) {
    Connection conn = null;
    PreparedStatement ps = null;

    try {
        String sql = "INSERT INTO users (email, full_name, role_id, image, created_at, status) "
                   + "VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP, 1)";
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(sql);
        ps.setString(1, user.getEmail());
        ps.setString(2, user.getFullName());
        ps.setInt(3, user.getRoleId()); // đảm bảo User model có getRoleId()
        ps.setString(4, user.getImage());
        ps.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
    public Users getUserByEmail(String email) {
        try {
            String query = "SELECT * FROM users WHERE LOWER(TRIM(email)) = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Users(
                        rs.getInt("user_id"),
                        rs.getInt("role_id"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getBoolean("gender"),
                        rs.getString("phone_number"),
                        rs.getString("address"),
                        rs.getDate("date_of_birth"),
                        rs.getString("image"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at"),
                        rs.getBoolean("status"),
                        rs.getString("reset_password_token"),
                        rs.getTimestamp("reset_password_expiry")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }
}
