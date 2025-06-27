/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Task;
/**
 *
 * @author duong
 */
public class TaskDAO {
    
   Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Task> getTasksByUserToday(int userId) {
        List<Task> list = new ArrayList<>();
        String sql = "SELECT task_text, completed, reward FROM task "
                   + "WHERE user_id = ? AND task_date = CURDATE()";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Task t = new Task();
                t.setText(rs.getString("task_text"));
                t.setCompleted(rs.getBoolean("completed"));
                t.setReward(rs.getString("reward"));
                list.add(t);
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

        return list;
    }

    public static void main(String[] args) {
        TaskDAO dao = new TaskDAO();
        int userId = 1;

        List<Task> tasks = dao.getTasksByUserToday(userId);
        if (tasks.isEmpty()) {
            System.out.println("Không có nhiệm vụ nào cho hôm nay.");
        } else {
            for (Task t : tasks) {
                System.out.println("Nhiệm vụ: " + t.getText());
                System.out.println("Đã hoàn thành: " + t.isCompleted());
                System.out.println("Phần thưởng: " + t.getReward());
                System.out.println("----------");
            }
        }
    }
    
}
