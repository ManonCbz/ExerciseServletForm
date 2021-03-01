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
		
		// R�cup�re la variable de session
		String connection = (String) session.getAttribute("user");
		// R�cup�re le chemin demand� par l�utilisateur
		String chemin = req.getServletPath();
		// R�cup�re la m�thode HTTP utilis�e (GET ou POST)
		String methode = req.getMethod();
		
		boolean isStaticResource = ((HttpServletRequest) request).getRequestURI().startsWith("TPJEEForm/style/");
		
		if(connection != null || chemin.equals("/") || chemin.equals("/index.jsp") || chemin.equals("/log") && methode.equals("POST") || req.getRequestURI().toString().contains(".css")) {

			    chain.doFilter(request, response);
			    System.out.println("Filter : ok");
		}
		else {
			req.getServletContext().getRequestDispatcher("/index.jsp").forward(req, res);
			System.out.println("Filter: ko");
			
		}
	}
}