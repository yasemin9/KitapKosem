package controller;

import model.User;
import dao.UserDAO;
import util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	request.setCharacterEncoding("UTF-8"); // ekledik
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8"); 
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println("Register edilen email: '" + email + "'");

        User user = new User(name, email, password);

        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) {
                response.getWriter().println("Veritabanı bağlantısı sağlanamadı.");
                return;
            }

            UserDAO userDAO = new UserDAO(conn);
            boolean success = userDAO.registerUser(user);

            if (success) {
                response.sendRedirect("login.jsp");
            } else {
                response.getWriter().println("Kayıt başarısız. Bu e-posta zaten kayıtlı olabilir.<br><a href='register.jsp'>Geri dön</a>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Bir hata oluştu: " + e.getMessage());
        }
    }
}
