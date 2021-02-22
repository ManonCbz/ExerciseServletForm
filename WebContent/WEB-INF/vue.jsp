<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<c:set var="customer" value="${ customer }" scope="page"/>
<c:set var="order" value="${ order }" scope="page"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Commande</title>
<link rel="stylesheet" href="style/style.css">
<meta name="viewport" content="width=device-width">
</head>
<body>

<p class="successMessage">Commande cr��e avec succ�s !</p>

<p class="customerInfo">
Client<br>
Nom : 
<c:out value="${ customer.name }"/> <br>
Pr�nom : 
<c:out value="${ customer.firstName == '' ? 'Non renseign�' : customer.firstName}"/><br>
Adresse : 
<c:out value="${ customer.address }"/><br>
Num�ro de t�l�phone : 
<c:out value="${ customer.phoneNumber }"/><br>
Email : 
<c:out value="${ customer.email == '' ? 'Non renseign�' : customer.email}"/><br>
</p>

<p class="customerInfo">
Date : 
<c:out value="${ order.date }"/><br>
Montant : 
<c:out value="${ order.amount }"/><br>
Mode de paiement : 
<c:out value="${ order.paymentMethod }"/><br>
Statut du paiement : 
<c:out value="${ order.paymentStatus == '' ? 'Non renseign�' : order.paymentStatus}"/><br>
Mode de livraison : 
<c:out value="${ order.deliveryMethod }"/><br>
Statut de la livraison : 
<c:out value="${ order.deliveryStatus == '' ? 'Non renseign�' : order.deliveryStatus}"/><br>
</p>

</body>
</html>