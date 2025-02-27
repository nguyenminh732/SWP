<%-- 
    Document   : main.jsp
    Created on : Feb 9, 2025, 6:27:49 PM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Restaurantly Bootstrap Template - Index</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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

        <!-- =======================================================
        * Template Name: Restaurantly - v3.1.0
        * Template URL: https://bootstrapmade.com/restaurantly-restaurant-template/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>

    <body>


        <main id="main">

            <!-- ======= Menu Section ======= -->
            <section id="menu" class="menu section-bg">
                <div class="container" data-aos="fade-up">

                    <div class="section-title">
                        <h2>Menu</h2>
                        <c:forEach items="${table}" var="tb">
                        <p>Gọi món cho bàn số ${tb.tableNum}</p>
                        </c:forEach>
                    </div>

                    <div class="row" data-aos="fade-up" data-aos-delay="100">
                        <div class="col-lg-12 d-flex justify-content-center">
                            <ul id="menu-flters">
                                <li data-filter="*" class="filter-active">Tất cả</li>
                                <li data-filter=".filter-sale">Ưu đãi</li>
                                <li data-filter=".filter-new">Món Mới</li>
                                <li data-filter=".filter-chicken">Gà rán</li>
                                <li data-filter=".filter-burgur">Burger - Cơm - Mì Ý</li>
                                <li data-filter=".filter-light">Thức ăn nhẹ</li>
                                <li data-filter=".filter-drink">Đồ uống & Trang Miệng</li>
                            </ul>
                        </div>
                    </div>

                    <div class="row menu-container" data-aos="fade-up" data-aos-delay="200">


<c:forEach items="${listMenuByCateID6}" var="menuItem6">
    <div class="col-lg-6 menu-item filter-sale">
        <img src="assets/img/menu/bread-barrel.jpg" class="menu-img" alt="">
        <div class="menu-content">
            <a href="#">${menuItem6.menuName}</a>
            <div class="price">
                <span class="original-price" style="text-decoration: line-through; color: gray; font-weight: bold;">
                    ${menuItem6.menuPrice} vnđ
                </span><br>
                <span class="sale-price">sale vnđ</span>
            </div>
        </div>
        <div class="menu-ingredients">${menuItem6.menuDesc}</div>
        <div class="quantity-selector">
            <button class="btn-minus" onclick="updateQuantity(this, -1)">-</button>
            <span class="quantity">0</span>
            <button class="btn-plus" onclick="updateQuantity(this, 1)">+</button>
        </div>
    </div>
</c:forEach>

<c:forEach items="${listMenuByCateID1}" var="menuItem1">
    <div class="col-lg-6 menu-item filter-new">
        <img src="assets/img/menu/bread-barrel.jpg" class="menu-img" alt="">
        <div class="menu-content">
            <a href="#">${menuItem1.menuName}</a>
            <div class="price">
                <span class="original-price">${menuItem1.menuPrice} vnđ</span><br>
            </div>
        </div>
        <div class="menu-ingredients">${menuItem1.menuDesc}</div>
        <div class="quantity-selector">
            <button class="btn-minus" onclick="updateQuantity(this, -1)">-</button>
            <span class="quantity">0</span>
            <button class="btn-plus" onclick="updateQuantity(this, 1)">+</button>
        </div>
    </div>
</c:forEach>

<c:forEach items="${listMenuByCateID2}" var="menuItem2">
    <div class="col-lg-6 menu-item filter-chicken">
        <img src="assets/img/menu/bread-barrel.jpg" class="menu-img" alt="">
        <div class="menu-content">
            <a href="#">${menuItem2.menuName}</a>
            <div class="price">
                <span class="original-price">${menuItem2.menuPrice} vnđ</span><br>
            </div>
        </div>
        <div class="menu-ingredients">${menuItem2.menuDesc}</div>
        <div class="quantity-selector">
            <button class="btn-minus" onclick="updateQuantity(this, -1)">-</button>
            <span class="quantity">0</span>
            <button class="btn-plus" onclick="updateQuantity(this, 1)">+</button>
        </div>
    </div>
</c:forEach>

