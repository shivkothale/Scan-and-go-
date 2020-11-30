package com.shopable.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Configuration;

import com.shopable.Dao.ProductDaoImpl;
import com.shopable.model.Product;

@Configuration
public class Cart {
	private int temp;
	private int total;
	private int quantity;
	
	
	public int addToTotal(int price) {
		this.total=this.total+price;		
		return total;
	}

	public int getTemp() {
		return temp;
	}

	public void setTemp(int temp) {
		this.temp = temp;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	

	/*public void addToCart(int id) {
		ProductDaoImpl p=new ProductDaoImpl();
		items.add(p.findProductById(id));
	}
	
	public void removeFromCart(int id) {
		for (int i = 0; i < items.size(); i++) {
			if (items.get(i).getP_id()==id) {
				items.remove(i);
				break;
			}
		}
	}*/
}
