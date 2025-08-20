package model;

public class Transaction {

	    private String dateTime;
	    private String type;
	    private double amount;
	    private double balanceAfter;

	    public Transaction() {
	    }

	    public Transaction(String dateTime, String type, double amount, double balanceAfter) {
	        this.dateTime = dateTime;
	        this.type = type;
	        this.amount = amount;
	        this.balanceAfter = balanceAfter;
	    }

	    public String getDateTime() {
	        return dateTime;
	    }

	    public void setDateTime(String dateTime) {
	        this.dateTime = dateTime;
	    }

	    public String getType() {
	        return type;
	    }

	    public void setType(String type) {
	        this.type = type;
	    }

	    public double getAmount() {
	        return amount;
	    }

	    public void setAmount(double amount) {
	        this.amount = amount;
	    }

	    public double getBalanceAfter() {
	        return balanceAfter;
	    }

	    public void setBalanceAfter(double balanceAfter) {
	        this.balanceAfter = balanceAfter;
	    }

		@Override
		public String toString() {
			return "Transaction [dateTime=" + dateTime + ", type=" + type + ", amount=" + amount + ", balanceAfter="
					+ balanceAfter + "]";
		}
	



	
	
	
	

}
