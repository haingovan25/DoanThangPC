<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Product, java.util.List" %>
<%
    List<Product> results = (List<Product>) request.getAttribute("results");
    String query = (String) request.getAttribute("query");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kết quả tìm kiếm</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
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
<body>
<%@ include file="header.jsp" %>

<div class="container my-4">
    <h4>Kết quả tìm kiếm cho: "<%= query %>"</h4>
    <div class="row mt-4">
        <% if (results != null && !results.isEmpty()) {
            for (Product p : results) { %>
                <div class="col-md-3 mb-4">
                    <div class="card h-100 text-center">
                        <a href="sanpham.jsp?id=<%= p.getProductID() %>" class="text-decoration-none text-dark">
                            <img src="<%= p.getImageURL() %>" class="card-img-top p-3"
                                 alt="<%= p.getProductName() %>" style="height: 180px; object-fit: contain;">
                            <div class="card-body p-2">
                                <p class="card-title product-name mb-1"><%= p.getProductName() %></p>
                                <div class="fw-bold text-success">
                                    <%= String.format("%,.0f", p.getPrice()) %> đ
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
        <% } } else { %>
            <p>Không tìm thấy sản phẩm nào phù hợp với từ khóa "<%= query %>".</p>
        <% } %>
    </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
