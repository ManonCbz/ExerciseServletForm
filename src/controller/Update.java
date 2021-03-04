package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.Db;
import model.Client;
import model.Commande;


@WebServlet("/update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Update() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		
		ArrayList<Client> listeClient = Db.recupListeClient();
		ArrayList<Commande> listeCommande = Db.recupListeCommande(listeClient);
		
		String btnOrderSave = request.getParameter("saveUpdateOrderBtn");
		String btnOrderReset = request.getParameter("resetOrderBtn");
		
		String btnCustomerSave = request.getParameter("saveUpdateCustomerBtn");
		String btnCustomerReset = request.getParameter("resetCustomerBtn");

		if(btnOrderReset != null) {
		
			this.getServletContext().getRequestDispatcher("/orderList.jsp").forward(request, response);			
			
		}
		else if (btnCustomerReset != null) {
			
			this.getServletContext().getRequestDispatcher("/customerList.jsp").forward(request, response);			

		}
		else if (btnOrderSave != null) {
			
			// Récupère les nouvelles infos commande
			String dateOrder = request.getParameter("orderDate");
			String amount = request.getParameter("orderAmount");
			String paymentMethod = request.getParameter("orderPaymentMethod");
			String paymentStatus = request.getParameter("orderPaymentStatus");
			String deliveryMethod = request.getParameter("orderDeliveryMethod");
			String deliveryStatus = request.getParameter("orderDeliveryStatus");

			// Récupère la commande à modifier
			int id = Integer.parseInt(request.getParameter("idOrder"));
			
			Commande commandeModif = null;
			
			for(Commande c : listeCommande) {
				if(c.getId() == id)	commandeModif = c;				
			}
			
			// MAJ info commande
			commandeModif.setDate(dateOrder);
			commandeModif.setAmount(amount);
			commandeModif.setPaymentMethod(paymentMethod);
			commandeModif.setPaymentStatus(paymentStatus);
			commandeModif.setDeliveryMethod(deliveryMethod);
			commandeModif.setDeliveryStatus(deliveryStatus);
			
			Db.updateCommande(commandeModif);
			
			listeCommande = Db.recupListeCommande(listeClient);
			session.setAttribute("listeCommande", listeCommande);
			
			this.getServletContext().getRequestDispatcher("/orderList.jsp").forward(request, response);			
			
		}
		else if (btnCustomerSave != null) {
			
			// Récupère les nouvelles infos client
			String name = request.getParameter("nameCustomer");
			String firstName = request.getParameter("firstNameCustomer");
			String address = request.getParameter("addressCustomer");
			String phoneNumber = request.getParameter("phoneNumberCustomer");
			String email = request.getParameter("emailCustomer");
			
			// Récupère le client à modifier
			int id = Integer.parseInt(request.getParameter("idCustomer"));
			
			Client clientModif = null;
			
			for(Client c : listeClient) {
				if(c.getId() == id) clientModif = c;
			}
			
			// MAJ info client
			clientModif.setName(name);
			clientModif.setFirstName(firstName);
			clientModif.setAddress(address);
			clientModif.setPhoneNumber(phoneNumber);
			clientModif.setEmail(email);
			
			Db.updateClient(clientModif);
			
			listeClient = Db.recupListeClient();
			listeCommande = Db.recupListeCommande(listeClient);

			session.setAttribute("listeClient", listeClient);
			session.setAttribute("listeCommande", listeCommande);
			
			this.getServletContext().getRequestDispatcher("/customerList.jsp").forward(request, response);				
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
