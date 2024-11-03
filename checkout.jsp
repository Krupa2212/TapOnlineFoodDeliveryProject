<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    // Retrieve the grandTotal passed from cart.jsp (assuming it's passed via session or a request attribute)
    Double grandTotalDouble = (Double) session.getAttribute("grandTotal");
    Double grandTotal = 0.0; // Fallback default value

    if (grandTotalDouble != null) {
        grandTotal = grandTotalDouble; // Work with Double
    }

    // Initialize the currency formatter
    NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new java.util.Locale("en", "IN"));
%>

<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <style>
        body {
            background-image: url('image3.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: repeat;
            color: white; /* Text color to contrast against dark background */
            font-family: Arial, sans-serif;
        }
        .checkout-container {
            width: 50%;
            margin: 100px auto;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.8);
            border-radius: 10px;
        }
        h2, h3 {
            text-align: center;
        }
        input[type="text"], select {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 18px;
        }
        .confirm-btn {
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px;
        }
        .confirm-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="checkout-container">
    <h2>Checkout</h2>
    <h3>Grand Total: <%= currencyFormat.format(grandTotal) %></h3>

    <form action="CheckoutServlet" method="post">
        <!-- Address input -->
        <label for="address">Address</label>
        <input type="text" id="address" name="address" placeholder="Enter your address" required>

        <!-- Payment Mode Selection -->
        <label for="paymentMode">Payment Mode</label>
        <select id="paymentMode" name="paymentMode" required>
            <option value="Credit">Credit Card</option>
            <option value="Debit">Debit Card</option>
            <option value="Netbanking">Net Banking</option>
            <option value="Upi">UPI</option>
            <option value="Cash On Delivery">Cash on Delivery</option>
        </select>

        <!-- Confirm Payment Button -->
        <button type="submit" class="confirm-btn">Confirm Order</button>
    </form>
</div>

</body>
</html>
