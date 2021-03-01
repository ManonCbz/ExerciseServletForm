<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Connexion</title>
</head>
<body>

<form action="log" method="POST" class="connectionForm">
	<div>
		<label for="username">Pseudo :</label>
		<input type="text" name="username" id="username">
	</div>
	<div>
		<label for="password">Mot de passe :</label>
		<input type="password" name="password" id="password">
	</div>
	<button type="submit" name="logBtn">Ok</button>
</form>

</body>
</html>