<%@ page import="com.foodapp.model.Cart" %>
<%@ page import="com.foodapp.model.CartItem" %>
<%@ page import="java.util.Collection, java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    // Retrieve the Cart object from the session
    Cart cart = (Cart) session.getAttribute("cart");
    
    // Check if the cart is null or empty
    if (cart == null || cart.getCart().isEmpty()) {
        out.println("<h3>Your cart is empty!</h3>");
    } 
    else {
        Collection<CartItem> cartItems = cart.getCart().values(); // Get the list of items from the Cart object
        double grandTotal = 0;
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new java.util.Locale("en", "IN"));
%>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <style>
        body {
            background-image: url('image2.jpg');
            background-size: cover; /* Ensures the image covers the entire page */
            background-position: center; /* Center the background image */
            background-repeat: repeat; /* Prevents the image from repeating */
            font-family: Arial, sans-serif;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: rgba(0, 0, 0, 0.7); /* Dark background with transparency */
            color: white; /* White text for contrast */
        }

        table, th, td {
            border: 1px solid #444; /* Dark gray borders */
            font-size: 25px;
        }

        th {
            background-color: #333; /* Dark header background */
            color: #f1f1f1; /* Lighter text for header */
            text-transform: uppercase;
        }

        td {
            padding: 15px;
            text-align: center;
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
        }

        input[type=number] {
            width: 100px;
            text-align: left;
            font-size: 20px;
            background-color: #222; /* Darker input background */
            color: white;
            border: 1px solid #555;
        }

        button {
            padding: 10px 15px;
            font-size: 16px;
        }

        .update-btn, .delete-btn {
            border-radius: 8px;
            border: none;
            cursor: pointer;
            color: white;
        }

        .update-btn {
            background-color: #0066cc; /* Blue for update */
        }

        .delete-btn {
            background-color: #cc0000; /* Red for delete */
        }

        .update-btn:hover {
            background-color: #005bb5; /* Darker blue on hover */
        }

        .delete-btn:hover {
            background-color: #b50000; /* Darker red on hover */
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        h2, h1 {
            color: white;
            text-align: center;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Adds a shadow for readability */
        }
    </style>
</head>
<body>

<h2>Your Shopping Cart</h2>

<table>
    <thead>
        <tr>
            <th>Item Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Subtotal</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
    <%
        for (CartItem item : cartItems) {
            double subtotal = item.getPrice() * item.getQuantity();
            grandTotal += subtotal;
    %>
    <tr>
        <td><%= item.getItemName() %></td>
        <td><%= currencyFormat.format(item.getPrice()) %></td>
        <td>
            <!-- Move the input inside the update form -->
            <form action="cart" method="post" style="display:inline;">
                <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                <input type="hidden" name="action" value="update">
                <input type="number" name="quantity" value="<%= item.getQuantity() %>" class="quantity-input" min="1" />
        </td>
        <td><%= currencyFormat.format(subtotal) %></td>
        <td class="action-buttons">
            <!-- Wrap both forms in a div to position buttons inline -->
            <div style="display: inline;">
                <!-- Update button -->
                <button type="submit" class="update-btn">Update</button>
            </form>

            <!-- Delete form directly beside it -->
            <form action="cart?menuId=<%= item.getMenuId() %>" method="post" style="display:inline;">
                <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                <input type="hidden" name="action" value="remove">
                <button type="submit" class="delete-btn">Delete</button>
            </form>
            </div>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<h1>Grand Total: <%= currencyFormat.format(grandTotal) %></h1>

<%
    // Set the grandTotal in session and redirect to checkout.jsp when the user proceeds
    session.setAttribute("grandTotal", grandTotal);
%>

<form action="checkout.jsp" method="get">
    <center>
        <button type="submit" class="proceed-btn">Proceed to Checkout</button>
    </center>
</form>

</body>
</html>

<%
    }
%>
