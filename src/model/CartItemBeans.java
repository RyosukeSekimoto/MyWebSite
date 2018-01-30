package model;

import java.io.Serializable;

public class CartItemBeans implements Serializable {

	private ItemDataBeans idb;
	private int quantity;

	public CartItemBeans() {}

	public ItemDataBeans getIdb() {
		return idb;
	}

	public void setIdb(ItemDataBeans idb) {
		this.idb = idb;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	};

}
