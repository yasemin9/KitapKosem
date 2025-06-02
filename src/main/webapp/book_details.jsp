<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Book, model.Comment, model.User, java.util.List" %>
<%@ page session="true" %>
<%
    Book book = (Book) request.getAttribute("book");
    List<Comment> comments = (List<Comment>) request.getAttribute("comments");
    Double avgRating = (Double) request.getAttribute("averageRating");
    User currentUser = (User) session.getAttribute("currentUser");
%>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title><%= book.getTitle() %> - Kitap Detayı</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            background-image: url('https://images.pexels.com/photos/6344231/pexels-photo-6344231.jpeg?auto=compress&cs=tinysrgb&w=600');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .content-wrapper {
            background-color: rgba(255, 255, 255, 0.92);
            border-radius: 12px;
            padding: 30px;
            margin-top: 40px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        .card {
            border-radius: 12px;
        }

        .card-title {
            color: #343a40;
        }

        h4, h5 {
            margin-top: 30px;
        }

        .btn-success {
            background-color: #4caf50;
            border: none;
        }

        .btn-success:hover {
            background-color: #43a047;
        }

        .alert {
            border-radius: 10px;
        }
    </style>
</head>
<body>
<div class="container content-wrapper">
    <!-- Kitap Detay Kartı -->
    <div class="card mb-4 shadow-sm">
        <div class="card-body">
            <h2 class="card-title"><%= book.getTitle() %></h2>
            <h5 class="card-subtitle mb-2 text-muted">Yazar: <%= book.getAuthor() %></h5>
            <p class="card-text"><%= book.getDescription() %></p>
            <p class="text-warning fw-bold">⭐ Ortalama Puan: <%= avgRating != null ? String.format("%.1f", avgRating) : "Henüz puan yok" %>/5</p>
        </div>
    </div>

    <!-- Yorumlar -->
    <div>
        <h4>💬 Yorumlar</h4>
        <% if (comments != null && !comments.isEmpty()) { %>
            <% for (Comment c : comments) { %>
                <div class="card mb-3">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <span class="badge bg-primary">Puan: <%= c.getRating() %>/5</span>
                        </div>
                        <p class="mt-2 mb-0"><%= c.getContent() %></p>
                    </div>
                </div>
            <% } %>
        <% } else { %>
            <div class="alert alert-info">Henüz yorum yapılmamış.</div>
        <% } %>
    </div>

    <!-- Yorum Formu -->
    <% if (currentUser != null) { %>
        <div class="card shadow-sm mt-4">
            <div class="card-body">
                <h5 class="card-title">📝 Yorum Yap</h5>
                <form action="comment" method="post">
                    <input type="hidden" name="bookId" value="<%= book.getId() %>">

                    <div class="mb-3">
                        <label for="content" class="form-label">Yorum</label>
                        <textarea class="form-control" id="content" name="content" rows="4" required></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="rating" class="form-label">Puan</label>
                        <select class="form-select" id="rating" name="rating">
                            <% for (int i = 1; i <= 5; i++) { %>
                                <option value="<%= i %>"><%= i %></option>
                            <% } %>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-success">Gönder</button>
                </form>
            </div>
        </div>
    <% } else { %>
        <div class="alert alert-warning mt-4">
            Yorum yapmak için <a href="login.jsp" class="alert-link">giriş yapmalısınız</a>.
        </div>
    <% } %>
</div>
</body>
</html>
