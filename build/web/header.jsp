<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <nav id="navbar" class="navbar order-last order-lg-0">
            <ul>
                <li><a class="nav-link scrollto" href="/">Home</a></li>
                <li><a class="nav-link scrollto" href="/#about">About</a></li>
                <li><a class="nav-link scrollto" href="/#menu">Menu</a></li>
                <li><a class="nav-link scrollto" href="/#specials">Specials</a></li>
                <li><a class="nav-link scrollto" href="/#events">Events</a></li>
                <li><a class="nav-link scrollto" href="/#chefs">Chefs</a></li>
                <li><a class="nav-link scrollto" href="/#gallery">Gallery</a></li>
                <li><a class="nav-link scrollto" href="/#contact">Contact</a></li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>
        <a href="/cart" class="book-a-table-btn scrollto d-none d-lg-flex">
            <i class="bi bi-cart3"></i> Giỏ hàng
        </a>
    </div>
</header>
