<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>Kitap Köşem</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            background-image: url('https://images.pexels.com/photos/6344231/pexels-photo-6344231.jpeg?auto=compress&cs=tinysrgb&w=600');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            font-family: 'Segoe UI', sans-serif;
            backdrop-filter: blur(2px);
        }
        .container {
            background-color: rgba(255, 255, 255, 0.85);
            padding: 30px;
            border-radius: 1rem;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
            margin-top: 60px;
        }
        .card {
            border-radius: 1rem;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            background-color: rgba(255, 255, 255, 0.95);
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }
        h2 {
            font-weight: bold;
            color: #004d40;
        }
        .btn {
            margin: 2px;
        }
        .input-group input {
            border-radius: 0.5rem 0 0 0.5rem;
        }
        .input-group .btn {
            border-radius: 0 0.5rem 0.5rem 0;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="top-bar mb-4">
        <h2>📚 Kitap Köşem</h2>
        <div>
            <c:choose>
                <c:when test="${not empty sessionScope.currentUser}">
                    <a href="books?action=add" class="btn btn-success">➕ Kitap Ekle</a>
                    <a href="books?action=mybooks" class="btn btn-outline-primary">📁 Kitaplarım</a>
                    <a href="logout" class="btn btn-outline-danger">🚪 Çıkış Yap</a>
                </c:when>
                <c:otherwise>
                    <a href="login.jsp" class="btn btn-outline-dark">Giriş Yap</a>
                    <a href="register.jsp" class="btn btn-outline-success">Kayıt Ol</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <form action="books" method="get" class="mb-4">
        <div class="input-group">
            <input type="text" name="search" placeholder="Kitap Ara..." class="form-control"/>
            <button type="submit" class="btn btn-dark">Ara</button>
        </div>
    </form>

    <c:choose>
        <c:when test="${not empty books}">
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <c:forEach var="book" items="${books}">
                    <div class="col">
                        <div class="card h-100">
                            <div class="card-body">
                                <h5 class="card-title text-primary fw-bold">${book.title}</h5>
                                <h6 class="card-subtitle mb-2 text-muted">Yazar: ${book.author}</h6>
                                <p class="card-text">${book.description}</p>
                            </div>
                            <div class="card-footer bg-transparent border-0 text-end">
                                <a href="books?action=detail&id=${book.id}" class="btn btn-outline-info btn-sm">Detayları Gör</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-warning text-center">Henüz kitap bulunmuyor.</div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
