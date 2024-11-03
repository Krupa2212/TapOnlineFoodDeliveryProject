<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Restaurant</title>
</head>
<body>
	<h1>Add Restaurant</h1>
	<form action="AddRestaurant">
		Restaurant Id <input type="number" name="restaurantId"><br>
		Restaurant Name <input type="text" name="restaurantName"><br>
		Cuisine Type<input type="text" name="cuisineType"><br>
		Is Active <input type="text" name="isActive"><br>
		Ratings <input type="text" name="ratings"><br>
		<input type="submit" value="Add Restaurant"><br>
	</form>
</body>
</html>