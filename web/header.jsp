<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <title>Doãn Thắng PC</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  
  <style>
    header {
      position: relative;
      z-index: 1030;
    }
    .navbar {
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      z-index: 1030;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .custom-menu {
      position: fixed;
      top: 56px;
      left: 0;
      right: 0;
      z-index: 1029;
      background-color: #fff;
      border-bottom: 1px solid #dee2e6;
      box-shadow: 0 1px 3px rgba(0,0,0,0.05);
    }
    body {
      padding-top: 112px;
    }
    .navbar-nav {
      margin-left: 10px;
    }
    .dropdown-menu {
      max-height: 300px;
      overflow-y: auto;
      left: auto !important;
      right: 0;
      z-index: 1050;
    }
  </style>
</head>
<body>

<header>
  <nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid d-flex align-items-center">
      <a class="navbar-brand d-flex align-items-center" href="home.jsp">
        <strong>DOÃN THẮNG PC</strong>
      </a>

      <div class="d-flex justify-content-center flex-grow-1">
        <form action="search" method="get" class="d-flex" style="max-width: 600px; width: 100%;">
          <input name="query" class="form-control me-2" type="search" placeholder="Bạn cần tìm gì..." aria-label="Search">
          <button class="btn btn-outline-light" type="submit"><i class="fas fa-search"></i></button>
        </form>

      </div>

      <ul class="navbar-nav mb-2 mb-lg-0 ms-3 d-flex flex-row align-items-center">
        <!-- Giỏ hàng -->
        <li class="nav-item dropdown me-2">
          <div class="dropdown">
            <a class="btn btn-danger text-white dropdown-toggle position-relative" href="#" role="button" id="cartDropdown" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="fas fa-shopping-cart"></i> Giỏ hàng
              <span id="cart-count" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-warning text-dark">0</span>
            </a>
            <ul class="dropdown-menu p-3" style="min-width: 250px;" aria-labelledby="cartDropdown" id="cart-content">
              <li class="dropdown-item text-muted">Không có sản phẩm nào.</li>
            </ul>
          </div>
        </li>

        <!-- Đăng nhập / Chào user và nút đăng xuất -->
        <%
          User user = (User) session.getAttribute("user");
          if (user != null) {
        %>
          <li class="nav-item me-2">
            <span class="navbar-text text-white">
              Hello, <%= user.getFullName() %>
            </span>
          </li>
          <li class="nav-item">
            <a href="logout" class="btn btn-outline-light">
              Đăng xuất
            </a>
          </li>
        <%
          } else {
        %>
          <li class="nav-item">
            <a href="login.jsp" class="btn btn-outline-light">
              <i class="fas fa-sign-in-alt"></i> Đăng nhập
            </a>
          </li>
        <%
          }
        %>
      </ul>
    </div>
  </nav>

  <div class="custom-menu d-flex align-items-center gap-3 px-3 py-2">
    <a href="sanpham.jsp"><i class="fas fa-box"></i> Sản phẩm</a>
    <a href="#"><i class="fas fa-hand-holding-usd"></i> Hình thức thanh toán</a>
    <a href="#"><i class="fas fa-certificate"></i> Chứng nhận các hãng</a>
    <a href="#"><i class="fas fa-award"></i> Tra cứu bảo hành</a>
  </div>
</header>

<!-- Bootstrap Bundle JS (Popper included) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
  let cart = [];

  function addToCart(productName) {
    cart.push(productName);
    document.getElementById("cart-count").textContent = cart.length;

    const cartContent = document.getElementById("cart-content");
    if (cart.length === 0) {
      cartContent.innerHTML = "<li class='dropdown-item text-muted'>Không có sản phẩm nào.</li>";
    } else {
      cartContent.innerHTML = "";
      cart.forEach((item, index) => {
        cartContent.innerHTML += `<li class="dropdown-item">${index + 1}. ${item}</li>`;
      });
    }
  }
</script>

</body>
</html>
