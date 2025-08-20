package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Transaction;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import Dao.AtmDao;
import connection.DBCon;

/**
 * Servlet implementation class transactionhistoryServlet
 */
@WebServlet("/transactionhistoryServlet")
public class transactionhistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   HttpSession session = request.getSession();
	        String acc = (String) session.getAttribute("account_no");

	        if (acc == null) {
	            response.sendRedirect("index.jsp");
	            return;
	        }

	        try {
	            Connection con = DBCon.getConnection();
	            AtmDao dao = new AtmDao(con);
	            List<Transaction> history = dao.getTransactionHistory(acc);

	            request.setAttribute("history", history);
	            RequestDispatcher dispatcher = request.getRequestDispatcher("transaction_history.jsp");
	            dispatcher.forward(request, response);
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Error fetching transaction history.");
	        }
	    }
	}




