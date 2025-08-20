package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import Dao.AtmDao;
import connection.DBCon;

/**
 * Servlet implementation class ChangePinServlet
 */
@WebServlet("/ChangePinServlet")
public class ChangePinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  String acc = (String) request.getSession().getAttribute("account_no");
	        String oldPin = request.getParameter("old_pin");
	        String newPin = request.getParameter("new_pin");

	        try (Connection con = DBCon.getConnection()) {
	            AtmDao dao = new AtmDao(con);

	            boolean isChanged = dao.changepin(acc, newPin);
	            if (isChanged) {
	                response.sendRedirect("Atmdashboard.jsp?msg=Pin changed successfully");
	            } else {
	                response.sendRedirect("change_pin.jsp?msg=Error changing PIN");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("change_pin.jsp?msg=Server error");
	        }
	    }
}
