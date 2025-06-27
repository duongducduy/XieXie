/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author duong
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

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
            out.println("<title>Servlet ResetPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResetPassword at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("USER") != null) {
            response.sendRedirect("choosebook.jsp");
            return;
        }

        // Nếu chưa → forward tới login.jsp
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");

String emailRaw = request.getParameter("email");
String passRaw = request.getParameter("password");

String email = (emailRaw != null) ? emailRaw.trim().toLowerCase() : "";
String pass = (passRaw != null) ? passRaw : "";

try {
    if (email.isEmpty() || pass.isEmpty()) {
        request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin.");
        request.setAttribute("email", email);
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }

    UserDAO userDAO = new UserDAO();
    Users u = userDAO.checkLogin(email, pass);

    if (u == null) {
        request.setAttribute("error", "Email hoặc mật khẩu không đúng.");
        request.setAttribute("email", email);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } else {
        HttpSession session = request.getSession();
        session.setAttribute("USER", u);
        response.sendRedirect("dashboard.jsp");
    }
} catch (Exception e) {
    e.printStackTrace();
    request.setAttribute("error", "Đăng nhập thất bại do lỗi hệ thống.");
    request.getRequestDispatcher("login.jsp").forward(request, response);
}

    
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
