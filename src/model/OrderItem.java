package model;

public class OrderItem {
	private String orderItemId;
	private String productID;
	private String quantity;
	private String orderId;

	public OrderItem(String orderItemId, String productID, String quantity, String orderId) {
		super();
		this.orderItemId = orderItemId;
		this.productID = productID;
		this.quantity = quantity;
		this.orderId = orderId;
	}

	public String getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(String orderItemId) {
		this.orderItemId = orderItemId;
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

}
