package model;

public class Customer {
	private String customerID;
	private String customerName;
	private String userName;
	private String passWord;
	private String phoneNumber;

	public Customer(String customerID, String customerName, String userName, String passWord, String phoneNumber) {
		super();
		this.customerID = customerID;
		this.customerName = customerName;
		this.userName = userName;
		this.passWord = passWord;
		this.phoneNumber = phoneNumber;
	}

	public String getCustomerID() {
		return customerID;
	}

	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

}
