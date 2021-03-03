package model;

import java.util.concurrent.atomic.AtomicInteger;

public class Client {
	
	// ================================= Attributes ================================= //
	
	private int id;
	private String name;
	private String firstName;
	private String address;
	private String phoneNumber;
	private String email;
	
	private static final AtomicInteger count = new AtomicInteger();

	// ================================= Constructor  ================================= //
	
	public Client(String name, String firstName, String address, String phoneNumber, String email) {
		this.id = count.incrementAndGet();
		this.name = name;
		this.firstName = firstName;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.email = email;
	}

	public Client(int id, String name, String firstName, String address, String phoneNumber, String email) {
		this.id = id;
		this.name = name;
		this.firstName = firstName;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.email = email;
	}

	// ================================= Getter & Setter ================================= //
	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPhoneNumber() {
		return phoneNumber;
	}


	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
	
	// ================================= Methods ================================= //

	
}