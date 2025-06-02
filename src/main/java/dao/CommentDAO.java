package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Comment;

public class CommentDAO {
    private Connection conn;

    public CommentDAO(Connection conn) {
        this.conn = conn;
    }

    // Kitaba ait tüm yorumları getir
    public List<Comment> getCommentsByBookId(int bookId) throws SQLException {
        List<Comment> comments = new ArrayList<>();
        String sql = "SELECT * FROM comments WHERE book_id = ? ORDER BY id DESC";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, bookId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Comment comment = mapRowToComment(rs);
                    comments.add(comment);
                }
            }
        }
        return comments;
    }

    // Yeni yorum ekle
    public boolean addComment(Comment comment) throws SQLException {
        String sql = "INSERT INTO comments (book_id, user_id, content, rating) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, comment.getBookId());
            stmt.setInt(2, comment.getUserId());
            stmt.setString(3, comment.getContent());
            stmt.setInt(4, comment.getRating());
            int rows = stmt.executeUpdate();
            return rows > 0;
        }
    }

    // Kitaba verilen ortalama puanı hesapla
    public double getAverageRatingByBookId(int bookId) throws SQLException {
        String sql = "SELECT AVG(rating) AS avg_rating FROM comments WHERE book_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, bookId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble("avg_rating");
                }
            }
        }
        return 0.0;
    }

    // Satırdan Comment nesnesi oluştur
    private Comment mapRowToComment(ResultSet rs) throws SQLException {
        Comment comment = new Comment();
        comment.setId(rs.getInt("id"));
        comment.setBookId(rs.getInt("book_id"));
        comment.setUserId(rs.getInt("user_id"));
        comment.setContent(rs.getString("content"));
        comment.setRating(rs.getInt("rating"));
        return comment;
    }
}
