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
<title>Liste de client</title>
<link rel="stylesheet" href="style/style.css">
<link href="style/bootstrap.min.css" rel="stylesheet">
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

<div class="menu2">

	<% 
	if (listeClient != null) {
	%>
	<table class="table table-striped table-bordered">
		<thead>
		<tr>
			<th scope="col">Nom</th>
			<th scope="col">Prénom</th>
			<th scope="col">Adresse</th>
			<th scope="col">Téléphone</th>			
			<th scope="col">Email</th>
			<th scope="col" style="color:red">Action</th>
		</tr>
		</thead>
		<tbody>
			
			<%		
				for (int i = 0; i < listeClient.size(); i++) {
				%>
					<tr>
						<td><% out.print(listeClient.get(i).getName()); %></td>
						<td><% out.print(listeClient.get(i).getFirstName()); %></td>
						<td><% out.print(listeClient.get(i).getAddress()); %></td>
						<td><% out.print(listeClient.get(i).getPhoneNumber()); %></td>
						<td><% out.print(listeClient.get(i).getEmail()); %></td>
						<td style="text-align:center; padding:0"><form action="Servlet" method="POST" aria-hidden="true" style="display:flex;justify-content:center"><input type="hidden" name="delete" value="<%out.print(listeClient.get(i).getId());%>"><input type="hidden" name="page" value="customer"><button type="submit" class="close" aria-label="Close" style="color:red; font-size:35px; cursor:pointer;">&times;</button></form></td>
					</tr>
				<%
				}
			
			%>
			
		</tbody>
	</table>
	<%
	} 
	else {
	%>
		
		<p class="errorMsg">Aucun client enregistré.</p>
		
	<%
	}
	%>
</div>

</body>
</html>