<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Product, model.Category, java.util.List" %>
<%
    List<Category> categories = (List<Category>) request.getAttribute("categories");
    List<Product> products = (List<Product>) request.getAttribute("products");
%>



<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Doãn Thắng PC</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      background-color: #fff;
    }
    .list-group-item.dropdown:hover .dropdown-menu {
      display: block !important;
      position: absolute;
      left: 100%;
      top: 0;
      z-index: 1000;
      border: 1px solid #dee2e6;
      background-color: #fff;
      width: max-content;
      min-width: 220px;
    }
    .list-group-item.dropdown .dropdown-menu {
      top: 0 !important;
      left: 100% !important;
      margin-top: 0;
      margin-left: 0;
      border: 1px solid #dee2e6;
      background-color: #fff;
      min-width: 220px;
      z-index: 1050;
    }
    .list-group-item.dropdown {
      position: relative;
    }
    .list-group-item a, .dropdown-menu .dropdown-item {
      color: #212529;
      text-decoration: none;
    }
    .custom-menu {
      display: flex;
      align-items: center;
      gap: 30px;
      padding: 8px 16px;
      border-bottom: 1px solid #dee2e6;
      background-color: #fff;
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
    .slider-banner {
      width: 100%;
      max-height: 340px;
      height: auto;
      object-fit: contain;
      transition: transform 0.2s ease;
      cursor: pointer;
    }
    .slider-banner:hover {
      transform: scale(1.03);
    }
    .small-banner {
      height: 160px;
      width: 100%;
      object-fit: cover;
      transition: transform 0.2s ease;
      cursor: pointer;
    }
    .small-banner:hover {
      transform: scale(1.03);
    }
    .product-section {
      padding: 32px 16px;
    }
    .product-section h4 {
      font-weight: 600;
      margin-bottom: 24px;
    }
    .product-card {
      border: 1px solid #dee2e6;
      padding: 12px;
      border-radius: 8px;
      text-align: center;
      transition: transform 0.2s ease;
      height: 100%;
      position: relative;
    }
    .product-card:hover {
      transform: translateY(-4px);
    }
    .product-name {
      font-size: 14px;
      height: 48px;
      overflow: hidden;
    }
    .price-new {
      font-weight: 700;
      color: green;
    }
    .price-old {
      text-decoration: line-through;
      color: #999;
      font-size: 13px;
    }
    .discount-tag {
      background-color: red;
      color: white;
      font-size: 12px;
      padding: 2px 6px;
      border-radius: 4px;
    }
    .see-all-btn {
      display: inline-block;
      margin-top: 16px;
      padding: 6px 16px;
      border: 1px solid green;
      border-radius: 4px;
      color: green;
      background-color: white;
      text-decoration: none;
      font-weight: 500;
    }
    .see-all-btn:hover {
      background-color: #e9f9ef;
    }
    .cart-badge {
      position: absolute;
      top: -8px;
      right: -8px;
      font-size: 12px;
    }
 </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-lg-3 col-md-4 bg-light p-0">
                <div class="bg-danger text-white fw-bold p-2">
                    <i class="fas fa-bars"></i> DANH MỤC SẢN PHẨM
                </div>
                <ul class="list-group border-0 rounded-0">
                    <% for (Category c : categories) { %>
                        <li class="list-group-item border-0 p-0">
                            <a href="products?category=<%=c.getCategoryID()%>" class="d-flex justify-content-between align-items-center px-3 py-2">
                                <span><i class="fas fa-laptop me-2"></i><%= c.getCategoryName() %></span>
                            </a>
                        </li>
                    <% } %>
                </ul>
            </div>

          
          
          
          
          <div class="col-lg-9 col-md-8">
            <div class="row gx-3 mb-3">
              <div class="col-lg-8">
                <img src="images/slider_1.webp" alt="Slider Chính" class="slider-banner rounded">
              </div>
              <div class="col-lg-4 d-flex flex-column gap-3">
                <img src="images/right_banner_1.webp" alt="Banner phụ 1" class="small-banner rounded">
                <img src="images/right_banner_2.webp" alt="Banner phụ 2" class="small-banner rounded">
              </div>
            </div>
            <div class="row g-3">
              <div class="col-md-4">
                <img src="images/bottom_banner_1.webp" alt="Thiết bị mạng" class="small-banner rounded">
              </div>
              <div class="col-md-4">
                <img src="images/bottom_banner_2.webp" alt="Laptop" class="small-banner rounded">
              </div>
              <div class="col-md-4">
                <img src="images/bottom_banner_3.webp" alt="Linh kiện máy tính" class="small-banner rounded">
              </div>
            </div>
          </div>
        </div>
    </div>
    <div class="container product-section">
        <h4 style="text-align: center;">SẢN PHẨM</h4>
      <div class="row">
                <% for (Product p : products) { %>
          <div class="col-md-3 mb-4">
            <div class="card h-100 text-center position-relative product-card">
              <a href="infoproduct?pid=<%= p.getProductID() %>" class="text-decoration-none text-dark">
                <img src="<%= p.getImageURL() %>" class="card-img-top p-3"
                     alt="<%= p.getProductName() %>" style="height: 180px; object-fit: contain;">
                <div class="card-body p-2">
                  <p class="card-title product-name mb-1"><%= p.getProductName() %></p>
                  <div class="fw-bold text-success price-new">
                    <%= String.format("%,.0f", p.getPrice()) %> đ
                  </div>
                </div>
              </a>
            </div>
          </div>
        <% } %>
      </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
