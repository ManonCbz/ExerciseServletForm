<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="model.Client"%>
<%@ page import ="model.Commande"%>
<%@ page import = "java.util.*" %>

<%
	ArrayList<Commande> listeCommande = (ArrayList<Commande>) session.getAttribute("listeCommande");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="style/bootstrap.min.css" rel="stylesheet">
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


<div class="menu2">

	<% 
	if (listeCommande != null) {
	%>
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
		<% 
				for (int i = 0; i < listeCommande.size(); i++) {
				%>
					<tr>
						<td><% out.print(listeCommande.get(i).getCustomer().getName() + " " + listeCommande.get(i).getCustomer().getFirstName()); %></td>
						<td><% out.print(listeCommande.get(i).getDate()); %></td>
						<td><% out.print(listeCommande.get(i).getAmount()); %></td>
						<td><% out.print(listeCommande.get(i).getPaymentMethod()); %></td>
						<td><% out.print(listeCommande.get(i).getPaymentStatus()); %></td>
						<td><% out.print(listeCommande.get(i).getDeliveryMethod()); %></td>
						<td><% out.print(listeCommande.get(i).getDeliveryStatus()); %></td>
						<td style="text-align:center; padding:0"><form action="Servlet" method="POST" aria-hidden="true" style="display:flex;justify-content:center"><input type="hidden" name="delete" value="<%out.print(listeCommande.get(i).getId());%>"><input type="hidden" name="page" value="order"><button type="submit" class="close" aria-label="Close" style="color:red; font-size:35px; cursor:pointer;">&times;</button></form></td>
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
	
	<p class="errorMsg">Aucune commande enregistrée.</p>
	
<%
}
%>
</div>

</body>
</html>