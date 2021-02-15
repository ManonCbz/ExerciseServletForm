package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Client;
import model.Commande;

public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FirstServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String resetButton = request.getParameter("resetFormCustomerBtn");
		String sendFormButton = request.getParameter("saveFormCustomerBtn");
		
		if(resetButton != null) {
			this.getServletContext().getRequestDispatcher("/index.html").forward(request, response);
		}
		else if(sendFormButton != null) {
			
			String name = request.getParameter("nameCustomer");
			String firstName = request.getParameter("firstNameCustomer");
			String address = request.getParameter("addressCustomer");
			String phoneNumber = request.getParameter("phoneNumberCustomer");
			String email = request.getParameter("emailCustomer");
			
			String dateOrder = request.getParameter("orderDate");
			String amount = request.getParameter("orderAmount");
			String paymentMethod = request.getParameter("orderPaymentMethod");
			String paymentStatus = request.getParameter("orderPaymentStatus");
			String deliveryMethod = request.getParameter("orderDeliveryMethod");
			String deliveryStatus = request.getParameter("orderDeliveryStatus");

			if (name != "" && address != "" && phoneNumber != "" && dateOrder != "" && amount != "" && paymentMethod != "" && deliveryMethod != "") {

				if(firstName == "") firstName = "Non renseigné";
				if(email == "") email = "Non renseigné";
				if(paymentStatus == "") paymentStatus = "Non renseigné";
				if(deliveryStatus == "") deliveryStatus = "Non renseigné";
				
				Client customer = new Client(name, firstName, address, phoneNumber, email);
				Commande order = new Commande(dateOrder, amount, paymentMethod, paymentStatus, deliveryMethod, deliveryStatus, customer);
				
				request.setAttribute("customer", customer);
				request.setAttribute("order", order);
				
				this.getServletContext().getRequestDispatcher("/WEB-INF/vue.jsp").forward(request, response);
			
			}
			else {
				
				ArrayList<String> errorList = new ArrayList<String>();
				ArrayList<String> infoOk = new ArrayList<String>();
				
				if(name == "") errorList.add("name");
				if(address == "") errorList.add("address");
				if(phoneNumber == "") errorList.add("phoneNumber");
				if(dateOrder == "") errorList.add("date");
				if(amount == "") errorList.add("amount");
				if(paymentMethod == "") errorList.add("paymentMethod");
				if(deliveryMethod == "") errorList.add("deliveryMethod");

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
				
				request.setAttribute("error", errorList);
				request.setAttribute("infoOk", infoOk);
				this.getServletContext().getRequestDispatcher("/WEB-INF/vueError.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	

}
