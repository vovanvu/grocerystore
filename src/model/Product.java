package model;

public class Product {
	private String productID;
	private String productName;
	private String price;
	private String Image;
	private String producerID;
	
	public Product(String productID, String productName, String price, String image, String producerID) {
		super();
		this.productID = productID;
		this.productName = productName;
		this.price = price;
		Image = image;
		this.producerID = producerID;
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}

	public String getProducerID() {
		return producerID;
	}

	public void setProducerID(String producerID) {
		this.producerID = producerID;
	}

}
