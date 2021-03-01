package model;

public class User {
	
	// ================================= Attributes ================================= //
	
	private String username;
	private String password;
	
	// ================================= Constructor  ================================= //
	
	public User(String username, String password) {
		this.username = username;
		this.password = password;
	}
	
	// ================================= Getter & Setter ================================= //

	public String getUsername() {
		return username;
	}

	public void setUsername(String login) {
		this.username = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}