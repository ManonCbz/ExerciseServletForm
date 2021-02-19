<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="model.Client"%>
<%@ page import = "java.util.*" %>

<%
	ArrayList<Client> listeClient = (ArrayList<Client>) session.getAttribute("listeClient");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bonjour</title>
<link rel="stylesheet" href="style/style.css">
<meta name="viewport" content="width=device-width">
</head>
<body>

<div class="menu">
	<fieldset>
		<a href="index.html">Créer une nouvelle commande</a>
		<a href="customerList.jsp">Voir les clients existants</a>
		<a href="orderList.jsp">Voir les commandes existantes</a>
	</fieldset>
</div>

<form action="path" method="POST" class="formCustomer">
	<fieldset>
	<legend>Informations client</legend>
		<div class="rowInputForm">
			<label for="inputName">Nouveau client<span class="star"> *</span></label>
			<p class="btnCheckp"><button name="newCustomer" class="checkboxBtn">-</button> Oui</p>
			<p class="btnCheckp"><button name="oldCustomer" class="checkboxBtn checkboxBtnOk">-</button> Non</p>
		</div>
		<div class="rowInputForm">
			    <%
			    
			    if(listeClient != null) {
			    	%> 
			    	<select name="selectCustomer" id="selectCustomer">
			    		<option value="">Choisissez un client...</option> 
				    	<%
					    for (int i = 0; i < listeClient.size(); i++) {
					     	%><option value="<% out.print(listeClient.get(i).getId()); %>"><% out.print(listeClient.get(i).getName() + " " + listeClient.get(i).getFirstName()); %></option><%
					    }
				    	%>			
			    	</select>
			    	<%
			    }
			    else {
			    	%> <p class="errorMsg">Il n'y a aucun client enregistré</p> <%
			    }

			    
			    %>
		</div>
	</fieldset>
	
	<fieldset>
	<legend>Informations commande</legend>
		<div class="rowInputForm">
			<label for="inputDate">Date<span class="star"> *</span></label>
			<input type="date" id="inputDate" name="orderDate">
		</div>
		<div class="rowInputForm">
			<label for="inputAmount">Montant<span class="star"> *</span></label>
			<input type="text" id="inputAmount" name="orderAmount">
		</div>
		<div class="rowInputForm">
			<label for="inputPaymentMethod">Mode de paiement<span class="star"> *</span></label>
			<input type="text" id="inputPaymentMethod" name="orderPaymentMethod">
		</div>
		<div class="rowInputForm">
			<label for="inputPaymentStatus">Statut du paiement</label>
			<input type="text" id="inputPaymentStatus" name="orderPaymentStatus">
		</div>
		<div class="rowInputForm">
			<label for="inputDeliveryMethod">Mode de livraison<span class="star"> *</span></label>
			<input type="text" id="inputDeliveryMethod" name="orderDeliveryMethod">
		</div>
		<div class="rowInputForm">
			<label for="inputDeliveryStatus">Statut de la livraison</label>
			<input type="text" id="inputDeliveryStatus" name="orderDeliveryStatus">
		</div>
	</fieldset>
	
	<div class="btnBox">
		<button name="saveFormCustomerBtn">Valider</button>
		<button name="resetFormCustomerBtn">Remettre à zéro</button>
	</div>
</form>

</body>
</html>