<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="assets/admin-dashboard.css" rel="stylesheet" type="text/css"/>
    <title>TAT Apple - Dashboard</title>
</head>
<body>
    <div class="container">
        <%@ include file="admin-navbar-left.jsp" %>

        <!-- Main Content -->
        <div class="main-content">
            <%@ include file="admin-header.jsp" %>
            <div class="header-title">
                <h1>TỔNG QUAN BÁN HÀNG TECH APPLE TREND</h1>
            </div>
            <!-- Stats Cards -->
            <div class="stats-cards">
                <div class="card">
                    <div class="icon">🛒</div>
                    <h3>$45.2K</h3>
                    <p>Tổng doanh thu</p>
                </div>
                <div class="card">
                    <div class="icon">📦</div>
                    <h3>2,450</h3>
                    <p>Tổng số sản phẩm bán ra</p>
                </div>
                <div class="card">
                    <div class="icon">👥</div>
                    <h3>3,456</h3>
                    <p>Tổng số khách hàng</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>