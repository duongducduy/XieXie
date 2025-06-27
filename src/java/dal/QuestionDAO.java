/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.*;
import java.util.*;
import model.Answer;
import model.Question;
/**
 *
 * @author duong
 */
public class QuestionDAO {

  public Question getNextQuestion(int bookId, int levelNumber, int currentId) {
        Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        conn = new DBContext().getConnection();

        String sql;

        if (currentId == 0) {
            // Lấy câu đầu tiên trong level
            sql = """
                SELECT q.id, q.content, q.image_url
                FROM questions q
                JOIN levels l ON q.level_id = l.id
                WHERE l.book_id = ? AND l.level_number = ?
                ORDER BY q.id ASC
                LIMIT 1
            """;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bookId);
            ps.setInt(2, levelNumber);

        } else {
            // Lấy câu kế tiếp trong cùng level, nhưng đảm bảo currentId thuộc level
            sql = """
                WITH level_questions AS (
                        SELECT q.id, q.content, q.image_url,
                               ROW_NUMBER() OVER (ORDER BY q.id ASC) AS rn
                        FROM questions q
                        JOIN levels l ON q.level_id = l.id
                        WHERE l.book_id = ? AND l.level_number = ?
                    ),
                    curr_question AS (
                        SELECT rn FROM level_questions WHERE id = ?
                    )
                    SELECT q.id, q.content, q.image_url
                    FROM level_questions q
                    JOIN curr_question c ON q.rn = c.rn + 1;
            """;

            ps = conn.prepareStatement(sql);
            ps.setInt(1, bookId);
            ps.setInt(2, levelNumber);
            ps.setInt(3, currentId);
        }

        rs = ps.executeQuery();

        if (rs.next()) {
            Question q = new Question();
            q.setId(rs.getInt("id"));
            q.setContent(rs.getString("content"));
            q.setImageUrl(rs.getString("image_url"));

            // Load đáp án
            String answerSql = """
                SELECT w.id, w.content, qo.is_correct
                FROM question_option qo
                JOIN words w ON qo.word_id = w.id
                WHERE qo.question_id = ?
            """;
            try (PreparedStatement psA = conn.prepareStatement(answerSql)) {
                psA.setInt(1, q.getId());
                try (ResultSet rsA = psA.executeQuery()) {
                    List<Answer> answers = new ArrayList<>();
                    while (rsA.next()) {
                        answers.add(new Answer(
                            rsA.getInt("id"),
                            rsA.getString("content"),
                            rsA.getBoolean("is_correct")
                        ));
                    }
                    q.setAnswers(answers);
                }
            }

            return q;
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
  

    
  public static void main(String[] args) {

     int bookId = 1;           // ID sách bạn muốn test
    int levelNumber = 2;      // Level muốn test (vd: 1, 2, 3...)
    int currentId = 0;        // Bắt đầu từ 0

    QuestionDAO dao = new QuestionDAO();

    while (true) {
        Question q = dao.getNextQuestion(bookId, levelNumber, currentId);
        if (q == null) {
            System.out.println("✅ Hết câu hỏi ở Level " + levelNumber + " của Book " + bookId);
            break;
        }
        System.out.println("bookId = " + bookId);
System.out.println("levelNumber = " + levelNumber);
System.out.println("currentId = " + currentId);
        System.out.println("📌 Question ID: " + q.getId());
        System.out.println("📝 Nội dung: " + q.getContent());
        System.out.println("🖼️ Hình ảnh: " + q.getImageUrl());

        System.out.println("🔽 Đáp án:");
        for (Answer a : q.getAnswers()) {
            System.out.println(" - " + a.getContent() + (a.isCorrect() ? " ✅" : ""));
        }

        System.out.println("---------------------------------------");

        currentId = q.getId(); // Cập nhật currentId để lấy câu tiếp theo
    }
  }
}

