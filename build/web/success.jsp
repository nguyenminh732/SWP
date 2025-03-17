<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 50px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #28a745;
            text-align: center;
        }
        .order-details {
            margin-top: 20px;
        }
        .order-details p {
            font-size: 16px;
            margin: 10px 0;
        }
        .btn {
            display: inline-block;
            background-color: #28a745;
            color: #fff;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
        }
        .btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Order Successfully Placed!</h1>
    <div class="order-details">
        <p><strong>Customer Name:</strong> ${sessionScope.customerName}</p>
        <p><strong>Phone Number:</strong> ${sessionScope.phoneNumber}</p>
        <p><strong>Total Amount:</strong> ${sessionScope.cartTotalPrice}</p>
        <p>Your order has been successfully processed. We will contact you shortly for further details.</p>
    </div>
    <a href="index.jsp" class="btn">Go to Home</a>
</div>
</body>
</html>
