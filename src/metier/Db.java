package metier;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Client;
import model.Commande;
import model.Produit;

public class Db {

	public static void main(String[] args) {

	}
	
	public static Connection connectionDB() {
		
		Connection conn = null;
		
		try {
			Class.forName("org.postgresql.Driver");
			
			String url = "jdbc:postgresql://localhost:5432/postgres?currentSchema=gestion";
			String user = "postgres";
			String passwd = "4991";
			
			conn = DriverManager.getConnection(url, user, passwd);
						
		}
		catch (Exception e){
			e.printStackTrace();
		}

		return conn;			
		
	}

	public static ArrayList<Client> recupListeClient() {
		
		ArrayList<Client> list = new ArrayList<Client>();
		
		try {
			
			Connection conn = connectionDB();
			
			Statement state = conn.createStatement();
			
			ResultSet result = state.executeQuery("SELECT * FROM client");
						
			while(result.next()) {
				
				Client c = new Client(result.getInt("id"), result.getString("nom"), result.getString("prenom"), result.getString("adresse"), result.getString("telephone"), result.getString("email"));
				list.add(c);
			}
			
			result.close();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public static ArrayList<Commande> recupListeCommande(ArrayList<Client> listeClient) {
		
		ArrayList<Commande> list = new ArrayList<Commande>();
		
		try {
			
			Connection conn = connectionDB();
			
			Statement state = conn.createStatement();

			ResultSet result = state.executeQuery("SELECT * FROM commande");
						
			while(result.next()) {
				
				Client clientCommande = null;
				
				for(int i = 0; i < listeClient.size(); i++) {
									
					if(listeClient.get(i).getId() == result.getInt("id_client")) {
						
						clientCommande = listeClient.get(i);
						break;
					}
				}

				Commande c = new Commande(result.getInt("id"), result.getString("date"), result.getString("montant"), result.getString("mode_paiement"), result.getString("statut_paiement"), result.getString("mode_livraison"), result.getString("statut_livraison"), clientCommande);
				
				Statement state2 = conn.createStatement();
				
				ResultSet result2 = state2.executeQuery("SELECT * FROM achat WHERE id_commande = " + c.getId());
				

				while(result2.next()) {
					
					c.getListeAchat().put(result2.getInt("id_produit"), result2.getInt("quantite"));
					
				}
				
				list.add(c);
				
			}

			result.close();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static ArrayList<Produit> recupListeProduit() {
		
		ArrayList<Produit> list = new ArrayList<Produit>();
		
		try {
			
			Connection conn = connectionDB();
			
			Statement state = conn.createStatement();
			
			ResultSet result = state.executeQuery("SELECT * FROM produit");
			
			while(result.next()) {
				
				Produit p = new Produit(result.getInt("id"), result.getString("nom"), result.getString("type"), result.getDouble("prix"));
				list.add(p);
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static void addClient(Client client) {
		
		try {
			Connection conn = connectionDB();
						
			String query = "INSERT INTO client(nom, prenom, adresse, telephone, email) VALUES(?, ?, ?, ?, ?)";

			PreparedStatement prepare = conn.prepareStatement(query);
			
			prepare.setString(1, client.getName());
			prepare.setString(2, client.getFirstName());
			prepare.setString(3, client.getAddress());
			prepare.setString(4, client.getPhoneNumber());
			prepare.setString(5, client.getEmail());

			prepare.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void addCommande(Commande commande) {
		
		try {
			Connection conn = connectionDB();
						
			String query = "INSERT INTO commande(date, montant, mode_paiement, statut_paiement, mode_livraison, statut_livraison, id_client) VALUES(?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement prepare = conn.prepareStatement(query);
			
			prepare.setString(1, commande.getDate());
			prepare.setString(2, commande.getAmount());
			prepare.setString(3, commande.getPaymentMethod());
			prepare.setString(4, commande.getPaymentStatus());
			prepare.setString(5, commande.getDeliveryMethod());
			prepare.setString(6, commande.getDeliveryStatus());
			prepare.setInt(7, commande.getCustomer().getId());

			prepare.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static void deleteClient(Client client) {
	
			try {
				
				Connection conn = connectionDB();
				Statement state = conn.createStatement();
				
				String queryUpdate = "UPDATE commande SET id_client = NULL WHERE id_client = " + client.getId();
				state.executeUpdate(queryUpdate);

				String queryDelete = "DELETE FROM client WHERE id = " + client.getId() + ";";
				state.executeUpdate(queryDelete);
				
			}
			catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	public static void deleteCommande(Commande commande) {
		
		try {
			
			Connection conn = connectionDB();
			Statement state = conn.createStatement();
			
			String queryDeleteAchat = "DELETE FROM achat WHERE id_commande = " + commande.getId() + ";";
			state.executeUpdate(queryDeleteAchat);
			
			String queryDelete = "DELETE FROM commande WHERE id = " + commande.getId() + ";";
			state.executeUpdate(queryDelete);
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
	public static void updateCommande(Commande commande) {
		
		try {
						
			Connection conn = connectionDB();
			Statement state = conn.createStatement();
			
			String query = "UPDATE commande SET date = '" + commande.getDate() + "', "
					+ "montant = '" + commande.getAmount() + "', "
					+ "mode_paiement = '" + commande.getPaymentMethod() + "', "
					+ "statut_paiement = '" + commande.getPaymentStatus() + "', "
					+ "mode_livraison = '" + commande.getDeliveryMethod() + "', "
					+ "statut_livraison = '" + commande.getDeliveryStatus() + "' "
					+ "WHERE id = " + commande.getId();
			
			state.executeUpdate(query);
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static void updateClient(Client client) {
		
		try {
			
			Connection conn = connectionDB();
			Statement state = conn.createStatement();
			
			String query = "UPDATE client SET nom = '" + client.getName() + "', "
					+ "prenom = '" + client.getFirstName() + "', "
					+ "adresse = '" + client.getAddress() + "', "
					+ "telephone = '" + client.getPhoneNumber() + "', "
					+ "email = '" + client.getEmail() + "' "
					+ "WHERE id = " + client.getId();
			
			state.executeUpdate(query);
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void addAchatCommande(Commande commande) {
		
		System.out.println("ok");
		
		try {
			
			Connection conn = connectionDB();
			
			for(int i : commande.getListeAchat().keySet()) {
										
					String query = "INSERT INTO achat VALUES(?, ?, ?)";
					
					PreparedStatement prepare = conn.prepareStatement(query);
					
					prepare.setInt(1, commande.getId());
					prepare.setInt(2, i);
					prepare.setInt(3, commande.getListeAchat().get(i));
					
					prepare.executeUpdate();
			}
						
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
}