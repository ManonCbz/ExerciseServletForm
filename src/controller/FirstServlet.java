package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Client;
import model.Commande;
import model.Produit;
import metier.Db;

public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FirstServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Boutons
		String sendFormButton = request.getParameter("saveFormCustomerBtn");
		String oldCustomer = request.getParameter("oldCustomer");
		
		
		HttpSession session = request.getSession();
		
		// Vérifie si il n'existe pas déjà une variable de session listeClient & listeCommande
		ArrayList<Client> listeClient = Db.recupListeClient();
		ArrayList<Commande> listeCommande = Db.recupListeCommande(listeClient);
		ArrayList<Produit> listeProduit = Db.recupListeProduit();
		
		// Si bouton "Ancien client" -> redirige vers vueOldCustomer.jsp
		if (oldCustomer != null) {
			this.getServletContext().getRequestDispatcher("/WEB-INF/vueOldCustomer.jsp").forward(request, response);
		}
		// Si le bouton d'envoi du formulaire est ok
		else if(sendFormButton != null) {
			// Récupère les valeurs dans le cas d'un nouveau client
			String name = request.getParameter("nameCustomer");
			String firstName = request.getParameter("firstNameCustomer");
			String address = request.getParameter("addressCustomer");
			String phoneNumber = request.getParameter("phoneNumberCustomer");
			String email = request.getParameter("emailCustomer");
			
			// Récupère l'id d'un utilisateur dans le cas d'un ancien client
			String selectCustomer = request.getParameter("selectCustomer");
			
			// Récupère les info de la commande
			String dateOrder = request.getParameter("orderDate");
			String amount = request.getParameter("orderAmount");
			String paymentMethod = request.getParameter("orderPaymentMethod");
			String paymentStatus = request.getParameter("orderPaymentStatus");
			String deliveryMethod = request.getParameter("orderDeliveryMethod");
			String deliveryStatus = request.getParameter("orderDeliveryStatus");

			// Si tout est ok
			boolean verifAncienClient = name != "" && address != "" && phoneNumber != "";
			boolean verifNouveauClient = selectCustomer != null;
			boolean verifCommande = dateOrder != "" && amount != "" && paymentMethod != "" && deliveryMethod != "";
					
			if ((verifAncienClient || verifNouveauClient) && verifCommande) {
				
				Client customer = new Client(null, null, null, null, null);
				
				// Si un id de client est envoyé récupère le client avec cet id dans la liste
				if (selectCustomer != null) {
						for (int i = 0; i < listeClient.size(); i++) {
							if(listeClient.get(i).getId() == Integer.parseInt(selectCustomer)) {
								customer = listeClient.get(i);
								break;
							}
						}
				}
				// Sinon crée un nouveau client
				else {
					customer = new Client(name, firstName, address, phoneNumber, email);
				}
				
				// Si ce client ne se trouve pas dans la liste -> enregistre celui-ci
				if(!listeClient.contains(customer)) {
					Db.addClient(customer);
				}
				
				listeClient = Db.recupListeClient();
				
				for(Client c : listeClient ) {
					if(customer.getName().equals(c.getName()) && customer.getFirstName().equals(c.getFirstName()) && customer.getAddress().equals(c.getAddress()) && customer.getPhoneNumber().equals(c.getPhoneNumber())) {
						customer = c;
					}
				}

				// Crée nouvelle commande et ajout dans la liste
				Commande order = new Commande(dateOrder, amount, paymentMethod, paymentStatus, deliveryMethod, deliveryStatus, customer);
								
				for(Produit p : listeProduit) {
					
					String idString = request.getParameter(String.valueOf(p.getId()));
					
					if(idString != null) System.out.println("id produit : " + p.getId() + " / nb : " + idString);
					
					int id = Integer.parseInt(idString);
					
					if(id != 0) order.getListeAchat().put(p.getId(), id);
					
				}
				
				Db.addCommande(order);
				listeCommande = Db.recupListeCommande(listeClient);
				
				for(Commande c : listeCommande) {
					
					if(order.getDate().equals(c.getDate()) && order.getAmount().equals(c.getAmount()) && order.getCustomer().getFirstName().equals(c.getCustomer().getFirstName()) && order.getCustomer().getName().equals(c.getCustomer().getName())) {
						order.setId(c.getId());
					}
				}
				
				Db.addAchatCommande(order);
				listeCommande = Db.recupListeCommande(listeClient);
				
				// Envoi les infos de la commande concernée à la vue
				request.setAttribute("customer", customer);
				request.setAttribute("order", order);
				// Envoi ou MAJ des variables sessions listeClient & listeCommande
				session.setAttribute("listeClient", listeClient);
				session.setAttribute("listeCommande", listeCommande);
				// Redirige vers la vue de la validation de la commande
				this.getServletContext().getRequestDispatcher("/WEB-INF/vue.jsp").forward(request, response);
			}
			else {
				// Liste d'erreur & Liste d'informations données (celle-ci servira à re remplir les cases déjà remplies dans le form)
				ArrayList<String> errorList = new ArrayList<String>();
				ArrayList<String> infoOk = new ArrayList<String>();
				
				// Si une information n'est pas rempli ajoute le nom dans la liste erreur
				if(name == "") errorList.add("name");
				if(address == "") errorList.add("address");
				if(phoneNumber == "") errorList.add("phoneNumber");
				if(dateOrder == "") errorList.add("date");
				if(amount == "") errorList.add("amount");
				if(paymentMethod == "") errorList.add("paymentMethod");
				if(deliveryMethod == "") errorList.add("deliveryMethod");

				// Ajoute toutes les infos dans la liste information
				infoOk.add(name);
				infoOk.add(firstName);
				infoOk.add(address);
				infoOk.add(phoneNumber);
				infoOk.add(email);
				infoOk.add(dateOrder);
				infoOk.add(amount);
				infoOk.add(paymentMethod);
				infoOk.add(paymentStatus);
				infoOk.add(deliveryMethod);
				infoOk.add(deliveryStatus);
				
				// Envoi listes & redirige vers la vue en cas d'erreur
				request.setAttribute("error", errorList);
				request.setAttribute("infoOk", infoOk);
				this.getServletContext().getRequestDispatcher("/WEB-INF/vueError.jsp").forward(request, response);
			}
		}
		
		// Envoi ou MAJ des variables sessions listeClient & listeCommande
		session.setAttribute("listeClient", listeClient);
		session.setAttribute("listeCommande", listeCommande);
		session.setAttribute("listeProduit", listeProduit);
		
		if(oldCustomer == null && sendFormButton == null) {
			this.getServletContext().getRequestDispatcher("/menu.jsp").forward(request, response);
		}

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
