package controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.UserDAO;
import model.User;
import util.DBConnection;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("currentUser") != null) {
            response.sendRedirect("books?action=list"); // ✅ Doğru sayfaya yönlendirme
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
     
    	
    	 request.setCharacterEncoding("UTF-8"); // ekledik
    	  response.setContentType("text/html; charset=UTF-8");
    	  response.setCharacterEncoding("UTF-8"); 
    	    
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) { 
            UserDAO userDAO = new UserDAO(conn);
            User user = userDAO.validateUser(email, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", user); // ✅ Session’a kullanıcıyı kaydet
                response.sendRedirect("books?action=list"); // ✅ Giriş sonrası kitap listesi
            } else {
                request.setAttribute("errorMessage", "E-posta veya şifre yanlış!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Sunucu hatası");
        }
    }
}


