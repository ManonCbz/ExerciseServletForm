<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Liste des commandes</title>
<link href="style/bootstrap.min.css" rel="stylesheet">
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


<div class="menu2">

	<c:choose>
	<c:when test="${ listeCommande.size() > 0 }">
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th scope="col">Client</th>
					<th scope="col" style="width: 14%">Date</th>
					<th scope="col">Montant</th>
					<th scope="col">Mode de paiement</th>			
					<th scope="col">Statut de paiement</th>
					<th scope="col">Mode de livraison</th>	
					<th scope="col">Statut de livraison</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
			
				<c:forEach items="${ listeCommande }" var="value">
						<tr>
							<td>
							<c:choose>
								<c:when test="${ value.customer == null }">Supprimé</c:when>
								<c:when test="${ value.customer != null }"><c:out value="${ value.customer.name } ${ value.customer.firstName }"/></c:when>
							</c:choose>
							</td>
							<td><c:out value="${ value.date }"/></td>
							<td><c:out value="${ value.amount }"/></td>
							<td><c:out value="${ value.paymentMethod }"/></td>
							<td><c:out value="${ value.paymentStatus }"/></td>
							<td><c:out value="${ value.deliveryMethod }"/></td>
							<td><c:out value="${ value.deliveryStatus }"/></td>
							<td style="text-align:center; padding:0"><form action="Servlet" method="POST" aria-hidden="true" style="display:flex;justify-content:center"><input type="hidden" name="delete" value="<c:out value="${ value.id }" />"><input type="hidden" name="page" value="order"><button type="submit" class="close" aria-label="Close" style="color:red; font-size:35px; cursor:pointer;">&times;</button></form></td>
						</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</c:when>
	
	<c:when test="${ listeCommande.size() == 0 }">
		<p class="errorMsg">Aucune commande enregistrée.</p>
	</c:when>
	</c:choose>
</div>

</body>
</html>