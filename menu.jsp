<%@ page import="java.util.List" %>
<%@ page import="com.foodapp.model.Menu" %>

<%
    List<Menu> menuList = (List<Menu>) session.getAttribute("menuList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <style>
        /* Global page styling */
        body {
        font-family: Arial, sans-serif;
        background-image: url('image1.jpg'); /* Replace 'background.jpg' with the path to your background image */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        color: #ffffff;
        margin: 0;
        padding: 0;
        background-color: #000; /* Fallback to black if image doesn't load */
    }

        /* Centered heading for the menu section */
        h1 {
            text-align: center;
            color: #ffcc00; /* Gold color for heading */
            margin-top: 20px;
        }

        /* Flexbox container for menu items */
        .menu-container {
            display: flex;
            flex-wrap: wrap; /* Allow wrapping to the next line */
            justify-content: center; /* Center-align the cards */
            gap: 20px; /* Space between cards */
            margin: 20px;
        }

        /* Styling for each menu item card */
        .menu-box {
            background-color: rgba(0, 0, 0, 0.8); /* Semi-transparent background */
            background-image: url('menu.jpg'); /* Add the shared background image */
            background-size: cover; /* Ensure the background image covers the card */
            background-position: center; /* Center the background image */
            border: 1px solid #333;
            border-radius: 8px;
            width: 300px; /* Card width */
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4); /* Add shadow for depth */
            text-align: center;
            color: #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        /* Hover effect for menu item card */
        .menu-box:hover {
            transform: scale(1.05); /* Slight zoom-in effect */
            box-shadow: 0 8px 16px rgba(255, 204, 0, 0.6); /* Gold-colored shadow */
            cursor: pointer;
        }

        /* Styling for menu item content */
        .Item-name, .menu-description, .mprice, .mavailable {
            margin-bottom: 10px;
        }

        .Item-name {
            font-size: 18px;
            font-weight: bold;
            color: #ffcc00; /* Gold color for item name */
        }

        .mprice {
            font-size: 16px;
            color: #ffcc00; /* Gold color for price */
        }

        .mavailable {
            color: #cccccc; /* Light grey for availability */
        }
    </style>
</head>
<body>

    <h1>Menu</h1>

    <div class="menu-container">
        <% if (menuList != null) { %>
            <% for (Menu menu : menuList) { %>
                <div class="menu-box">
                	<div class="Menu-Id"><strong>Menu Id:</strong> <%= menu.getMenuId() %></div>
                    <div class="Item-name"><strong>Item Name:</strong> <%= menu.getItemName() %></div>
                    <div class="menu-description"><strong>Description:</strong> <%= menu.getDescription() %></div>
                    <div class="mprice"><strong>Price:</strong> $<%= menu.getPrice() %></div>
                    <div class="mavailable"><strong>Available:</strong> <%= menu.getIsAvailable() ? "Yes" : "No" %></div>
                    
                    <form action="cart?itemid=<%= menu.getMenuId() %>" method="post">
                    	Quantity: <input type="number" name="quantity" value="1" min="1" class="quantity-input">
                    	<input type="submit" value="Add To Cart" class="add-to-cart-btn">
                    	<input type="hidden" name="action" value="add">
                    </form>
                    
                </div>
            <% } %>
        <% } else { %>
            <p>No menu items available for this restaurant.</p>
        <% } %>
    </div>

</body>
</html>

