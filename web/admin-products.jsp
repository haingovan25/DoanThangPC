<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="dal.ProductDAO"%>
<%@ page import="java.text.DecimalFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ProductDAO dao = new ProductDAO();
    List<Product> productList = dao.getAllProducts();
    productList.sort((p1, p2) -> Integer.compare(p1.getProductID(), p2.getProductID()));
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin - Products</title>
        <link href="admin-product.css" rel="stylesheet" type="text/css"/>
        <link href="admin-dashboard.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
                <%@ include file="admin-navbar-left.jsp" %>

                <!-- Main Content -->
                <div class="main-content">
                    <%@ include file="admin-header.jsp" %>
                <div class="header-title">
                    <h1 style="font-family: 'Montserrat-Regular';">SẢN PHẨM</h1>
                </div>

                <!-- Thêm sản phẩm -->
                <div>
                    <a href="admin-add-products.jsp" class="add-product-button">Thêm sản phẩm</a>
                </div>

                <!-- Bảng danh sách sản phẩm -->
                <div>
                    <table border="1" cellspacing="0" cellpadding="5" style="width: 100%; text-align: center;">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Category ID</th>
                                <th>Tên</th>
                                <th>Mô tả</th>
                                <th>Giá</th>
                                <th>Hình ảnh</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
    DecimalFormat formatter = new DecimalFormat("#,###");
    for (Product p : productList) {
%>
    <tr>
        <td><%= p.getProductID() %></td>
        <td><%= p.getCategoryID() %></td>
        <td><%= p.getProductName() %></td>
        <td>
            <%
                String desc = p.getDescription();
                if (desc != null && desc.length() > 50) {
                    desc = desc.substring(0, 50) + "...";
                }
            %>
            <%= desc %>
        </td>
        <td><%= formatter.format(p.getPrice()) %>đ</td>
        <td>
            <% if (p.getImageURL() != null && !p.getImageURL().isEmpty()) { %>
                <img src="<%= p.getImageURL() %>" alt="Image" style="width: 60px; height: 60px;" />
            <% } else { %>
                <span>Không có ảnh</span>
            <% } %>
        </td>
        <td>
            <a href="editproduct?id=<%= p.getProductID() %>" class="edit-button"
               style="display: inline-block;margin-right: 10px;margin-bottom: 5px; text-decoration: none">
               Sửa
            </a><br>
            <a href="#" onclick="confirmDelete('<%= p.getProductID() %>', '<%= p.getProductName() %>');"
               class="delete-button"
               style="display: inline-block; text-decoration: none">
               Xóa
            </a>
                        </td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                           <script>
    function confirmDelete(productID, productName) {
        if (confirm("Bạn có chắc muốn xóa sản phẩm: " + productName + " (ID: " + productID + ")?")) {
            window.location.href = "deleteproduct?productID=" + productID;
        }
    }
</script>
                    </table>
                </div>
            </div>
        </div>
    </body> 
</html>