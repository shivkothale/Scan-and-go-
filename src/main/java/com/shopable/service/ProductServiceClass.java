package com.shopable.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopable.Dao.ProductDaoImpl;
import com.shopable.Dao.UserDaoImpl;
import com.shopable.model.Cart;
import com.shopable.model.Product;
import com.shopable.model.User;

@Service
public class ProductServiceClass {
	@Autowired
	ProductDaoImpl p;
	@Autowired
	UserDaoImpl uD;
	User u;

	private List<Product> items = new ArrayList<Product>();
	

	public List<Product> getItems() {
		return items;
	}

	public void setItems(List<Product> items) {
		this.items = items;
	}

	public void addToCart(int id, int quantity) {
		int flag=0;
		for (int i = 0; i < items.size(); i++) {
		if(items.get(i).getP_id()==id) {
			int q=items.get(i).getQuantity();
			int x=q+quantity;
			items.get(i).setQuantity(x);
			int total=x*items.get(i).getP_price();
			items.get(i).setTotal(total);
			flag=1;
		}
		}
		if(flag==0) {
		Product pr = p.findProductById(id);
		System.out.println("ssk");
		pr.setQuantity(quantity);
		int total = pr.getP_price() * pr.getQuantity();
		pr.setTotal(total);
		items.add(pr);}
	}

	public void deleteFromCart(int id) {
		for (int i = 0; i < items.size(); i++) {
			if (items.get(i).getP_id() == id) {
				int q=items.get(i).getQuantity();
				int x=q-1;
				if(x>0) {
				items.get(i).setQuantity(x);
				int total=x*items.get(i).getP_price();
				items.get(i).setTotal(total);}
				else {
					items.remove(i);
				}
			}
		}

	}
	public void checkout() {
		items.clear();
	}
	public void logout() {
		u.setUsername(null);
		u.setPassword(null);
		u.setW_amount(0);
		items.clear();
	}
	

	public void updateWalletAmount() {
		int w= u.getW_amount()-totalCartAmount();
		uD.updateWalletAmount(u, w);
		u=uD.validateUser(u);		
	}

	public boolean totalCheck() {
		if(u.getW_amount()>totalCartAmount())
			return true;
		else 
			return false;
	}

	public int totalCartAmount() {

		int total = 0;
		for (int i = 0; i < items.size(); i++) {
			total += (items.get(i).getTotal());
		}
		return total;

	}

	public boolean check(User user) {
		u = uD.validateUser(user);
		System.out.println(u.getW_amount());
		if (u == null)
			return false;
		else
			return true;
	}
	public List<Product> getAllProducts(){
		List<Product> list = new ArrayList<Product>();
		list=p.getAllProducts();
		return list;
	}
	

	public int getWalletAmount() {
		return u.getW_amount();
	}
}