package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;


@WebServlet("/log")
public class Log extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Log() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		User admin = new User("Manon", "test");

		HttpSession session = request.getSession();

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		User userLog = new User(username, password);
		
		if(admin.getUsername().equals(userLog.getUsername()) && admin.getPassword().equals(userLog.getPassword())) {

			session.setAttribute("user", "ok");
			this.getServletContext().getRequestDispatcher("/menu.jsp").forward(request, response);
			
		}
		else {
			this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}