<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng ký - Doãn Thắng PC</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      background-color: #fff;
      padding-top: 112px;
    }
    .register-container {
      max-width: 500px;
      margin: 80px auto;
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .register-container h4 {
      text-align: center;
      margin-bottom: 20px;
      font-weight: 600;
    }
    .form-control:focus {
      box-shadow: none;
      border-color: #198754;
    }
    .custom-menu a {
      color: #212529;
      text-decoration: none;
      font-weight: 500;
      font-size: 15px;
      display: flex;
      align-items: center;
      gap: 6px;
    }
    .custom-menu a:hover {
      color: #0d6efd;
    }
  </style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
  <div class="register-container">
    <h4><i class="fas fa-user-plus"></i> Đăng ký tài khoản mới</h4>

    <!-- Hiển thị thông báo lỗi nếu có -->
    <c:if test="${not empty error}">
      <div class="alert alert-danger" role="alert">
        ${error}
      </div>
    </c:if>

    <form action="register" method="post">
      <div class="mb-3">
        <label for="fullname" class="form-label">Họ và tên</label>
        <input type="text" class="form-control" id="fullname" name="fullname" required
               value="${param.fullname != null ? param.fullname : ''}">
      </div>
      <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="email" name="email" required
               value="${param.email != null ? param.email : ''}">
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Mật khẩu</label>
        <input type="password" class="form-control" id="password" name="password" required>
      </div>
      <div class="mb-3">
        <label for="confirm" class="form-label">Nhập lại mật khẩu</label>
        <input type="password" class="form-control" id="confirm" name="confirm" required>
      </div>
      <div class="d-grid gap-2">
        <button type="submit" class="btn btn-success"><i class="fas fa-user-plus"></i> Đăng ký</button>
      </div>
      <div class="text-center mt-3">
        <a href="login.jsp">Đã có tài khoản? Đăng nhập</a>
      </div>
    </form>
  </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
