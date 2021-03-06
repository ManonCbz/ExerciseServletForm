<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
			<p class="btnCheckp"><button name="newCustomer" class="checkboxBtn">-</button> Oui</p>
			<p class="btnCheckp"><button name="oldCustomer" class="checkboxBtn checkboxBtnOk">-</button> Non</p>
		</div>
		<div class="rowInputForm">
			<c:choose>
			<c:when test="${ listeClient.size() > 0 }">
				<select name="selectCustomer" id="selectCustomer">
					<option value="">Choisissez un client...</option> 							
					<c:forEach items="${ listeClient }" var="value">
						<option value="${ value.id }"><c:out value="${ value.name } ${ value.firstName }"/></option>
					</c:forEach>
				</select>
			</c:when>
			<c:when test="${ listeClient.size() == 0 }">
				<p class="errorMsg">Il n'y a aucun client enregistré</p>
			</c:when>
			</c:choose>
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
						<td class="secondColumn">
							<c:choose>
								<c:when test="${ p.stock > 0 }">
									<input type="number" min="0" max="<c:out value="${ p.stock }"/>" value="0" id="product" name="<c:out value="${ p.id }"/>">
								</c:when>
								<c:when test="${ p.stock == 0 }">
									<p class="errorStock">Plus disponible</p>
								</c:when>
							</c:choose>
							
						</td>
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