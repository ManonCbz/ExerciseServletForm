<c:if test="${ listeClient == null }"><c:redirect url="/path"></c:redirect></c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Nouvelle commande</title>
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
			<input type="text" id="inputName" name="nameCustomer">
		</div>
		<div class="rowInputForm">
			<label for="inputFirstName">Prénom</label>
			<input type="text" id="inputFirstName" name="firstNameCustomer">
		</div>
		<div class="rowInputForm">
			<label for="inputAddress">Adresse de livraison<span class="star"> *</span></label>
			<input type="text" id="inputAddress" name="addressCustomer">
		</div>
		<div class="rowInputForm">
			<label for="inputPhoneNumber">Numéro de téléphone<span class="star"> *</span></label>
			<input type="text" id="inputPhoneNumber" name="phoneNumberCustomer">
		</div>
		<div class="rowInputForm">
			<label for="inputEmail">Adresse email</label>
			<input type="email" id="inputEmail" name="emailCustomer">
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
		
		<h3>Produits : </h3>
		
		<table class="tabProduct">
			<tbody>
				<c:forEach var="p" items="${ listeProduit }">
					<tr class="productList">
						<td class="firstColumn"><label for="product"><c:out value="${ p.nom }"/><br><span class="typeProduct"><c:out value="${ p.type }"/></span></label></td>
						<td class="secondColumn"><input type="number" min="0" value="0" id="product" name="<c:out value="${ p.id }"/>"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		
	</fieldset>
	
	<div class="btnBox">
		<button name="saveFormCustomerBtn">Valider</button>
		<button name="resetFormCustomerBtn">Remettre à zéro</button>
	</div>
</form>

</body>
</html>