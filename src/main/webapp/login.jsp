<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>KitapKöşem - Giriş Yap</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://images.pexels.com/photos/6344231/pexels-photo-6344231.jpeg?auto=compress&cs=tinysrgb&w=600');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
            width: 100%;
            max-width: 400px;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h3 class="text-center mb-4">📚 KitapKöşem - Giriş Yap</h3>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">E-Posta</label>
            <input type="email" name="email" class="form-control" required/>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Şifre</label>
            <input type="password" name="password" class="form-control" required/>
        </div>
        <button type="submit" class="btn btn-primary w-100">Giriş Yap</button>
        <p class="mt-3 text-center">Hesabın yok mu? <a href="register.jsp">Kayıt Ol</a></p>
        <c:if test="${not empty errorMessage}">
            <p class="text-danger text-center mt-2">${errorMessage}</p>
        </c:if>
    </form>
</div>
</body>
</html>
