<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Comment" %>
<%@ page import="model.Book" %>
<%@ page session="true" %>
<%
    Book book = (Book) request.getAttribute("book");
    List<Comment> comments = (List<Comment>) request.getAttribute("comments");
    double avgRating = (double) request.getAttribute("averageRating");
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= book.getTitle() %> - Detaylar</title>
</head>
<body>
    <h2><%= book.getTitle() %></h2>
    <p><strong>Yazar:</strong> <%= book.getAuthor() %></p>
    <p><%= book.getDescription() %></p>
    <p><strong>Ortalama Puan:</strong> <%= String.format("%.1f", avgRating) %>/5</p>

    <hr>

    <h3>Yorumlar</h3>
    <%
        for (Comment c : comments) {
    %>
        <div style="border: 1px solid #ccc; margin: 10px; padding: 10px;">
            <p><strong>Puan:</strong> <%= c.getRating() %>/5</p>
            <p><%= c.getContent() %></p>
        </div>
    <%
        }
    %>

    <hr>
    <%
        if (session.getAttribute("user") != null) {
    %>
        <h3>Yorum Yap</h3>
        <form method="post" action="book-details">
            <input type="hidden" name="bookId" value="<%= book.getId() %>">
            <label>Yorum:</label><br>
            <textarea name="content" required></textarea><br><br>
            <label>Puan:</label>
            <select name="rating">
                <%
                    for (int i = 1; i <= 5; i++) {
                %>
                    <option value="<%= i %>"><%= i %></option>
                <%
                    }
                %>
            </select><br><br>
            <button type="submit">Gönder</button>
        </form>
    <%
        } else {
    %>
        <p><a href="login.jsp">Giriş yap</a> yaparak yorum yapabilirsin.</p>
    <%
        }
    %>
</body>
</html>
