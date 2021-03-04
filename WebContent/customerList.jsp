<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<c:if test="${ listeClient == null }"><c:redirect url="/path"></c:redirect></c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Liste des clients</title>
<link rel="stylesheet" href="style/style.css">
<link href="style/bootstrap.min.css" rel="stylesheet">
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
		<c:when test="${ listeClient.size() > 0 }">
			<table class="table table-striped table-bordered">
				<thead>
				<tr>
					<th scope="col">Nom</th>
					<th scope="col">Prénom</th>
					<th scope="col">Adresse</th>
					<th scope="col">Téléphone</th>			
					<th scope="col">Email</th>
					<th scope="col">Action</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach items="${listeClient}" var="value">
						<tr>
							<td><c:out value="${value.name}" /></td>
							<td><c:out value="${value.firstName}" /></td>
							<td><c:out value="${value.address}" /></td>
							<td><c:out value="${value.phoneNumber}" /></td>
							<td><c:out value="${value.email}" /></td>
							<td class="actionTD">
								<form action="Servlet" method="POST" aria-hidden="true">
									<input type="hidden" name="delete" value="<c:out value="${ value.id }" />">
									<input type="hidden" name="page" value="customer">
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
		
		<c:when test="${ listeClient.size() == 0  }">
			<p class="errorMsg">Aucun client enregistré.</p>
		</c:when>
			
	</c:choose>
</div>

</body>
</html>