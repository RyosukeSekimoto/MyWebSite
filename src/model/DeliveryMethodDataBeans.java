package model;

import java.io.Serializable;

public class DeliveryMethodDataBeans implements Serializable {

	private int id;
	private String name;
	private int Price;

	public DeliveryMethodDataBeans() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return Price;
	}

	public void setPrice(int price) {
		Price = price;
	};

}
