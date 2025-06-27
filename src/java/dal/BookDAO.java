/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Book;

/**
 *
 * @author duong
 */
public class BookDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Book getBookById(int id) throws Exception {
        String sql = "SELECT * FROM books WHERE id = ?";
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();

        if (rs.next()) {
            Book b = new Book();
            b.setId(rs.getInt("id"));
            b.setTitle(rs.getString("title"));
            b.setDescription(rs.getString("description"));
            b.setCoverImage(rs.getString("cover_image"));
            return b;
        }
        return null;
    }
}
