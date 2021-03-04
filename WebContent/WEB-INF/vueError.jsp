<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<c:set var="cssName" value="" scope="page" />
<c:set var="cssAddress" value="" scope="page" />
<c:set var="cssPhoneNumber" value="" scope="page" />
<c:set var="cssDate" value="" scope="page" />
<c:set var="cssAmount" value="" scope="page" />
<c:set var="cssPaymentMethod" value="" scope="page" />
<c:set var="cssDeliveryMethod" value="" scope="page" />


<c:forEach items="${error}" var="value">

	<c:choose>
		<c:when test="${ value == 'name' }"><c:set var="cssName" value="border-color: red"/></c:when>
		<c:when test="${ value == 'address' }"><c:set var="cssAddress" value="border-color: red"/></c:when>
		<c:when test="${ value == 'phoneNumber' }"><c:set var="cssPhoneNumber" value="border-color: red"/></c:when>
		<c:when test="${ value == 'date' }"><c:set var="cssDate" value="border-color: red"/></c:when>
		<c:when test="${ value == 'amount' }"><c:set var="cssAmount" value="border-color: red"/></c:when>
		<c:when test="${ value == 'paymentMethod' }"><c:set var="cssPaymentMethod" value="border-color: red"/></c:when>
		<c:when test="${ value == 'deliveryMethod' }"><c:set var="cssDeliveryMethod" value="border-color: red"/></c:when>
	</c:choose>


</c:forEach>


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
		<a href="menu.jsp">Créer une nouvelle commande</a>
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
			<input style="<c:out value="${ cssName }"/>" type="text" id="inputName" name="nameCustomer" value="<c:out value="${ infoOk.get(0) }" />">
		</div>
		<div class="rowInputForm">
			<label for="inputFirstName">Prénom</label>
			<input type="text" id="inputFirstName" name="firstNameCustomer" value="<c:out value="${ infoOk.get(1) }" />">
		</div>
		<div class="rowInputForm">
			<label for="inputAddress">Adresse de livraison<span class="star"> *</span></label>
			<input style="<c:out value="${ cssAddress }"/>" type="text" id="inputAddress" name="addressCustomer" value="<c:out value="${ infoOk.get(2) }" />">
		</div>
		<div class="rowInputForm">
			<label for="inputPhoneNumber">Numéro de téléphone<span class="star"> *</span></label>
			<input style="<c:out value="${ cssPhoneNumber }"/>" type="text" id="inputPhoneNumber" name="phoneNumberCustomer" value="<c:out value="${ infoOk.get(3) }" />">
		</div>
		<div class="rowInputForm">
			<label for="inputEmail">Adresse email</label>
			<input type="email" id="inputEmail" name="emailCustomer" value="<c:out value="${ infoOk.get(4) }" />">
		</div>
	</fieldset>
	
	<fieldset>
	<legend>Infomations commande</legend>
		<div class="rowInputForm">
			<label for="inputDate">Date<span class="star"> *</span></label>
			<input style="<c:out value="${ cssDate }"/>" type="date" id="inputDate" name="orderDate" value="<c:out value="${ infoOk.get(5) }" />">
		</div>
		<div class="rowInputForm">
			<label for="inputAmount">Montant<span class="star"> *</span></label>
			<input style="<c:out value="${ cssAmount }"/>" type="text" id="inputAmount" name="orderAmount" value="<c:out value="${ infoOk.get(6) }" />">
		</div>
		<div class="rowInputForm">
			<label for="inputPaymentMethod">Mode de paiement<span class="star"> *</span></label>
			<input style="<c:out value="${ cssPaymentMethod }"/>" type="text" id="inputPaymentMethod" name="orderPaymentMethod" value="<c:out value="${ infoOk.get(7) }" />">
		</div>
		<div class="rowInputForm">
			<label for="inputPaymentStatus">Statut du paiement</label>
			<input type="text" id="inputPaymentStatus" name="orderPaymentStatus" value="<c:out value="${ infoOk.get(8) }" />">
		</div>
		<div class="rowInputForm">
			<label for="inputDeliveryMethod">Mode de livraison<span class="star"> *</span></label>
			<input style="<c:out value="${ cssDeliveryMethod }"/>" type="text" id="inputDeliveryMethod" name="orderDeliveryMethod" value="<c:out value="${ infoOk.get(9) }" />">
		</div>
		<div class="rowInputForm">
			<label for="inputDeliveryStatus">Statut de la livraison</label>
			<input type="text" id="inputDeliveryStatus" name="orderDeliveryStatus" value="<c:out value="${ infoOk.get(10) }" />">
		</div>
	</fieldset>
	
	<div class="btnBox">
		<button name="saveFormCustomerBtn">Valider</button>
		<button name="resetFormCustomerBtn">Remettre à zéro</button>
	</div>
</form>

</body>
</html>