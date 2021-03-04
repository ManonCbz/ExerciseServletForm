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
	<legend>Informations commande</legend>
		<div class="rowInputForm">
			<label for="inputDate">Date<span class="star"> *</span></label>
			<input type="date" id="inputDate" name="orderDate" value="<c:out value="${ commande.date }" />">
		</div>
		<div class="rowInputForm">
			<label for="inputAmount">Montant<span class="star"> *</span></label>
			<input type="text" id="inputAmount" name="orderAmount" value="<c:out value="${ commande.amount }" />">
		</div>
		<div class="rowInputForm">
			<label for="inputPaymentMethod">Mode de paiement<span class="star"> *</span></label>
			<input type="text" id="inputPaymentMethod" name="orderPaymentMethod" value="<c:out value="${ commande.paymentMethod }" />">
		</div>
		<div class="rowInputForm">
			<label for="inputPaymentStatus">Statut du paiement</label>
			<input type="text" id="inputPaymentStatus" name="orderPaymentStatus" value="<c:out value="${ commande.paymentStatus }" />">
		</div>
		<div class="rowInputForm">
			<label for="inputDeliveryMethod">Mode de livraison<span class="star"> *</span></label>
			<input type="text" id="inputDeliveryMethod" name="orderDeliveryMethod" value="<c:out value="${ commande.deliveryMethod }" />">
		</div>
		<div class="rowInputForm">
			<label for="inputDeliveryStatus">Statut de la livraison</label>
			<input type="text" id="inputDeliveryStatus" name="orderDeliveryStatus" value="<c:out value="${ commande.deliveryStatus }" />">
		</div>
	</fieldset>
	
	<input type="hidden" name="idOrder" value="<c:out value="${ commande.id }" />">
	<div class="btnBox">
		<button name="saveUpdateOrderBtn">Enregistrer</button>
		<button name="resetOrderBtn">Annuler</button>
	</div>
</form>

</body>
</html>