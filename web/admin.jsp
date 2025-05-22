<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng nhập - Doãn Thắng PC</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      background-color: #fff;
    }
    .login-container {
      max-width: 400px;
      margin: 80px auto;
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .login-container h4 {
      text-align: center;
      margin-bottom: 20px;
      font-weight: 600;
    }
    .form-control:focus {
      box-shadow: none;
      border-color: #198754;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="login-container">
      <h4><i class="fas fa-sign-in-alt"></i> Đăng nhập tài khoản Admin</h4>

      <!-- Kết nối với Servlet admin-login -->
      <form action="admin-login" method="post">
        <div class="mb-3">
          <label for="email" class="form-label">Email</label>
          <input type="text" class="form-control" id="email" name="email" placeholder="example@email.com" required>
        </div>
        <div class="mb-3">
          <label for="password" class="form-label">Mật khẩu</label>
          <input type="password" class="form-control" id="password" name="password" placeholder="********" required>
        </div>
        <div class="d-grid gap-2">
          <button type="submit" class="btn btn-success">
            <i class="fas fa-lock"></i> Đăng nhập
          </button>
        </div>
      </form>

      <!-- Hiển thị lỗi từ Servlet -->
      <p class="text-danger mt-3">${error}</p>
    </div>
  </div>
</body>
</html>
