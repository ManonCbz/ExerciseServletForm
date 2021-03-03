package metier;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Client;
import model.Commande;

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

	public static ArrayList<Commande> recuptListeCommande(ArrayList<Client> listeClient) {
		
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
				list.add(c);
				
			}

			result.close();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public static void addClient(Client client) {
		
		try {
			Connection conn = connectionDB();
						
			String query = "INSERT INTO client VALUES(?, ?, ?, ?, ?, ?)";

			PreparedStatement prepare = conn.prepareStatement(query);
			
			prepare.setInt(1, client.getId());
			prepare.setString(2, client.getName());
			prepare.setString(3, client.getFirstName());
			prepare.setString(4, client.getAddress());
			prepare.setString(5, client.getPhoneNumber());
			prepare.setString(6, client.getEmail());

			prepare.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void addCommande(Commande commande) {
		
		try {
			Connection conn = connectionDB();
						
			String query = "INSERT INTO commande VALUES(?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement prepare = conn.prepareStatement(query);
			
			prepare.setInt(1, commande.getId());
			prepare.setString(2, commande.getDate());
			prepare.setString(3, commande.getAmount());
			prepare.setString(4, commande.getPaymentMethod());
			prepare.setString(5, commande.getPaymentStatus());
			prepare.setString(6, commande.getDeliveryMethod());
			prepare.setString(7, commande.getDeliveryStatus());
			prepare.setInt(8, commande.getCustomer().getId());

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
			
			String queryDelete = "DELETE FROM commande WHERE id = " + commande.getId() + ";";
			state.executeUpdate(queryDelete);
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	
}
}