package controller;

import dao.BookDAO;
import dao.CommentDAO;
import model.Book;
import model.User;
import model.Comment;
import util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/books")
public class BookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) action = "list";

        try (Connection conn = DBConnection.getConnection()) {
            BookDAO bookDAO = new BookDAO(conn);

            if ("list".equals(action)) {
                String keyword = request.getParameter("search");
                List<Book> books;

                if (keyword != null && !keyword.trim().isEmpty()) {
                    books = bookDAO.searchBooksByTitleOrAuthor(keyword.trim());
                } else {
                    books = bookDAO.getAllBooks();
                }

                request.setAttribute("books", books);
                request.getRequestDispatcher("home.jsp").forward(request, response);

            } else if ("add".equals(action)) {
                User user = (User) request.getSession().getAttribute("currentUser");
                if (user == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }
                request.getRequestDispatcher("add_book.jsp").forward(request, response);

            } else if ("detail".equals(action)) {
                String idStr = request.getParameter("id");
                if (idStr != null) {
                    int bookId = Integer.parseInt(idStr);
                    Book book = bookDAO.getBookById(bookId);
                    if (book != null) {
                        CommentDAO commentDAO = new CommentDAO(conn);
                        List<Comment> comments = commentDAO.getCommentsByBookId(bookId);
                        double averageRating = commentDAO.getAverageRatingByBookId(bookId);

                        request.setAttribute("book", book);
                        request.setAttribute("comments", comments);
                        request.setAttribute("averageRating", averageRating);

                        request.getRequestDispatcher("book_details.jsp").forward(request, response);
                    } else {
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Kitap bulunamadı");
                    }
                } else {
                    response.sendRedirect("books?action=list");
                }

            } else {
                response.sendRedirect("books?action=list");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Sunucu hatası");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        User user = (User) request.getSession().getAttribute("currentUser");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String description = request.getParameter("description");

        if (title == null || author == null || title.isEmpty() || author.isEmpty()) {
            request.setAttribute("errorMessage", "Kitap başlığı ve yazar adı zorunludur.");
            request.getRequestDispatcher("add_book.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            BookDAO bookDAO = new BookDAO(conn);
            Book book = new Book();
            book.setTitle(title);
            book.setAuthor(author);
            book.setDescription(description);
            book.setUserId(user.getId());

            boolean success = bookDAO.addBook(book);
            if (success) {
                response.sendRedirect("books?action=list");
            } else {
                request.setAttribute("errorMessage", "Kitap eklenirken hata oluştu.");
                request.getRequestDispatcher("add_book.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Sunucu hatası");
        }
    }
}
