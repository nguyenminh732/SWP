<%-- 
    Document   : main.jsp
    Created on : Feb 9, 2025, 6:27:49 PM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <style>
            .add-to-menu-btn {
                background-color: #cda45e;
                color: white;
                border: none;
                padding: 8px 16px;
                border-radius: 50px;
                cursor: pointer;
                transition: all 0.3s ease;
                margin-top: 10px;
                font-size: 14px;
                float: right;
            }

            .add-to-menu-btn:hover {
                background-color: #d4b36e;
                transform: translateY(-2px);
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            }

            .add-to-menu-btn:active {
                transform: translateY(0);
                box-shadow: none;
            }

            .cart-badge {
                position: absolute;
                top: -8px;
                right: -8px;
                background-color: #dc3545;
                color: white;
                border-radius: 50%;
                padding: 4px 8px;
                font-size: 12px;
                font-weight: bold;
                min-width: 20px;
                text-align: center;
                box-shadow: 0 0 5px rgba(0,0,0,0.2);
                animation: pulse 2s infinite;
            }

            @keyframes pulse {
                0% {
                    transform: scale(1);
                }
                50% {
                    transform: scale(1.1);
                }
                100% {
                    transform: scale(1);
                }
            }

            .nav-link {
                position: relative;
            }

            .notification-badge {
                position: absolute;
                top: -8px;
                right: -8px;
                background-color: #ff0000;
                color: white;
                border-radius: 50%;
                padding: 2px 6px;
                font-size: 12px;
                font-weight: bold;
                min-width: 18px;
                text-align: center;
                box-shadow: 0 0 5px rgba(0,0,0,0.2);
                animation: notificationPulse 2s infinite;
            }

            @keyframes notificationPulse {
                0% {
                    transform: scale(1);
                    opacity: 1;
                }
                50% {
                    transform: scale(1.2);
                    opacity: 0.8;
                }
                100% {
                    transform: scale(1);
                    opacity: 1;
                }
            }
        </style>

        <!-- =======================================================
        * Template Name: Restaurantly - v3.1.0
        * Template URL: https://bootstrapmade.com/restaurantly-restaurant-template/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>

    <body>


        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top d-flex align-items-cente">
            <div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">

                <h1 class="logo me-auto me-lg-0"><a >Restaurantly</a></h1>


                <div class="d-flex">
                    <a href="cart.jsp" class="book-a-table-btn" style="position: relative; margin-right: 15px;">
                        <i class="bi bi-cart"></i>
                        <c:if test="${cartTotalItems > 0}">
                            <span class="notification-badge">${cartTotalItems}</span>
                        </c:if>
                    </a>

                </div>
            </div>
        </header><!-- End Header -->

        <!-- ======= Menu Section ======= -->
        <section id="menu" class="menu section-bg">
            <div class="container" data-aos="fade-up">

                <div class="section-title">
                    <h2></h2>
                    <h2></h2>
                    <h2></h2>
                    <h2></h2>
                    <h2></h2>
                    <p><c:forEach items="${table}" var="tb">
                        <p>Gọi món cho bàn số ${tb.tableNum}</p>
                    </c:forEach></p>
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
                    <c:forEach items="${listMenuByCateID1}" var="menuItem1">
                        <div class="col-lg-6 menu-item filter-new">
                            <img src="assets/img/menu/bread-barrel.jpg" class="menu-img" alt="">
                            <div class="menu-content">
                                <a href="#">${menuItem1.menuName}</a>
                                <div class="price">
                                    <span class="original-price">
                                        ${menuItem1.menuPrice} vnđ
                                    </span><br>
                                </div>
                            </div>
                            <div class="menu-ingredients">
                                <span class="menu-desc">${menuItem1.menuDesc}</span>
                                <button class="add-to-menu-btn" data-menu-id="${menuItem1.menuId}" data-menu-name="${menuItem1.menuName}" data-menu-price="${menuItem1.menuPrice}">Thêm vào thực đơn</button>
                            </div>
                        </div>
                    </c:forEach>

                    <c:forEach items="${listMenuByCateID2}" var="menuItem2">
                        <div class="col-lg-6 menu-item filter-chicken">
                            <img src="assets/img/menu/bread-barrel.jpg" class="menu-img" alt="">
                            <div class="menu-content">
                                <a href="#">${menuItem2.menuName}</a>
                                <div class="price">
                                    <span class="original-price">
                                        ${menuItem2.menuPrice} vnđ
                                    </span><br>
                                </div>
                            </div>
                            <div class="menu-ingredients">
                                <span class="menu-desc">${menuItem2.menuDesc}</span>
                                <button class="add-to-menu-btn" data-menu-id="${menuItem2.menuId}" data-menu-name="${menuItem2.menuName}" data-menu-price="${menuItem2.menuPrice}">Thêm vào thực đơn</button>
                            </div>
                        </div>
                    </c:forEach>

                    <c:forEach items="${listMenuByCateID3}" var="menuItem3">
                        <div class="col-lg-6 menu-item filter-burgur">
                            <img src="assets/img/menu/bread-barrel.jpg" class="menu-img" alt="">
                            <div class="menu-content">
                                <a href="#">${menuItem3.menuName}</a>
                                <div class="price">
                                    <span class="original-price">
                                        ${menuItem3.menuPrice} vnđ
                                    </span><br>
                                </div>
                            </div>
                            <div class="menu-ingredients">
                                <span class="menu-desc">${menuItem3.menuDesc}</span>
                                <button class="add-to-menu-btn" data-menu-id="${menuItem3.menuId}" data-menu-name="${menuItem3.menuName}" data-menu-price="${menuItem3.menuPrice}">Thêm vào thực đơn</button>
                            </div>
                        </div>
                    </c:forEach>

                    <c:forEach items="${listMenuByCateID4}" var="menuItem4">
                        <div class="col-lg-6 menu-item filter-light">
                            <img src="assets/img/menu/bread-barrel.jpg" class="menu-img" alt="">
                            <div class="menu-content">
                                <a href="#">${menuItem4.menuName}</a>
                                <div class="price">
                                    <span class="original-price">
                                        ${menuItem4.menuPrice} vnđ
                                    </span><br>
                                </div>
                            </div>
                            <div class="menu-ingredients">
                                <span class="menu-desc">${menuItem4.menuDesc}</span>
                                <button class="add-to-menu-btn" data-menu-id="${menuItem4.menuId}" data-menu-name="${menuItem4.menuName}" data-menu-price="${menuItem4.menuPrice}">Thêm vào thực đơn</button>
                            </div>
                        </div>
                    </c:forEach>

                    <c:forEach items="${listMenuByCateID5}" var="menuItem5">
                        <div class="col-lg-6 menu-item filter-drink">
                            <img src="assets/img/menu/bread-barrel.jpg" class="menu-img" alt="">
                            <div class="menu-content">
                                <a href="#">${menuItem5.menuName}</a>
                                <div class="price">
                                    <span class="original-price">
                                        ${menuItem5.menuPrice} vnđ
                                    </span><br>
                                </div>
                            </div>
                            <div class="menu-ingredients">
                                <span class="menu-desc">${menuItem5.menuDesc}</span>
                                <button class="add-to-menu-btn" data-menu-id="${menuItem5.menuId}" data-menu-name="${menuItem5.menuName}" data-menu-price="${menuItem5.menuPrice}">Thêm vào thực đơn</button>
                            </div>
                        </div>
                    </c:forEach>
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
        <script src="assets/js/cart.js"></script>

        <!-- Add to cart notification container -->
        <div id="notification-container" style="position: fixed; top: 20px; right: 20px; z-index: 9999;"></div>
    </body>
</html>