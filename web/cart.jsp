<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng của bạn</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">
    
    <style>
        .cart-section {
            padding: 120px 0 60px;
        }
        .cart-table {
            background: rgba(0, 0, 0, 0.8);
            border-radius: 15px;
            padding: 20px;
            color: #fff;
        }
        .cart-header {
            border-bottom: 2px solid #cda45e;
            padding-bottom: 15px;
            margin-bottom: 20px;
        }
        .cart-item {
            padding: 15px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        .cart-item:last-child {
            border-bottom: none;
        }
        .quantity-control {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        .quantity-btn {
            background: #cda45e;
            border: none;
            color: white;
            width: 30px;
            height: 30px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .quantity-btn:hover {
            background: #d4b16b;
        }
        .quantity-input {
            width: 50px;
            text-align: center;
            background: transparent;
            border: 1px solid #cda45e;
            color: white;
            padding: 5px;
            border-radius: 5px;
        }
        .remove-btn {
            background: #dc3545;
            border: none;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .remove-btn:hover {
            background: #c82333;
        }
        .cart-total {
            margin-top: 30px;
            text-align: right;
            font-size: 1.2em;
        }
        .checkout-btn {
            background: #cda45e;
            color: white;
            border: none;
            padding: 10px 30px;
            border-radius: 50px;
            font-size: 1.1em;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 20px;
        }
        .checkout-btn:hover {
            background: #d4b16b;
        }
        .empty-cart {
            text-align: center;
            padding: 30px;
        }
        .continue-shopping {
            display: inline-block;
            background: #cda45e;
            color: white;
            text-decoration: none;
            padding: 10px 30px;
            border-radius: 50px;
            margin-top: 20px;
            transition: all 0.3s ease;
        }
        .continue-shopping:hover {
            background: #d4b16b;
            color: white;
        }
    </style>
</head>
<body>
    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top d-flex align-items-center">
        <div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">
            <h1 class="logo me-auto me-lg-0"><a href="main.jsp">Restaurantly</a></h1>
            <nav id="navbar" class="navbar order-last order-lg-0">
                <ul>
                    <li><a class="nav-link scrollto" href="main">Home</a></li>
                    <li><a class="nav-link scrollto" href="main">Menu</a></li>
                    <li><a class="nav-link scrollto active" href="cart.jsp">Giỏ hàng <span class="badge bg-secondary">${cartTotalItems}</span></a></li>
                </ul>
            </nav>
        </div>
    </header>
    
    <section class="cart-section">
        <div class="container">
            <div class="cart-table">
                <div class="cart-header">
                    <h2>Món ăn đã được thêm </h2>
                </div>
                
                <c:if test="${empty cart}">
                    <div class="empty-cart">
                        <h3>Thực đơn trống</h3>
                        <p>Hãy thêm món ăn vào thực đơn của bạn</p>
                        <a href="main" class="continue-shopping">Tiếp tục chọn món</a>
                    </div>
                </c:if>
                
                <c:if test="${not empty cart}">
                    <div class="table-responsive">
                        <table class="table table-dark table-hover">
                            <thead>
                                <tr>
                                    <th>Món ăn</th>
                                    <th class="text-center">Giá</th>
                                    <th class="text-center">Số lượng</th>
                                    <th class="text-center">Tổng</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${cart}" var="item">
                                    <tr class="cart-item">
                                        <td>${item.menuName}</td>
                                        <td class="text-center">${item.menuPrice} vnđ</td>
                                        <td>
                                            <div class="quantity-control">
                                                <button type="button" class="quantity-btn decrease-btn" data-menu-id="${item.menuID}">-</button>
                                                <span class="quantity-input">${item.quantity}</span>
                                                <button type="button" class="quantity-btn increase-btn" data-menu-id="${item.menuID}">+</button>
                                            </div>
                                        </td>
                                        <td class="text-center">${item.total} vnđ</td>
                                        <td class="text-center">
                                            <form action="RemoveFromCart" method="POST" style="display: inline;">
                                                <input type="hidden" name="menuID" value="${item.menuID}">
                                                <button type="submit" class="remove-btn remove-from-cart-btn" data-menu-id="${item.menuID}">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="cart-total">
                        <p>Tổng số món: <strong>${cartTotalItems}</strong></p>
                        <p>Tổng tiền: <strong>${cartTotalPrice} vnđ</strong></p>
                        <form action="Checkout" method="POST">
                            <button type="submit" class="checkout-btn">
                                Đặt hàng <i class="bi bi-arrow-right"></i>
                            </button>
                        </form>
                    </div>
                </c:if>
            </div>
        </div>
    </section>
    
    <!-- Vendor JS Files -->
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>
    <script src="assets/js/cart.js"></script>
</body>
</html>
