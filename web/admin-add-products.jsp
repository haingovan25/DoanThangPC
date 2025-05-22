<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400&display=swap" rel="stylesheet">
    <link href="admin-product.css" rel="stylesheet" type="text/css"/>
    <link href="admin-dashboard.css" rel="stylesheet" type="text/css"/>
    <link href="admin-edit-product.css" rel="stylesheet" type="text/css"/>
    <title>Thêm Sản Phẩm</title>
</head>
<body>
    <div class="container">
        <%@ include file="admin-navbar-left.jsp" %>

        <!-- Main Content -->
        <div class="main-content">
            <%@ include file="admin-header.jsp" %>
            <div class="header-title">
                <h1 style="font-family: 'Montserrat-Regular';">THÊM SẢN PHẨM MỚI</h1>
            </div>

            <!-- Add Product Form -->
            <div class="edit-product-form">
                <form action="add-product" method="POST">
                    <div class="form-group">
                        <label for="productName">Tên sản phẩm</label>
                        <input type="text" id="productName" name="productName" required>
                    </div>

                    <div class="form-group">
                        <label for="categoryID">Danh mục (Category ID)</label>
                        <input type="number" id="categoryID" name="categoryID" required>
                    </div>

                    <div class="form-group">
                        <label for="basePrice">Giá (VND)</label>
                        <input type="number" id="basePrice" name="price" step="0.01" required>
                    </div>

                    <div class="form-group">
                        <label for="description">Mô tả</label>
                        <textarea id="description" name="description" rows="4" required></textarea>
                    </div>

                    <div class="form-group">
                        <label for="imageURL">Ảnh sản phẩm (Image URL)</label>
                        <input type="text" id="imageURL" name="imageURL" required>
                    </div>

                    <div class="form-buttons">
                        <button type="submit" class="save-button">Thêm</button>
                        <a href="admin-products.jsp" class="cancel-button">Hủy</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
