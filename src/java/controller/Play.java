/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DBContext;
import dal.QuestionDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Answer;
import model.Question;

/**
 *
 * @author duong
 */
@WebServlet(name = "Play", urlPatterns = {"/play"})
public class Play extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Play</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Play at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String bookIdRaw = request.getParameter("bookId");
        String levelRaw = request.getParameter("levelNumber");
        String currentIdRaw = request.getParameter("currentId");  // id câu hỏi hiện tại

        int bookId = 1;
        int levelNumber = 1;
        int currentId = request.getParameter("currentId") != null
    ? Integer.parseInt(request.getParameter("currentId"))
    : 0;

        String scoreRaw = request.getParameter("score");
        String livesRaw = request.getParameter("lives");
        String bunnyPosRaw = request.getParameter("bunnyPos");

        // Debug xem có giá trị không
        System.out.println("RAW score: " + scoreRaw);
        System.out.println("RAW lives: " + livesRaw);
        System.out.println("RAW bunnyPos: " + bunnyPosRaw);

        int score = 0;
        int lives = 3;
        int bunnyPos = 100;

        try {
            if (scoreRaw != null && !scoreRaw.isEmpty()) {
                score = Integer.parseInt(scoreRaw);
            }
            if (livesRaw != null && !livesRaw.isEmpty()) {
                lives = Integer.parseInt(livesRaw);
            }
            if (bunnyPosRaw != null && !bunnyPosRaw.isEmpty()) {
                bunnyPos = Integer.parseInt(bunnyPosRaw);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        try {
            if (bookIdRaw != null) {
                bookId = Integer.parseInt(bookIdRaw);
            }
            if (levelRaw != null) {
                levelNumber = Integer.parseInt(levelRaw);
            }
            if (currentIdRaw != null) {
                currentId = Integer.parseInt(currentIdRaw);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        System.out.println("DEBUG Servlet - score: " + score + ", lives: " + lives + ", bunnyPos: " + bunnyPos);

        QuestionDAO dao = new QuestionDAO();
        Question q = dao.getNextQuestion(bookId, levelNumber, currentId);

        if (q == null) {
            // Không còn câu hỏi → chuyển đến trang hoàn thành
            request.setAttribute("score", score);
            request.setAttribute("lives", lives);
            request.setAttribute("bunnyPos", bunnyPos);
            response.sendRedirect("complete.jsp?score=" + score +
                      "&lives=" + lives +
                      "&bunnyPos=" + bunnyPos +
                      "&level=" + levelNumber);
            return;
        }

        // Lấy đáp án đúng
        String correctAnswer = "";
        for (Answer a : q.getAnswers()) {
            if (a.isCorrect()) {
                correctAnswer = a.getContent();
                break;
            }
        }

        // Gửi dữ liệu sang JSP
        request.setAttribute("question", q);
        request.setAttribute("score", score);
        request.setAttribute("lives", lives);
        request.setAttribute("bunnyPos", bunnyPos);
        request.setAttribute("correctAnswer", correctAnswer);
        request.setAttribute("bookId", bookId);
        request.setAttribute("level", levelNumber);
        request.setAttribute("currentId", currentId);

        request.getRequestDispatcher("play.jsp").forward(request, response);
    }

    private int getIntParam(HttpServletRequest req, String param, int defaultVal) {
        String raw = req.getParameter(param);
        if (raw != null && !raw.isEmpty()) {
            try {
                return Integer.parseInt(raw);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        return defaultVal;
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
