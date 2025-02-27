<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Đặt Bàn - Nhà Hàng</title>

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">
</head>

<body>
    <main id="main">
        <section id="book-a-table" class="book-a-table">
            <div class="container">
                <div class="section-title">
                    <h2>Đặt Bàn</h2>
                    <p>Book a Table</p>
                </div>

                <form action="booktables" method="post" id="booking-form" class="php-email-form">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 form-group">
                            <input type="text" name="name" class="form-control" placeholder="Họ và Tên" required minlength="4">
                        </div>
                        <div class="col-lg-4 col-md-6 form-group">
                            <input type="email" name="email" class="form-control" placeholder="Email" required>
                        </div>
                        <div class="col-lg-4 col-md-6 form-group">
                            <input type="tel" name="phone" id="phone" class="form-control" placeholder="Số điện thoại" required pattern="(03|05|07|08|09)[0-9]{8}">
                            <small id="phone-error" class="text-danger d-none">Số điện thoại không hợp lệ!</small>
                        </div>
                        <div class="col-lg-4 col-md-6 form-group">
                            <input type="date" name="date" id="date" class="form-control" required>
                        </div>
                        <div class="col-lg-4 col-md-6 form-group">
                            <input type="text" name="time" class="form-control" placeholder="HH:mm (24 giờ)" required pattern="([01][0-9]|2[0-3]):[0-5][0-9]">
                        </div>
                        <div class="col-lg-4 col-md-6 form-group">
                            <input type="number" name="people" class="form-control" placeholder="Số người" min="1" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <textarea name="message" class="form-control" rows="5" placeholder="Ghi chú"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Đặt Bàn</button>
                </form>
            </div>
        </section>
    </main>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JS -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById("date").setAttribute("min", new Date().toISOString().split('T')[0]);
        });
    </script>
</body>
</html>
