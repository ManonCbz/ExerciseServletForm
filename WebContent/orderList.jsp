<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<c:if test="${ listeCommande == null }"><c:redirect url="/path"></c:redirect></c:if>

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
					<th scope="col">Détail de la commande</th>
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
							<td>
								<ul>
									<c:forEach items="${ value.listeAchat.keySet() }" var="i">
										<li>
											<c:forEach items="${ listeProduit }" var="j">
												<c:if test="${ i == j.id }"><c:out value="${ j.nom }"/></c:if>
											</c:forEach>
											<span class="typeProduct">(<c:out value="${ value.listeAchat.get(i) }"/>)</span>
										</li>
									</c:forEach>
								</ul>
							</td>
							<td class="actionTD">
								<form action="Servlet" method="POST" aria-hidden="true">
									<input type="hidden" name="delete" value="<c:out value="${ value.id }" />">
									<input type="hidden" name="page" value="order">
									<button type="submit" name="updateBtn" class="updateBtn" title="Modifier"><img src="style/img/writing.png"></button>
									/
									<button type="submit" name="deleteBtn" class="updateBtn" title="Supprimer"><img src="style/img/trash.png"></button>
								</form>
							</td>
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