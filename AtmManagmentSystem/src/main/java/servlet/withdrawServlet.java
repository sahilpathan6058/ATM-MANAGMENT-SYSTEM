package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import Dao.AtmDao;
import connection.DBCon;

/**
 * Servlet implementation class withdrawServlet
 */
@WebServlet("/withdrawServlet")
public class withdrawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setContentType("text/html");
	        PrintWriter out = response.getWriter();

	        // Get account number from session
	        HttpSession session = request.getSession(false);
	        String acc = (String) session.getAttribute("account_no");

	        if (acc == null) {
	            response.sendRedirect("index.jsp");
	            return;
	        }

	        // Read the amount
	        String amtStr = request.getParameter("amount");
	        double amt = Double.parseDouble(amtStr);

	        try {
	            AtmDao dao = new AtmDao(DBCon.getConnection());

	            boolean success = dao.Withdraw(acc, amt);

	            if (success) {
	                out.println("<script>alert('Withdrawal successful!'); window.location='Atmdashboard.jsp';</script>");
	            } else {
	                out.println("<script>alert('Insufficient balance or transaction failed!'); window.location='withdraw.jsp';</script>");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            out.println("<script>alert('Something went wrong!'); window.location='withdraw.jsp';</script>");
	        }
	    }
}
