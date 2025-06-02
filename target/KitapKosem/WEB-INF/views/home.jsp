<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Book" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Kitap Listesi</title>
</head>
<body>
    <h2>Kitap Listesi</h2>

    <form action="books" method="get">
        <input type="text" name="search" placeholder="Kitap Ara...">
        <button type="submit">Ara</button>
    </form>

    <c:forEach var="book" items="${books}">
        <div style="border:1px solid #ccc; margin:10px; padding:10px;">
            <h4>${book.title}</h4>
            <p>Yazar: ${book.author}</p>
            <p>${book.description}</p>
        </div>
    </c:forEach>
</body>
</html>
