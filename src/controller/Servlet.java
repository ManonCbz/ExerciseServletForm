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
			
		HttpSession session = request.getSession();
		// R�cup�re les listes (variables de session)
		@SuppressWarnings("unchecked")
		ArrayList<Client> listeClient = (ArrayList<Client>) session.getAttribute("listeClient");
		@SuppressWarnings("unchecked")
		ArrayList<Commande> listeCommande = (ArrayList<Commande>) session.getAttribute("listeCommande");	
		
		// R�cup�re l'id (du client || de la commande) & s'il s'agit d'une commande ou d'un client
		int supprimerID = Integer.parseInt(request.getParameter("delete"));
		String page = request.getParameter("page");
		
		// Si l'utilisateur souhaite supprimer un client
		if(page.equals("customer")) {
			// Parcours la liste et supprime le client avec le m�me id	
			for(int i = 0; i < listeClient.size(); i++) {
				if(listeClient.get(i).getId() == supprimerID) {

					for(int j = 0; j < listeCommande.size(); j++) {
						if(listeCommande.get(j).getCustomer().getId() == listeClient.get(i).getId()) {
							listeCommande.get(j).setCustomer(null);
						}
					}
					
					Db.deleteClient(listeClient.get(i));
					listeClient.remove(i);
				}
			}

			// MAJ de la liste et redirection sur la vue qui liste les client
			session.setAttribute("listeClient", listeClient);	
			session.setAttribute("listeCommande", listeCommande);
			this.getServletContext().getRequestDispatcher("/customerList.jsp").forward(request, response);			
		}
		// Si l'utilisateur souhaite supprimer une commande
		else if(page.equals("order")) {
			// Parcours la liste et supprime la commande avec le m�me id	
			for(int i = 0; i < listeCommande.size(); i++) {
				if(listeCommande.get(i).getId() == supprimerID) {
					Db.deleteCommande(listeCommande.get(i));
					listeCommande.remove(i);
				}
			}

			// MAJ de la liste et redirection sur la vue qui liste les commandes
			session.setAttribute("listeCommande", listeCommande);
			this.getServletContext().getRequestDispatcher("/orderList.jsp").forward(request, response);			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
