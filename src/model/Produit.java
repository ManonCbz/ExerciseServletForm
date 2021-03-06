package model;

public class Produit {
	
	// ================================= Attributes ================================= //

	private int id;
	private String nom;
	private String type;
	private double prix;
	private int stock;

	// ================================= Constructor  ================================= //

	public Produit(int id, String nom, String type, double prix, int stock) {
		this.id = id;
		this.nom = nom;
		this.type = type;
		this.prix = prix;
		this.stock = stock;
	}
	
	// ================================= Getter & Setter ================================= //

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
}