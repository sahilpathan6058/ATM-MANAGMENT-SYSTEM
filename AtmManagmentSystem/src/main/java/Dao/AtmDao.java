package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.DBCon;
import model.Transaction;
import model.user;

public class AtmDao {
	private Connection con;

	public AtmDao(Connection con) {
		this.con = con;
	}

	public boolean authenticate(String acc, String pin) {
		try {
			Connection con = DBCon.getConnection();
			String sql = "SELECT * FROM users WHERE account_no=? AND pin=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, acc);
			ps.setString(2, pin);
			ResultSet rs = ps.executeQuery();
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public double getBalance(String acc) {
		double balance = 0.0;
		try {
			Connection con = DBCon.getConnection();
			String sql = "SELECT balance FROM users WHERE account_no=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, acc);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				balance = rs.getDouble("balance");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return balance; 
	}

	public boolean Withdraw(String acc, double amt) {
		try {
			Connection con = DBCon.getConnection();
			double bal = getBalance(acc);

			System.out.println("Current Balance: " + bal + ", Withdraw Request: " + amt);

			if (bal >= amt) {
				String sql = "UPDATE users SET balance = balance - ? WHERE account_no = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setDouble(1, amt);
				ps.setString(2, acc);

				int rows = ps.executeUpdate();
				System.out.println("Rows updated: " + rows);

				if (rows > 0) {
					logTransaction(acc, "Withdraw", amt, bal - amt);
					return true;
				}
			} else {
				System.out.println("Insufficient balance.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	
	public boolean transfer(String fromAcc, String toAcc, double amt) {
	    Connection con = null;

	    try {
	        double senderBalance = getBalance(fromAcc);
	        if (senderBalance < amt) {
	            return false;
	        }

	        con = DBCon.getConnection();
	        con.setAutoCommit(false); 

	        String deductQuery = "UPDATE users SET balance = balance - ? WHERE account_no = ?";
	        PreparedStatement ps1 = con.prepareStatement(deductQuery);
	        ps1.setDouble(1, amt);
	        ps1.setString(2, fromAcc);
	        int updateSender = ps1.executeUpdate();

	        String addQuery = "UPDATE users SET balance = balance + ? WHERE account_no = ?";
	        PreparedStatement ps2 = con.prepareStatement(addQuery);
	        ps2.setDouble(1, amt);
	        ps2.setString(2, toAcc);
	        int updateReceiver = ps2.executeUpdate();

	        if (updateSender > 0 && updateReceiver > 0) {
	            logTransaction(fromAcc, "Transfer", amt, senderBalance - amt);
	            logTransaction(toAcc, "Deposit", amt, getBalance(toAcc));
	            con.commit();
	            return true;
	        } else {
	            con.rollback();
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        try {
	            if (con != null) con.rollback(); 
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    } finally {
	        try {
	            if (con != null) {
	                con.setAutoCommit(true);
	                con.close(); 
	            }
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }
	    return false; 
	}


	public boolean changepin(String acc, String newPin) {
	    Connection con = null;
	    PreparedStatement ps = null;

	    try {
	        con = DBCon.getConnection();
	        String sql = "UPDATE users SET pin = ? WHERE account_no = ?";
	        ps = con.prepareStatement(sql);
	        ps.setString(1, newPin);
	        ps.setString(2, acc);

	        int rowsAffected = ps.executeUpdate();
	        return rowsAffected > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (con != null) con.close(); 
	        } catch (Exception closeEx) {
	            closeEx.printStackTrace();
	        }
	    }
	    return false;
	}



	public List<Transaction> getTransactionHistory(String acc) {
		List<Transaction> list = new ArrayList<>();
		try {
			Connection con = DBCon.getConnection();
			String sql = "SELECT * FROM transactions WHERE account_no=? ORDER BY timestamp DESC LIMIT 10";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, acc);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Transaction t = new Transaction();
				t.setDateTime(rs.getString("timestamp"));
				t.setType(rs.getString("type"));
				t.setAmount(rs.getDouble("amount"));
				t.setBalanceAfter(rs.getDouble("balance"));
				list.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	private void logTransaction(String acc, String type, double amount, double newBalance) throws SQLException {
		String sql="INSERT INTO transactions(account_no, type, amount, balance) VALUES (?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, acc);
		ps.setString(2, type);
		ps.setDouble(3, amount);
		ps.setDouble(4, newBalance);
		ps.executeUpdate();
	}

}
