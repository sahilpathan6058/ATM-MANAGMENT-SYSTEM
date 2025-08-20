package servlet;

import jakarta.servlet.RequestDispatcher;
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
 * Servlet implementation class TransferServlet
 */
@WebServlet("/TransferServlet")
public class TransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        String fromAcc = request.getParameter("fromAcc");
        String toAcc = request.getParameter("toAcc");
        String amtStr = request.getParameter("amount");

        double amount = 0;
        try {
            amount = Double.parseDouble(amtStr);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid amount entered.");
            request.getRequestDispatcher("transfer.jsp").forward(request, response);
            return;
        }

        AtmDao dao = new AtmDao(null);
        boolean success = dao.transfer(fromAcc, toAcc, amount);

        if (success) {
            request.setAttribute("message", "Transfer successful!");
        } else {
            request.setAttribute("message", "Transfer failed. Please check account number or balance.");
        }

        RequestDispatcher rd = request.getRequestDispatcher("transfer.jsp");
        rd.forward(request, response);
    }
}