<c:forEach items="${listMenuByCateID3}" var="menuItem3">
    <div class="col-lg-6 menu-item filter-burgur">
        <img src="assets/img/menu/bread-barrel.jpg" class="menu-img" alt="">
        <div class="menu-content">
            <a href="#">${menuItem3.menuName}</a>
            <div class="price">
                <span class="original-price">${menuItem3.menuPrice} vnđ</span><br>
            </div>
        </div>
        <div class="menu-ingredients">${menuItem3.menuDesc}</div>
        <div class="quantity-selector">
            <button class="btn-minus" onclick="updateQuantity(this, -1)">-</button>
            <span class="quantity">0</span>
            <button class="btn-plus" onclick="updateQuantity(this, 1)">+</button>
        </div>
    </div>
</c:forEach>

<c:forEach items="${listMenuByCateID4}" var="menuItem4">
    <div class="col-lg-6 menu-item filter-light">
        <img src="assets/img/menu/bread-barrel.jpg" class="menu-img" alt="">
        <div class="menu-content">
            <a href="#">${menuItem4.menuName}</a>
            <div class="price">
                <span class="original-price">${menuItem4.menuPrice} vnđ</span><br>
            </div>
        </div>
        <div class="menu-ingredients">${menuItem4.menuDesc}</div>
        <div class="quantity-selector">
            <button class="btn-minus" onclick="updateQuantity(this, -1)">-</button>
            <span class="quantity">0</span>
            <button class="btn-plus" onclick="updateQuantity(this, 1)">+</button>
        </div>
    </div>
</c:forEach>

<c:forEach items="${listMenuByCateID5}" var="menuItem5">
    <div class="col-lg-6 menu-item filter-drink">
        <img src="assets/img/menu/bread-barrel.jpg" class="menu-img" alt="">
        <div class="menu-content">
            <a href="#">${menuItem5.menuName}</a>
            <div class="price">
                <span class="original-price">${menuItem5.menuPrice} vnđ</span><br>
            </div>
        </div>
        <div class="menu-ingredients">${menuItem5.menuDesc}</div>
        <div class="quantity-selector">
            <button class="btn-minus" onclick="updateQuantity(this, -1)">-</button>
            <span class="quantity">0</span>
            <button class="btn-plus" onclick="updateQuantity(this, 1)">+</button>
        </div>
    </div>
</c:forEach>





                    </div>

                </div>
                <!-- Hiển thị tổng số lượng món ăn -->
<div class="total-quantity">
    <p>Tổng số lượng món: <span id="totalQuantity">0</span></p>
    <button id="completeOrder" onclick="completeOrder()">Hoàn tất</button>
</div>

            </section><!-- End Menu Section -->


        <div id="preloader"></div>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>
    <script>
    function updateQuantity(button, change) {
        let quantitySpan = button.parentElement.querySelector(".quantity");
        let currentQuantity = parseInt(quantitySpan.textContent);
        let newQuantity = currentQuantity + change;
        
        if (newQuantity >= 0) {
            quantitySpan.textContent = newQuantity;
            updateTotal();
        }
    }

    function updateTotal() {
        let total = 0;
        document.querySelectorAll(".quantity").forEach(span => {
            total += parseInt(span.textContent);
        });
        document.getElementById("totalQuantity").textContent = total;
    }

    function completeOrder() {
        let hasNegative = [...document.querySelectorAll(".quantity")].some(span => parseInt(span.textContent) < 0);
        if (hasNegative) {
            alert("Số lượng món ăn không thể nhỏ hơn 0!");
            return;
        }
        alert("Đơn hàng đã hoàn tất!");
    }
</script>

<style>
    .quantity-selector {
        display: flex;
        align-items: center;
        margin-top: 10px;
    }

    .quantity-selector button {
        padding: 5px 10px;
        margin: 0 5px;
        border: none;
        background: #ff9800;
        color: white;
        font-size: 16px;
        cursor: pointer;
    }

    .quantity-selector .quantity {
        font-size: 18px;
        min-width: 20px;
        text-align: center;
    }

    .total-quantity {
        margin-top: 30px;
        margin-left: 200px;
        font-size: 18px;
        font-weight: bold;
    }

    #completeOrder {
        background: #28a745;
        color: white;
        padding: 10px;
        border: none;
        cursor: pointer;
    }
</style>

</html>