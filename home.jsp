<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.foodapp.model.Restaurant" %>

<%
    User u = (User) session.getAttribute("user");
    List<Restaurant> restList = (List<Restaurant>) session.getAttribute("restList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Restaurants</title>
    <style>
    /* Global page styling */
    body {
        font-family: Arial, sans-serif;
        background-image: url('image2.jpg'); /* Replace 'background.jpg' with the path to your background image */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        color: #ffffff;
        margin: 0;
        padding: 0;
        background-color: #000; /* Fallback to black if image doesn't load */
    }

    /* Navbar styling */
    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #1a1a1a;
        padding: 10px 20px;
        color: white;
    }

    .navbar img {
        height: 40px;
    }

    .navbar h1 {
        margin: 0;
        font-size: 24px;
    }

    .navbar .nav-links {
        display: flex;
        align-items: center;
    }

    .navbar .nav-links a {
        color: white;
        text-decoration: none;
        margin-right: 60px;
        font-size: 16px;
    }

    .navbar .profile-dropdown {
        position: relative;
        display: inline-block;
    }

    .navbar .profile-dropdown img {
        height: 30px;
        cursor: pointer;
    }

    .profile-dropdown-content {
        display: none;
        position: absolute;
        right: 0;
        background-color: #333;
        min-width: 150px;
        box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
        z-index: 1;
    }

    .profile-dropdown-content a {
        color: white;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        font-size: 14px;
    }

    .profile-dropdown-content a:hover {
        background-color: #444;
    }

    .profile-dropdown:hover .profile-dropdown-content {
        display: block;
    }

    /* Welcome message styling */
    .welcome-message {
        text-align: center;
        margin-top: 20px;
        font-size: 22px;
        color: #ffcc00; /* Gold color for the welcome message */
    }

    /* Flexbox container for restaurant boxes */
    .restaurant-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
        gap: 20px;
        margin: 20px;
    }

    /* Styling for each restaurant box */
    .restaurant-box {
        background-color: rgba(0, 0, 0, 0.8);
        border: 1px solid #333;
        border-radius: 8px;
        width: 300px;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
        text-align: center;
        background-image: url('restaurants.jpg');
        background-size: cover;
        background-position: center;
        color: #fff;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    /* Hover effect for restaurant box */
    .restaurant-box:hover {
        transform: scale(1.05); /* Slight zoom-in effect */
        box-shadow: 0 8px 16px rgba(255, 204, 0, 0.6); /* Gold-colored shadow */
        cursor: pointer;
    }

    .restaurant-name {
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 10px;
        color: #ffcc00; /* Gold color for the restaurant name */
    }

    .cuisine-type {
        color: #cccccc;
        margin-bottom: 10px;
    }

    .ratings {
        font-size: 16px;
        color: #ffcc00;
    }

    /* Styling for Add Restaurant button */
    .add-restaurant-btn {
        background-color: #ff3333;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        margin: 20px auto;
        display: block;
    }

    .add-restaurant-btn:hover {
        background-color: #cc0000;
    }
</style>
    
</head>

<body>

    <!-- Navbar -->
    <div class="navbar">
    <div class="logo">
        <img src="logo.jpeg" alt="Tap Food Logo" style="margin-right: 10px;">
        <h1 style="display: inline; margin: 0;">TAP FOODS</h1>
        
        <!-- Welcome message beside the Tap Food icon -->
        <span style="margin-left: 15px; font-size: 18px; color: #ffffff;">
            Hey <%= (u != null) ? u.getUserName() : "Guest" %>, Welcome
        </span>
    </div>
    
    <div class="nav-links">
        <img src="carticon.jpeg" alt="Cart Icon" style="margin-right: 15px;">
        
        <!-- Order History Button -->
        <button onclick="window.location.href='OrderHistoryServlet'" 
                style="background-color: #ffcc00; color: black; padding: 8px 15px; 
                       border: none; border-radius: 5px; font-size: 16px; cursor: pointer; 
                       margin-right: 15px;">
            Order History
        </button>
        
        <div class="profile-dropdown">
            <img src="profile.jpeg" alt="Profile Icon">
            <div class="profile-dropdown-content">
                <a href="editprofile.jsp">Edit Profile</a>
                <a href="LogoutServlet">Logout</a>
            </div>
        </div>
    </div>
</div>

</div>


    <!-- Welcome Message -->
    <div class="welcome-message"> 
        Hey <%= (u != null) ? u.getUserName() : "Guest" %>, here are the available restaurants:
    </div>

    <!-- Restaurant Container -->
    <div class="restaurant-container">
        <% if (restList != null) { %>
            <% for (Restaurant restaurant : restList) { %>
            <div class="restaurant-box">
                <div class="restaurant-name"><%out.println(restaurant.getRestaurantName()); %></div>
                <div class="cuisine-type">Cuisine: <%out.println(restaurant.getCuisineType()); %></div>
                <div class="ratings">Ratings: <%out.println(restaurant.getRatings());  %>★</div><br>
                 
                 <a href="MenuServlet?id=<%= restaurant.getRestaurantId()%>"><button>View Menu</button></a>
            </div>
            <% } %>
        <% } else { %>
            <h1>No restaurants available</h1>
        <% } %>
    </div>

</body>
</html>
    