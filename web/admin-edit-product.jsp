<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Product"%>
<%
    // Lấy product từ request attribute do servlet doGet set
    Product product = (Product) request.getAttribute("product");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400&display=swap" rel="stylesheet">

    <link href="admin-product.css" rel="stylesheet" type="text/css"/>
    <link href="admin-dashboard.css" rel="stylesheet" type="text/css"/>
    <link href="admin-edit-product.css" rel="stylesheet" type="text/css"/>
    <title>Sửa Sản Phẩm</title>
</head>
<body>
    <div class="container">
        <%@ include file="admin-navbar-left.jsp" %>

        <!-- Main Content -->
        <div class="main-content">
            <%@ include file="admin-header.jsp" %>
            <div class="header-title">
                <h1 style="font-family: 'Montserrat-Regular';">SỬA SẢN PHẨM</h1>
            </div>

            <!-- Edit Product Form -->
            <div class="edit-product-form">
                <form action="editproduct" method="POST">
                    <input type="hidden" name="productID" value="<%=product.getProductID()%>">

                    <div class="form-group">
                        <label for="productName">Tên sản phẩm</label>
                        <input type="text" id="productName" name="productName" value="<%=product.getProductName()%>" required>
                    </div>

                    <div class="form-group">
                        <label for="categoryID">Danh mục (Category ID)</label>
                        <input type="number" id="categoryID" name="categoryID" value="<%=product.getCategoryID()%>" required>
                    </div>

                    <div class="form-group">
                        <label for="price">Giá (VND)</label>
                        <input type="number" id="basePrice" name="price" step="0.01" value="<%= String.format("%.0f", product.getPrice()) %>" required
                    </div>

                    <div class="form-group">
                        <label for="description">Mô tả</label>
                        <textarea id="description" name="description" rows="4" required><%=product.getDescription()%></textarea>
                    </div>

                    <div class="form-group">
                        <label for="imageURL">Ảnh sản phẩm (Image URL)</label>
                        <input type="text" id="imageURL" name="imageURL" value="<%=product.getImageURL()%>" required>
                    </div>

                    <div class="form-buttons">
                        <button type="submit" class="save-button">Lưu</button>
                        <a href="admin-products.jsp" class="cancel-button">Hủy</a>
                    </div>
                </form>
            </div>

            <%-- Hiện lỗi nếu có --%>
            <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
                <div class="error-message" style="color:red;"><%=error %></div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
