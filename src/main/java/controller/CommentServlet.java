package controller;

import dao.CommentDAO;
import model.Comment;
import model.User;
import util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Yorum ve puan ekleme
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	
    	request.setCharacterEncoding("UTF-8"); // ekledik
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        User user = (User) request.getSession().getAttribute("currentUser");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String bookIdStr = request.getParameter("bookId");
        String content = request.getParameter("content");
        String ratingStr = request.getParameter("rating");

        if (bookIdStr == null || content == null || ratingStr == null || content.trim().isEmpty()) {
            response.sendRedirect("books?action=detail&id=" + bookIdStr);
            return;
        }

        try {
            int bookId = Integer.parseInt(bookIdStr);
            int rating = Integer.parseInt(ratingStr);

            if (rating < 1 || rating > 5) {
                response.sendRedirect("books?action=detail&id=" + bookId);
                return;
            }

            try (Connection conn = DBConnection.getConnection()) {
                CommentDAO commentDAO = new CommentDAO(conn);
                Comment comment = new Comment();
                comment.setBookId(bookId);
                comment.setUserId(user.getId());
                comment.setContent(content);
                comment.setRating(rating);
                commentDAO.addComment(comment);
            }

            response.sendRedirect("books?action=detail&id=" + bookId);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Sunucu hatası");
        }
    }
}
