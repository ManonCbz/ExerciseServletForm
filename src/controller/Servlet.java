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

@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Servlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String deleteBtn = request.getParameter("deleteBtn");
		String updateBtn = request.getParameter("updateBtn");
		
		HttpSession session = request.getSession();
		// Récupère les listes
		
		ArrayList<Client> listeClient = Db.recupListeClient();
		ArrayList<Commande> listeCommande = Db.recupListeCommande(listeClient);
		
		// Récupère l'id (du client || de la commande) & s'il s'agit d'une commande ou d'un client
		int idAttribut = Integer.parseInt(request.getParameter("delete"));
		String objectName = request.getParameter("page");
		
		if(deleteBtn != null) {
			// Si l'utilisateur souhaite supprimer un client
			if(objectName.equals("customer")) {
				// Parcours la liste et supprime le client avec le même id	
				for(int i = 0; i < listeClient.size(); i++) {
					if(listeClient.get(i).getId() == idAttribut) {
						Db.deleteClient(listeClient.get(i));
					}
				}
				
				// MAJ de la liste et redirection sur la vue qui liste les client
				listeClient = Db.recupListeClient();
				listeCommande = Db.recupListeCommande(listeClient);

				session.setAttribute("listeClient", listeClient);	
				session.setAttribute("listeCommande", listeCommande);
				this.getServletContext().getRequestDispatcher("/customerList.jsp").forward(request, response);			
			}
			// Si l'utilisateur souhaite supprimer une commande
			else if(objectName.equals("order")) {
				// Parcours la liste et supprime la commande avec le même id	
				for(int i = 0; i < listeCommande.size(); i++) {
					if(listeCommande.get(i).getId() == idAttribut) {
						Db.deleteCommande(listeCommande.get(i));
					}
				}

				// MAJ de la liste et redirection sur la vue qui liste les commandes
				listeCommande = Db.recupListeCommande(listeClient);

				session.setAttribute("listeCommande", listeCommande);
				this.getServletContext().getRequestDispatcher("/orderList.jsp").forward(request, response);			
			}
		}
		else if (updateBtn != null) {
			
			if(objectName.equals("customer")) {
				
				Client client = null;
				
				for(Client c : listeClient) {
					if(c.getId() == idAttribut) {
						client = c;
					}
				}
				
				request.setAttribute("client", client);
				this.getServletContext().getRequestDispatcher("/WEB-INF/vueUpdateCustomer.jsp").forward(request, response);			

			}
			else if(objectName.equals("order")) {
				
				Commande commande = null;
				
				for(Commande c : listeCommande) {
					if(c.getId() == idAttribut) {
						commande = c;
					}
				}
				
				request.setAttribute("commande", commande);
				this.getServletContext().getRequestDispatcher("/WEB-INF/vueUpdateOrder.jsp").forward(request, response);			

			}
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
