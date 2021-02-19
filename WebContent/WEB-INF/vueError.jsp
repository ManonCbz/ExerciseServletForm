<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.ArrayList"%>
<%
ArrayList<String> errorList = (ArrayList<String>) request.getAttribute("error");
ArrayList<String> infoOk = (ArrayList<String>) request.getAttribute("infoOk");

String cssName = "";
String cssAddress = "";
String cssPhoneNumber = "";
String cssDate = "";
String cssAmount = "";
String cssPaymentMethod = "";
String cssDeliveryMethod = "";

for (int i = 0; i < errorList.size(); i++) {
	
	if(errorList.get(i) == "name") cssName = "border-color:red";
	if(errorList.get(i) == "address") cssAddress = "border-color:red";
	if(errorList.get(i) == "phoneNumber") cssPhoneNumber = "border-color:red";
	if(errorList.get(i) == "date") cssDate = "border-color:red";
	if(errorList.get(i) == "amount") cssAmount = "border-color:red";
	if(errorList.get(i) == "paymentMethod") cssPaymentMethod = "border-color:red";
	if(errorList.get(i) == "deliveryMethod") cssDeliveryMethod = "border-color:red";
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Erreur</title>
<link rel="stylesheet" href="style/style.css">
<meta name="viewport" content="width=device-width">
</head>
<body>

<div class="menu">
	<div class="test">
		<a href="index.html">Créer une nouvelle commande</a>
		<a href="customerList.jsp">Voir les clients existants</a>
		<a href="orderList.jsp">Voir les commandes existantes</a>
	</div>
</div>

<form action="path" method="POST" class="formCustomer">
	<fieldset>
	<legend>Informations client</legend>
		<div class="rowInputForm">
			<label for="inputName">Nouveau client<span class="star"> *</span></label>
			<p class="btnCheckp"><button name="newCustomer" class="checkboxBtn checkboxBtnOk">-</button> Oui</p>
			<p class="btnCheckp"><button name="oldCustomer" class="checkboxBtn">-</button> Non</p>
		</div>
		<div class="rowInputForm">
			<label for="inputName">Nom<span class="star"> *</span></label>
			<input style="<% out.print(cssName); %>" type="text" id="inputName" name="nameCustomer" value="<% out.print(infoOk.get(0)); %>">
		</div>
		<div class="rowInputForm">
			<label for="inputFirstName">Prénom</label>
			<input type="text" id="inputFirstName" name="firstNameCustomer" value="<% out.print(infoOk.get(1)); %>">
		</div>
		<div class="rowInputForm">
			<label for="inputAddress">Adresse de livraison<span class="star"> *</span></label>
			<input style="<% out.print(cssAddress); %>" type="text" id="inputAddress" name="addressCustomer" value="<% out.print(infoOk.get(2)); %>">
		</div>
		<div class="rowInputForm">
			<label for="inputPhoneNumber">Numéro de téléphone<span class="star"> *</span></label>
			<input style="<% out.print(cssPhoneNumber); %>" type="text" id="inputPhoneNumber" name="phoneNumberCustomer" value="<% out.print(infoOk.get(3)); %>">
		</div>
		<div class="rowInputForm">
			<label for="inputEmail">Adresse email</label>
			<input type="email" id="inputEmail" name="emailCustomer" value="<% out.print(infoOk.get(4)); %>">
		</div>
	</fieldset>
	
	<fieldset>
	<legend>Infomations commande</legend>
		<div class="rowInputForm">
			<label for="inputDate">Date<span class="star"> *</span></label>
			<input style="<% out.print(cssDate); %>" type="date" id="inputDate" name="orderDate" value="<% out.print(infoOk.get(5)); %>">
		</div>
		<div class="rowInputForm">
			<label for="inputAmount">Montant<span class="star"> *</span></label>
			<input style="<% out.print(cssAmount); %>" type="text" id="inputAmount" name="orderAmount" value="<% out.print(infoOk.get(6)); %>">
		</div>
		<div class="rowInputForm">
			<label for="inputPaymentMethod">Mode de paiement<span class="star"> *</span></label>
			<input style="<% out.print(cssPaymentMethod); %>" type="text" id="inputPaymentMethod" name="orderPaymentMethod" value="<% out.print(infoOk.get(7)); %>">
		</div>
		<div class="rowInputForm">
			<label for="inputPaymentStatus">Statut du paiement</label>
			<input type="text" id="inputPaymentStatus" name="orderPaymentStatus" value="<% out.print(infoOk.get(8)); %>">
		</div>
		<div class="rowInputForm">
			<label for="inputDeliveryMethod">Mode de livraison<span class="star"> *</span></label>
			<input style="<% out.print(cssDeliveryMethod); %>" type="text" id="inputDeliveryMethod" name="orderDeliveryMethod" value="<% out.print(infoOk.get(9)); %>">
		</div>
		<div class="rowInputForm">
			<label for="inputDeliveryStatus">Statut de la livraison</label>
			<input type="text" id="inputDeliveryStatus" name="orderDeliveryStatus" value="<% out.print(infoOk.get(10)); %>">
		</div>
	</fieldset>
	
	<div class="btnBox">
		<button name="saveFormCustomerBtn">Valider</button>
		<button name="resetFormCustomerBtn">Remettre à zéro</button>
	</div>
</form>

</body>
</html>