package model;

public class user {
	private int account_no;
	private String name;
	private double balance;
	private String pin;
	
	public user() {
	}

	public user(int account_no, String name, double balance, String pin) {
		super();
		this.account_no = account_no;
		this.name = name;
		this.balance = balance;
		this.pin=pin;
	}

	public int getAccount_no() {
		return account_no;
	}

	public void setAccount_no(int account_no) {
		this.account_no = account_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}
	public String getpin() {
		return pin;
	}

	public void setpin(String pin) {
		this.pin = pin;
	}

	@Override
	public String toString() {
		return "user [account_no=" + account_no + ", name=" + name + ", balance=" + balance + ", pin=" + pin + "]";
	}


	
	
	

}
