<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="model.Client"%>
<%@ page import ="model.Commande"%>
<%
Client customer = (Client) request.getAttribute("customer");
Commande order = (Commande) request.getAttribute("order");

String firstName = customer.getFirstName();
String email = customer.getEmail();
String paymentStatus = order.getPaymentStatus();
String deliveryStatus = order.getDeliveryStatus();


if(firstName == "") firstName = "Non renseign�";
if(email == "") email = "Non renseign�";
if(paymentStatus == "") paymentStatus = "Non renseign�";
if(deliveryStatus == "") deliveryStatus = "Non renseign�";
%>
    
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
Nom : <% out.print(customer.getName().toUpperCase()); %><br>
Pr�nom : <% out.print(firstName); %><br>
Adresse : <% out.print(customer.getAddress()); %><br>
Num�ro de t�l�phone : <% out.print(customer.getPhoneNumber()); %><br>
Email : <% out.print(email); %><br>
</p>
<p class="customerInfo">
Date : <% out.print(order.getDate()); %><br>
Montant : <% out.print(order.getAmount()); %><br>
Mode de paiement : <% out.print(order.getPaymentMethod()); %><br>
Statut du paiement : <% out.print(paymentStatus); %><br>
Mode de livraison : <% out.print(order.getDeliveryMethod()); %><br>
Statut de la livraison : <% out.print(deliveryStatus); %>
</p>

</body>
</html>