package org.eclipse.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter("/*")
public class LogFilter implements Filter {


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		
		// Récupère la variable de session
		String connection = (String) session.getAttribute("user");
		// Récupère le chemin demandé par l’utilisateur
		String chemin = req.getServletPath();
		// Récupère la méthode HTTP utilisée (GET ou POST)
		String methode = req.getMethod();

		
		if(connection != null || chemin.equals("/") || chemin.equals("/index.jsp") || chemin.equals("/log") && methode.equals("POST")) {
			chain.doFilter(request, response);
			System.out.println("Filter : ok");
		}
		else {
			res.sendRedirect("index.jsp");
			System.out.println("Filter: ko");
		}
	}
}