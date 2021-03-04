<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mise à jour</title>
<link rel="stylesheet" href="style/style.css">
<meta name="viewport" content="width=device-width">
</head>
<body>

<div class="menu">
	<fieldset>
		<a href="menu.jsp">Créer une nouvelle commande</a>
		<a href="customerList.jsp">Voir les clients existants</a>
		<a href="orderList.jsp">Voir les commandes existantes</a>
	</fieldset>
</div>

<form action="update" method="POST" class="formCustomer">
	<fieldset>
	<legend>Informations client</legend>
		<div class="rowInputForm">
			<label for="inputName">Nom<span class="star"> *</span></label>
			<input type="text" id="inputName" name="nameCustomer" value="<c:out value="${ client.name }" />">
		</div>
		<div class="rowInputForm">
			<label for="inputFirstName">Prénom</label>
			<input type="text" id="inputFirstName" name="firstNameCustomer" value="<c:out value="${ client.firstName }" />">
		</div>
		<div class="rowInputForm">
			<label for="inputAddress">Adresse de livraison<span class="star"> *</span></label>
			<input type="text" id="inputAddress" name="addressCustomer" value="<c:out value="${ client.address }" />">
		</div>
		<div class="rowInputForm">
			<label for="inputPhoneNumber">Numéro de téléphone<span class="star"> *</span></label>
			<input type="text" id="inputPhoneNumber" name="phoneNumberCustomer" value="<c:out value="${ client.phoneNumber }" />">
		</div>
		<div class="rowInputForm">
			<label for="inputEmail">Adresse email</label>
			<input type="email" id="inputEmail" name="emailCustomer" value="<c:out value="${ client.email }" />">
		</div>
	</fieldset>
	
	<input type="hidden" name="idCustomer" value="<c:out value="${ client.id }" />">
	
	<div class="btnBox">
		<button name="saveUpdateCustomerBtn">Enregistrer</button>
		<button name="resetCustomerBtn">Annuler</button>
	</div>
</form>

</body>
</html>