<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="model.Client"%>
<%@ page import ="model.Commande"%>
<%
Client customer = (Client) request.getAttribute("customer");
Commande order = (Commande) request.getAttribute("order");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Commande</title>
<link rel="stylesheet" href="style.css">
<meta name="viewport" content="width=device-width">
</head>
<body>

<p class="successMessage">Commande créée avec succès !</p>

<p class="customerInfo">
Client<br>
Nom : <% out.print(customer.getName().toUpperCase()); %><br>
Prénom : <% out.print(customer.getFirstName()); %><br>
Adresse : <% out.print(customer.getAddress()); %><br>
Numéro de téléphone : <% out.print(customer.getPhoneNumber()); %><br>
Email : <% out.print(customer.getEmail()); %><br>
</p>
<p class="customerInfo">
Date : <% out.print(order.getDate()); %><br>
Montant : <% out.print(order.getAmount()); %><br>
Mode de paiement : <% out.print(order.getPaymentMethod()); %><br>
Statut du paiement : <% out.print(order.getPaymentStatus()); %><br>
Mode de livraison : <% out.print(order.getDeliveryMethod()); %><br>
Statut de la livraison : <% out.print(order.getDeliveryStatus()); %>
</p>


</body>
</html>