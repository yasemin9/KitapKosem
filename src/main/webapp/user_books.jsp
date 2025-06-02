<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Book" %>

<%
    // Oturumdan kullanıcıyı alıyoruz
    model.User currentUser = (model.User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Kullanıcının kitap listesini request attribute'tan alıyoruz
    List<Book> userBooks = (List<Book>) request.getAttribute("userBooks");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Kitaplarım - KitapKöşem</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="container mt-4">
    <h2>Merhaba, <%= currentUser.getName() %>! Eklediğin Kitaplar</h2>

    <a href="addBook.jsp" class="btn btn-primary mb-3">Yeni Kitap Ekle</a>

    <%
        if (userBooks == null || userBooks.isEmpty()) {
    %>
        <p>Henüz kitap eklemedin.</p>
    <%
        } else {
    %>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Kitap Başlığı</th>
                    <th>Yazar</th>
                    <th>Açıklama</th>
                    <th>Detaylar</th>
                </tr>
            </thead>
            <tbody>
            <%
                for (Book book : userBooks) {
            %>
                <tr>
                    <td><%= book.getTitle() %></td>
                    <td><%= book.getAuthor() %></td>
                    <td><%= book.getDescription() %></td>
                    <td>
                        <a href="bookDetails?id=<%= book.getId() %>" class="btn btn-info btn-sm">Detayları Gör</a>
                    </td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    <%
        }
    %>
</div>
</body>
</html>
