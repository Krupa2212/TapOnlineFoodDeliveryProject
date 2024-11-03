<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.model.Orders" %>
<%@ page import="java.util.List" %>

<%
    List<Orders> orderList = (List<Orders>) session.getAttribute("orderList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('image3.jpg');
            background-size: cover;
            background-position: center;
            color: #ffffff;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        h1 {
            margin-top: 20px;
            color: #FFD700; /* Gold color for the title */
            font-size: 36px;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.7); /* Shadow for a stylish effect */
        }
        .order-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            width: 100%;
        }
        .order-card {
            background-color: rgba(26, 26, 26, 0.9); /* Dark overlay */
            background-image: url('menu1.jpeg');
            background-size: cover;
            background-blend-mode: overlay;
            padding: 20px;
            border: 1px solid #333;
            border-radius: 8px;
            width: 300px;
            color: #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .order-card:hover {
            transform: scale(1.05); /* Slightly enlarges the card */
            box-shadow: 0 8px 16px rgba(255, 215, 0, 0.6); /* Golden shadow on hover */
            border-color: #FFD700; /* Gold border color on hover */
        }
        .order-card div {
            margin: 10px 0;
        }
        .order-card div:nth-child(1) { /* Order ID */
            font-size: 18px;
            font-weight: bold;
            color: #FFD700; /* Gold for emphasis */
        }
        .order-card div:nth-child(2) { /* Total Amount */
            font-size: 16px;
            font-weight: bold;
            color: #00FF7F; /* Light green */
        }
        .order-card div:nth-child(3) { /* Status */
            font-style: italic;
            color: #FF4500; /* Orange-red */
        }
        .order-card div:nth-child(4) { /* Restaurant */
            color: #87CEFA; /* Light blue */
        }
        .order-card div:nth-child(5) { /* Payment Option */
            color: #FF69B4; /* Pink */
        }
    </style>
</head>
<body>
    <h1>Order History</h1>
    <div class="order-container">
        <% if (orderList != null && !orderList.isEmpty()) { %>
            <% for (Orders order : orderList) { %>
            <div class="order-card">
                <div>Order ID: <%= order.getOrderId() %></div>
                <div>Total Amount: <%= order.getTotalAmount() %></div>
                <div>Status: <%= order.getStatus() %></div>
                <div>Restaurant: <%= order.getRestaurantName() %></div>
                <div>Payment Option: <%= order.getPaymentOption() %></div>
            </div>
            <% } %>
        <% } else { %>
            <h2>No orders found</h2>
        <% } %>
    </div>
</body>
</html>
