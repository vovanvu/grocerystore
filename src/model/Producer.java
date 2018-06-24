package model;

public class Producer {
	private String producerID;
	private String producerName;
	private String address;

	public Producer(String producerID, String producerName, String address) {
		super();
		this.producerID = producerID;
		this.producerName = producerName;
		this.address = address;
	}

	public String getProducerID() {
		return producerID;
	}

	public void setProducerID(String producerID) {
		this.producerID = producerID;
	}

	public String getProducerName() {
		return producerName;
	}

	public void setProducerName(String producerName) {
		this.producerName = producerName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
