package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import Dao.AtmDao;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		 String acc = request.getParameter("account_no");
	        String pin = request.getParameter("pin");
	        HttpSession session = request.getSession();

	        AtmDao dao = new AtmDao(null);
	        if (dao.authenticate(acc, pin)) {
	            session.setAttribute("account_no", acc);
	            response.sendRedirect("Atmdashboard.jsp");
	        } else {
	        	response.getWriter().println("Invalid credentials");
	        }
	    }
	}


