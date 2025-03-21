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

        <!-- ======= Top Bar ======= -->
        <div id="topbar" class="d-flex align-items-center fixed-top">
            <div class="container d-flex justify-content-center justify-content-md-between">

                <div class="contact-info d-flex align-items-center">
                    <i class="bi bi-phone d-flex align-items-center"><span>+1 5589 55488 55</span></i>
                    <i class="bi bi-clock d-flex align-items-center ms-4"><span> Mon-Sat: 11AM - 23PM</span></i>
                </div>

                <div class="languages d-none d-md-flex align-items-center">
                    <ul>
                        <li>En</li>
                        <li><a href="/login">Login</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top d-flex align-items-cente">
            <div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">

                <h1 class="logo me-auto me-lg-0"><a href="index.html">Restaurantly</a></h1>
                <!-- Uncomment below if you prefer to use an image logo -->
                <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                        <li><a class="nav-link scrollto active" href="#hero">Trang chủ</a></li>
                        <li><a class="nav-link scrollto" href="#about">About</a></li>
                        <li><a class="nav-link scrollto" href="#menu">Menu</a></li>
                        <li><a class="nav-link scrollto" href="#specials">Specials</a></li>
                        <li><a class="nav-link scrollto" href="#events">Sự kiện</a></li>
                        <li><a class="nav-link scrollto" href="#chefs">Đầu bếp</a></li>
                        <li><a class="nav-link scrollto" href="#gallery">Gallery</a></li>
                        <li><a class="nav-link scrollto" href="#contact">Liên hệ với chúng tôi</a></li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav><!-- .navbar -->
                <div class="d-flex">
                    <a href="cart.jsp" class="book-a-table-btn" style="position: relative; margin-right: 15px;">
                        <i class="bi bi-cart"></i>
                        <c:if test="${cartTotalItems > 0}">
                            <span class="notification-badge">${cartTotalItems}</span>
                        </c:if>
                    </a>
                    <a href="#book-a-table" class="book-a-table-btn scrollto d-none d-lg-flex">Book a table</a>
                </div>
            </div>
        </header><!-- End Header -->

        <!-- ======= Hero Section ======= -->
        <section id="hero" class="d-flex align-items-center">
            <div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
                <div class="row">
                    <div class="col-lg-8">
                        <h1>Welcome to <span>Restaurantly</span></h1>
                        <h2>Delivering great food for more than 18 years!</h2>

                        <div class="btns">
                            <a href="#menu" class="btn-menu animated fadeInUp scrollto">Our Menu</a>
                            <a href="#book-a-table" class="btn-book animated fadeInUp scrollto">Book a Table</a>
                        </div>
                    </div>


                </div>
            </div>
        </section><!-- End Hero -->

        <main id="main">

            <!-- ======= About Section ======= -->
            <section id="about" class="about">
                <div class="container" data-aos="fade-up">

                    <div class="row">
                        <div class="col-lg-6 order-1 order-lg-2" data-aos="zoom-in" data-aos-delay="100">
                            <div class="about-img">
                                <img src="assets/img/about.jpg" alt="">
                            </div>
                        </div>
                        <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
                            <h3>Voluptatem dignissimos provident quasi corporis voluptates sit assumenda.</h3>
                            <p class="fst-italic">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
                                magna aliqua.
                            </p>
                            <ul>
                                <li><i class="bi bi-check-circle"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
                                <li><i class="bi bi-check-circle"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
                                <li><i class="bi bi-check-circle"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate trideta storacalaperda mastiro dolore eu fugiat nulla pariatur.</li>
                            </ul>
                            <p>
                                Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
                                velit esse cillum dolore eu fugiat nulla pariatur
                            </p>
                        </div>
                    </div>

                </div>
            </section><!-- End About Section -->

            <!-- ======= Menu Section ======= -->
            <section id="menu" class="menu section-bg">
                <div class="container" data-aos="fade-up">

                    <div class="section-title">
                        <h2>Menu</h2>
                        <p>Check Our Tasty Menu</p>
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

            <!-- ======= Specials Section ======= -->
            <section id="specials" class="specials">
                <div class="container" data-aos="fade-up">

                    <div class="section-title">
                        <h2>Specials Combo</h2>
                        <p>Check Our Specials Combo</p>
                    </div>

                    <div class="row" data-aos="fade-up" data-aos-delay="100">
                        <div class="col-lg-3">
                            <ul class="nav nav-tabs flex-column">
                                <li class="nav-item">
                                    <a class="nav-link active show" data-bs-toggle="tab" href="#tab-1">Modi sit est</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tab" href="#tab-2">Unde praesentium sed</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tab" href="#tab-3">Pariatur explicabo vel</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tab" href="#tab-4">Nostrum qui quasi</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tab" href="#tab-5">Iusto ut expedita aut</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-9 mt-4 mt-lg-0">
                            <div class="tab-content">
                                <div class="tab-pane active show" id="tab-1">
                                    <div class="row">
                                        <div class="col-lg-8 details order-2 order-lg-1">
                                            <h3>Architecto ut aperiam autem id</h3>
                                            <p class="fst-italic">Qui laudantium consequatur laborum sit qui ad sapiente dila parde sonata raqer a videna mareta paulona marka</p>
                                            <p>Et nobis maiores eius. Voluptatibus ut enim blanditiis atque harum sint. Laborum eos ipsum ipsa odit magni. Incidunt hic ut molestiae aut qui. Est repellat minima eveniet eius et quis magni nihil. Consequatur dolorem quaerat quos qui similique accusamus nostrum rem vero</p>
                                        </div>
                                        <div class="col-lg-4 text-center order-1 order-lg-2">
                                            <img src="assets/img/specials-1.png" alt="" class="img-fluid">
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab-2">
                                    <div class="row">
                                        <div class="col-lg-8 details order-2 order-lg-1">
                                            <h3>Et blanditiis nemo veritatis excepturi</h3>
                                            <p class="fst-italic">Qui laudantium consequatur laborum sit qui ad sapiente dila parde sonata raqer a videna mareta paulona marka</p>
                                            <p>Ea ipsum voluptatem consequatur quis est. Illum error ullam omnis quia et reiciendis sunt sunt est. Non aliquid repellendus itaque accusamus eius et velit ipsa voluptates. Optio nesciunt eaque beatae accusamus lerode pakto madirna desera vafle de nideran pal</p>
                                        </div>
                                        <div class="col-lg-4 text-center order-1 order-lg-2">
                                            <img src="assets/img/specials-2.png" alt="" class="img-fluid">
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab-3">
                                    <div class="row">
                                        <div class="col-lg-8 details order-2 order-lg-1">
                                            <h3>Impedit facilis occaecati odio neque aperiam sit</h3>
                                            <p class="fst-italic">Eos voluptatibus quo. Odio similique illum id quidem non enim fuga. Qui natus non sunt dicta dolor et. In asperiores velit quaerat perferendis aut</p>
                                            <p>Iure officiis odit rerum. Harum sequi eum illum corrupti culpa veritatis quisquam. Neque necessitatibus illo rerum eum ut. Commodi ipsam minima molestiae sed laboriosam a iste odio. Earum odit nesciunt fugiat sit ullam. Soluta et harum voluptatem optio quae</p>
                                        </div>
                                        <div class="col-lg-4 text-center order-1 order-lg-2">
                                            <img src="assets/img/specials-3.png" alt="" class="img-fluid">
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab-4">
                                    <div class="row">
                                        <div class="col-lg-8 details order-2 order-lg-1">
                                            <h3>Fuga dolores inventore laboriosam ut est accusamus laboriosam dolore</h3>
                                            <p class="fst-italic">Totam aperiam accusamus. Repellat consequuntur iure voluptas iure porro quis delectus</p>
                                            <p>Eaque consequuntur consequuntur libero expedita in voluptas. Nostrum ipsam necessitatibus aliquam fugiat debitis quis velit. Eum ex maxime error in consequatur corporis atque. Eligendi asperiores sed qui veritatis aperiam quia a laborum inventore</p>
                                        </div>
                                        <div class="col-lg-4 text-center order-1 order-lg-2">
                                            <img src="assets/img/specials-4.png" alt="" class="img-fluid">
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab-5">
                                    <div class="row">
                                        <div class="col-lg-8 details order-2 order-lg-1">
                                            <h3>Est eveniet ipsam sindera pad rone matrelat sando reda</h3>
                                            <p class="fst-italic">Omnis blanditiis saepe eos autem qui sunt debitis porro quia.</p>
                                            <p>Exercitationem nostrum omnis. Ut reiciendis repudiandae minus. Omnis recusandae ut non quam ut quod eius qui. Ipsum quia odit vero atque qui quibusdam amet. Occaecati sed est sint aut vitae molestiae voluptate vel</p>
                                        </div>
                                        <div class="col-lg-4 text-center order-1 order-lg-2">
                                            <img src="assets/img/specials-5.png" alt="" class="img-fluid">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </section><!-- End Specials Section -->

            <!-- ======= Events Section ======= -->
            <section id="events" class="events">
                <div class="container" data-aos="fade-up">

                    <div class="section-title">
                        <h2>Sự kiện</h2>
                        <p>Tổ chức sự kiện của bạn tại nhà hàng của chúng tôi</p>
                    </div>

                    <div class="events-slider swiper-container" data-aos="fade-up" data-aos-delay="100">
                        <div class="swiper-wrapper">

                            <div class="swiper-slide">
                                <div class="row event-item">
                                    <div class="col-lg-6">
                                        <img src="assets/img/event-birthday.jpg" class="img-fluid" alt="">
                                    </div>
                                    <div class="col-lg-6 pt-4 pt-lg-0 content">
                                        <h3>Tiệc sinh nhật</h3>
                                        <div class="price">
                                            <p><span></span></p>
                                        </div>
                                        <p class="fst-italic">
                                            Tổ chức tiệc sinh nhật trọn gói tại nhà hàng sang trọng!
                                        </p>
                                        <ul>
                                            <li><i class="bi bi-check-circled"></i> Không gian ấm cúng, thực đơn đa dạng, dịch vụ chuyên nghiệp.</li>
                                            <li><i class="bi bi-check-circled"></i> Trang trí theo yêu cầu – biến ngày sinh nhật thành kỷ niệm đáng nhớ!</li>
                                            <li><i class="bi bi-check-circled"></i> Nhận đặt tiệc sinh nhật cho cá nhân, gia đình và công ty.</li>
                                            <li><i class="bi bi-check-circled"></i> Đội ngũ tận tâm, giúp bạn có một bữa tiệc hoàn hảo.</li>
                                            <li><i class="bi bi-check-circled"></i> Đặt tiệc ngay hôm nay để nhận nhiều ưu đãi hấp dẫn!</li>
                                        </ul>
                                        <p>
                                            Combo tiệc sinh nhật hấp dẫn – ưu đãi đặc biệt khi đặt trước!
                                        </p>
                                    </div>
                                </div>
                            </div><!-- End testimonial item -->

                            <div class="swiper-slide">
                                <div class="row event-item">
                                    <div class="col-lg-6">
                                        <img src="assets/img/event-private.jpg" class="img-fluid" alt="">
                                    </div>
                                    <div class="col-lg-6 pt-4 pt-lg-0 content">
                                        <h3>Tiệc gia đình</h3>
                                        <div class="price">
                                            <p><span></span></p>
                                        </div>
                                        <p class="fst-italic">
                                            Tổ chức tiệc gia đình ấm cúng, trọn vẹn yêu thương!
                                        </p>
                                        <ul>
                                            <li><i class="bi bi-check-circled"></i> Không gian sang trọng, thực đơn phong phú, phù hợp mọi thế hệ.</li>
                                            <li><i class="bi bi-check-circled"></i> Quây quần bên nhau, tận hưởng những khoảnh khắc đáng nhớ.</li>
                                            <li><i class="bi bi-check-circled"></i> Nhận đặt tiệc gia đình với dịch vụ chuyên nghiệp, chu đáo.</li>
                                            <li><i class="bi bi-check-circled"></i> Từ bữa cơm thân mật đến đại tiệc sum vầy – chúng tôi đều có!</li>
                                            <li><i class="bi bi-check-circled"></i> Đặt tiệc ngay để nhận ưu đãi hấp dẫn cho gia đình bạn!</li>
                                        </ul>
                                        <p>
                                            Nhà hàng lý tưởng cho những buổi sum họp tràn ngập niềm vui.
                                        </p>
                                    </div>
                                </div>
                            </div><!-- End testimonial item -->

                            <div class="swiper-slide">
                                <div class="row event-item">
                                    <div class="col-lg-6">
                                        <img src="assets/img/event-custom.jpg" class="img-fluid" alt="">
                                    </div>
                                    <div class="col-lg-6 pt-4 pt-lg-0 content">
                                        <h3>Tiệc theo yêu cầu</h3>
                                        <div class="price">
                                            <p><span></span></p>
                                        </div>
                                        <p class="fst-italic">
                                            Nhận đặt tiệc nhanh gọn – ngon miệng, tiện lợi!
                                        </p>
                                        <ul>
                                            <li><i class="bi bi-check-circled"></i> Tiệc sinh nhật, họp mặt, liên hoan… chỉ cần gọi, chúng tôi lo!</li>
                                            <li><i class="bi bi-check-circled"></i> Đồ ăn nhanh nhưng chất lượng, phục vụ tận tâm.</li>
                                            <li><i class="bi bi-check-circled"></i> Combo tiệc theo yêu cầu – ngon, rẻ, giao tận nơi!</li>
                                            <li><i class="bi bi-check-circled"></i> Tụ tập bạn bè, ăn uống thả ga với menu đa dạng.</li>
                                            <li><i class="bi bi-check-circled"></i> Không gian thoải mái, phù hợp cho mọi bữa tiệc nhỏ.</li>
                                        </ul>
                                        <p>
                                            Đặt trước để có ưu đãi hấp dẫn cho nhóm đông!
                                        </p>
                                    </div>
                                </div>
                            </div><!-- End testimonial item -->

                        </div>
                        <div class="swiper-pagination"></div>
                    </div>

                </div>
            </section><!-- End Events Section -->

            <!-- ======= Book A Table Section ======= -->
            <section id="book-a-table" class="book-a-table">
                <div class="container" data-aos="fade-up">

                    <div class="section-title">
                        <h2>Reservation</h2>
                        <p>Book a Table</p>
                    </div>

                    <form action="forms/book-a-table.php" method="post" role="form" class="php-email-form" data-aos="fade-up" data-aos-delay="100">
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                                <div class="validate"></div>
                            </div>
                            <div class="col-md-6 form-group mt-3 mt-md-0">
                                <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email">
                                <div class="validate"></div>
                            </div>
                            <div class="col-md-6 form-group mt-3">
                                <input type="text" name="date" class="form-control" id="date" placeholder="Date" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                                <div class="validate"></div>
                            </div>
                            <div class="col-md-6 form-group mt-3">
                                <input type="text" name="time" class="form-control" id="time" placeholder="Time" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                                <div class="validate"></div>
                            </div>
                            <div class="col-md-6 form-group mt-3">
                                <input type="number" class="form-control" name="people" id="people" placeholder="# of people" data-rule="minlen:1" data-msg="Please enter at least 1 chars">
                                <div class="validate"></div>
                            </div>
                        </div>
                        <div class="form-group mt-3">
                            <textarea class="form-control" name="message" rows="5" placeholder="Message"></textarea>
                            <div class="validate"></div>
                        </div>
                        <div class="mb-3">
                            <div class="loading">Loading</div>
                            <div class="error-message"></div>
                            <div class="sent-message">Your booking request was sent. We will call back or send an Email to confirm your reservation. Thank you!</div>
                        </div>
                        <div class="text-center"><button type="submit">Book a Table</button></div>
                    </form>

                </div>
            </section><!-- End Book A Table Section -->

            <!-- ======= Testimonials Section ======= -->
            <section id="testimonials" class="testimonials section-bg">
                <div class="container" data-aos="fade-up">

                    <div class="section-title">
                        <h2>Testimonials</h2>
                        <p>What they're saying about us</p>
                    </div>

                    <div class="testimonials-slider swiper-container" data-aos="fade-up" data-aos-delay="100">
                        <div class="swiper-wrapper">

                            <div class="swiper-slide">
                                <div class="testimonial-item">
                                    <p>
                                        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                        Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.
                                        <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                                    </p>
                                    <img src="assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                                    <h3>Saul Goodman</h3>
                                    <h4>Ceo &amp; Founder</h4>
                                </div>
                            </div><!-- End testimonial item -->

                            <div class="swiper-slide">
                                <div class="testimonial-item">
                                    <p>
                                        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                        Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.
                                        <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                                    </p>
                                    <img src="assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                                    <h3>Sara Wilsson</h3>
                                    <h4>Designer</h4>
                                </div>
                            </div><!-- End testimonial item -->

                            <div class="swiper-slide">
                                <div class="testimonial-item">
                                    <p>
                                        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                        Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.
                                        <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                                    </p>
                                    <img src="assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                                    <h3>Jena Karlis</h3>
                                    <h4>Store Owner</h4>
                                </div>
                            </div><!-- End testimonial item -->

                            <div class="swiper-slide">
                                <div class="testimonial-item">
                                    <p>
                                        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                        Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat minim velit minim dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore labore illum veniam.
                                        <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                                    </p>
                                    <img src="assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                                    <h3>Matt Brandon</h3>
                                    <h4>Freelancer</h4>
                                </div>
                            </div><!-- End testimonial item -->

                            <div class="swiper-slide">
                                <div class="testimonial-item">
                                    <p>
                                        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                        Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam enim culpa labore duis sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum quid.
                                        <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                                    </p>
                                    <img src="assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                                    <h3>John Larson</h3>
                                    <h4>Entrepreneur</h4>
                                </div>
                            </div><!-- End testimonial item -->

                        </div>
                        <div class="swiper-pagination"></div>
                    </div>

                </div>
            </section><!-- End Testimonials Section -->

            <!-- ======= Gallery Section ======= -->
            <section id="gallery" class="gallery">

                <div class="container" data-aos="fade-up">
                    <div class="section-title">
                        <h2>Gallery</h2>
                        <p>Some photos from Our Restaurant</p>
                    </div>
                </div>

                <div class="container-fluid" data-aos="fade-up" data-aos-delay="100">

                    <div class="row g-0">

                        <div class="col-lg-3 col-md-4">
                            <div class="gallery-item">
                                <a href="assets/img/gallery/gallery-1.jpg" class="gallery-lightbox" data-gall="gallery-item">
                                    <img src="assets/img/gallery/gallery-1.jpg" alt="" class="img-fluid">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4">
                            <div class="gallery-item">
                                <a href="assets/img/gallery/gallery-2.jpg" class="gallery-lightbox" data-gall="gallery-item">
                                    <img src="assets/img/gallery/gallery-2.jpg" alt="" class="img-fluid">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4">
                            <div class="gallery-item">
                                <a href="assets/img/gallery/gallery-3.jpg" class="gallery-lightbox" data-gall="gallery-item">
                                    <img src="assets/img/gallery/gallery-3.jpg" alt="" class="img-fluid">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4">
                            <div class="gallery-item">
                                <a href="assets/img/gallery/gallery-4.jpg" class="gallery-lightbox" data-gall="gallery-item">
                                    <img src="assets/img/gallery/gallery-4.jpg" alt="" class="img-fluid">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4">
                            <div class="gallery-item">
                                <a href="assets/img/gallery/gallery-5.jpg" class="gallery-lightbox" data-gall="gallery-item">
                                    <img src="assets/img/gallery/gallery-5.jpg" alt="" class="img-fluid">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4">
                            <div class="gallery-item">
                                <a href="assets/img/gallery/gallery-6.jpg" class="gallery-lightbox" data-gall="gallery-item">
                                    <img src="assets/img/gallery/gallery-6.jpg" alt="" class="img-fluid">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4">
                            <div class="gallery-item">
                                <a href="assets/img/gallery/gallery-7.jpg" class="gallery-lightbox" data-gall="gallery-item">
                                    <img src="assets/img/gallery/gallery-7.jpg" alt="" class="img-fluid">
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4">
                            <div class="gallery-item">
                                <a href="assets/img/gallery/gallery-8.jpg" class="gallery-lightbox" data-gall="gallery-item">
                                    <img src="assets/img/gallery/gallery-8.jpg" alt="" class="img-fluid">
                                </a>
                            </div>
                        </div>

                    </div>

                </div>
            </section><!-- End Gallery Section -->

            <!-- ======= Chefs Section ======= -->
            <section id="chefs" class="chefs">
                <div class="container" data-aos="fade-up">

                    <div class="section-title">
                        <h2>Chefs</h2>
                        <p>Our Proffesional Chefs</p>
                    </div>

                    <div class="row">

                        <div class="col-lg-4 col-md-6">
                            <div class="member" data-aos="zoom-in" data-aos-delay="100">
                                <img src="assets/img/chefs/chefs-1.jpg" class="img-fluid" alt="">
                                <div class="member-info">
                                    <div class="member-info-content">
                                        <h4>Walter White</h4>
                                        <span>Master Chef</span>
                                    </div>
                                    <div class="social">
                                        <a href=""><i class="bi bi-twitter"></i></a>
                                        <a href=""><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>
                                        <a href=""><i class="bi bi-linkedin"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6">
                            <div class="member" data-aos="zoom-in" data-aos-delay="200">
                                <img src="assets/img/chefs/chefs-2.jpg" class="img-fluid" alt="">
                                <div class="member-info">
                                    <div class="member-info-content">
                                        <h4>Sarah Jhonson</h4>
                                        <span>Patissier</span>
                                    </div>
                                    <div class="social">
                                        <a href=""><i class="bi bi-twitter"></i></a>
                                        <a href=""><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>
                                        <a href=""><i class="bi bi-linkedin"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6">
                            <div class="member" data-aos="zoom-in" data-aos-delay="300">
                                <img src="assets/img/chefs/chefs-3.jpg" class="img-fluid" alt="">
                                <div class="member-info">
                                    <div class="member-info-content">
                                        <h4>William Anderson</h4>
                                        <span>Cook</span>
                                    </div>
                                    <div class="social">
                                        <a href=""><i class="bi bi-twitter"></i></a>
                                        <a href=""><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>
                                        <a href=""><i class="bi bi-linkedin"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </section><!-- End Chefs Section -->

            <!-- ======= Contact Section ======= -->
            <section id="contact" class="contact">
                <div class="container" data-aos="fade-up">

                    <div class="section-title">
                        <h2>Contact</h2>
                        <p>Contact Us</p>
                    </div>
                </div>

                <div data-aos="fade-up">
                    <iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" allowfullscreen></iframe>
                </div>

                <div class="container" data-aos="fade-up">

                    <div class="row mt-5">

                        <div class="col-lg-4">
                            <div class="info">
                                <div class="address">
                                    <i class="bi bi-geo-alt"></i>
                                    <h4>Location:</h4>
                                    <p>A108 Adam Street, New York, NY 535022</p>
                                </div>

                                <div class="open-hours">
                                    <i class="bi bi-clock"></i>
                                    <h4>Open Hours:</h4>
                                    <p>
                                        Monday-Saturday:<br>
                                        11:00 AM - 2300 PM
                                    </p>
                                </div>

                                <div class="email">
                                    <i class="bi bi-envelope"></i>
                                    <h4>Email:</h4>
                                    <p>info@example.com</p>
                                </div>

                                <div class="phone">
                                    <i class="bi bi-phone"></i>
                                    <h4>Call:</h4>
                                    <p>+1 5589 55488 55s</p>
                                </div>

                            </div>

                        </div>

                        <div class="col-lg-8 mt-5 mt-lg-0">

                            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                                    </div>
                                    <div class="col-md-6 form-group mt-3 mt-md-0">
                                        <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                                    </div>
                                </div>
                                <div class="form-group mt-3">
                                    <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
                                </div>
                                <div class="form-group mt-3">
                                    <textarea class="form-control" name="message" rows="8" placeholder="Message" required></textarea>
                                </div>
                                <div class="my-3">
                                    <div class="loading">Loading</div>
                                    <div class="error-message"></div>
                                    <div class="sent-message">Your message has been sent. Thank you!</div>
                                </div>
                                <div class="text-center"><button type="submit">Send Message</button></div>
                            </form>

                        </div>

                    </div>

                </div>
            </section><!-- End Contact Section -->

        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-3 col-md-6">
                            <div class="footer-info">
                                <h3>Restaurantly</h3>
                                <p>
                                    A108 Adam Street <br>
                                    NY 535022, USA<br><br>
                                    <strong>Phone:</strong> +1 5589 55488 55<br>
                                    <strong>Email:</strong> info@example.com<br>
                                </p>
                                <div class="social-links mt-3">
                                    <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                                    <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                                    <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                                    <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                                    <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-6 footer-links">
                            <h4>Useful Links</h4>
                            <ul>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
                            </ul>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>Our Services</h4>
                            <ul>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
                            </ul>
                        </div>

                        <div class="col-lg-4 col-md-6 footer-newsletter">
                            <h4>Our Newsletter</h4>
                            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
                            <form action="" method="post">
                                <input type="email" name="email"><input type="submit" value="Subscribe">
                            </form>

                        </div>

                    </div>
                </div>
            </div>

            <div class="container">
                <div class="copyright">
                    &copy; Copyright <strong><span>Restaurantly</span></strong>. All Rights Reserved
                </div>
                <div class="credits">
                    <!-- All the links in the footer should remain intact. -->
                    <!-- You can delete the links only if you purchased the pro version. -->
                    <!-- Licensing information: https://bootstrapmade.com/license/ -->
                    <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/restaurantly-restaurant-template/ -->
                    Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                </div>
            </div>
        </footer><!-- End Footer -->

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