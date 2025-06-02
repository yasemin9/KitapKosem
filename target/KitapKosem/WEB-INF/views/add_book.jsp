<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Kitap Ekle</title>
    <link rel="stylesheet" href="../../assets/css/style.css">
</head>
<body>
    <h2>Yeni Kitap Ekle</h2>
    <form action="${pageContext.request.contextPath}/books" method="post">
        <label>Başlık:</label><br>
        <input type="text" name="title" required><br><br>

        <label>Yazar:</label><br>
        <input type="text" name="author" required><br><br>

        <label>Açıklama:</label><br>
        <textarea name="description"></textarea><br><br>

        <button type="submit">Ekle</button>
    </form>
</body>
</html>
