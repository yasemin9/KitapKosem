<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>KitapKöşem - Kayıt Ol</title>
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center mb-4">KitapKöşem - Kayıt Ol</h2>
    <form action="/register" method="post" class="card p-4 shadow-sm">
        <div class="mb-3">
            <label for="name" class="form-label">Ad Soyad</label>
            <input type="text" name="name" class="form-control" required/>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">E-Posta</label>
            <input type="email" name="email" class="form-control" required/>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Şifre</label>
            <input type="password" name="password" class="form-control" required/>
        </div>
        <button type="submit" class="btn btn-success w-100">Kayıt Ol</button>
        <p class="mt-3 text-center">Zaten hesabın var mı? <a href="login.jsp">Giriş Yap</a></p>
    </form>
</div>
</body>
</html>
