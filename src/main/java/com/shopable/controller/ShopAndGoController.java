package com.shopable.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.shopable.Dao.ProductDaoImpl;
import com.shopable.Dao.UserDaoImpl;

import com.shopable.model.Product;
import com.shopable.model.User;
import com.shopable.service.ProductServiceClass;

@Controller
@SessionAttributes("user")
public class ShopAndGoController {
	@Autowired
	private UserDaoImpl userDaoImpl;
	@Autowired
	private ProductDaoImpl p;
	@Autowired
	private ProductServiceClass psc;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String landingPage(ModelMap m) {
		List<Product> ls = p.getAllProducts();
		m.put("menuList", ls);
		return "firstpage";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signUpPage() {
		return "signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signedUpPage(@ModelAttribute(value="userObj") User user,ModelMap m) {
		try {
		this.userDaoImpl.create(user);
		return "signin";}
		catch(Exception e) {
			m.put("msg","Username already exists");
			return "signup";
		}
	}

	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String signInpPage() {

		return "signin";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homePage(ModelMap m) {
		try {
		m.put("wallet", psc.getWalletAmount());
		List<Product> ls = p.getAllProducts();
		m.put("menuList", ls);
		return "home";}
		catch(Exception e) {
			return "signin";
		}
	}
	
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String validateUser(@ModelAttribute(value="userObj") User user, ModelMap m) {
		try {
			boolean auth = this.psc.check(user);
			if (auth) {
				m.put("wallet", psc.getWalletAmount());
				List<Product> ls = p.getAllProducts();
				m.put("menuList", ls);
				return "home";
			} else {
				return "signin";
			}
		} catch (Exception e) {
			m.put("error", "Invalid User!!!!!");
			return "signin";
		}

	}
	@RequestMapping(value = "/home/add", method = RequestMethod.GET)
	public String addToCart(@RequestParam String product_id, @RequestParam String quantity,ModelMap m) {
		try {
		int p_id = Integer.parseInt(product_id);
		int q = Integer.parseInt(quantity);
		if(q>0) {
		psc.addToCart(p_id, q);
		m.put("added","Item added to Cart!!!!!");}
		else {
			m.put("added","Quantity should be greater than 1");
		}
		m.put("wallet", psc.getWalletAmount());
		
		List<Product> ls = p.getAllProducts();
		m.put("menuList", ls);
		return "home";}
		catch(Exception e) {
			m.put("added","Invalid Product Id");
			m.put("wallet", psc.getWalletAmount());	
			List<Product> ls = p.getAllProducts();
			m.put("menuList", ls);
			return "home";
		}

	}
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(ModelMap m) {

		try {
			
			m.put("wallet", psc.getWalletAmount());
			List<Product> list = psc.getItems();
			m.put("totalPrice", psc.totalCartAmount());
			m.addAttribute("list", list);
			boolean check = psc.totalCheck();
			if (check) {
			} else {
				m.put("exceed", "Insufficient Balance");
			}
			return "cart";

		} catch (Exception e) {
			m.put("msg", "Invalid id");
			return "redirect:/cart";
		}

	}

	@RequestMapping(value = "/cart/remove", method = RequestMethod.GET)
	public String removeFromCart(@RequestParam String id, ModelMap m) {
		int product_id = Integer.parseInt(id);
		psc.deleteFromCart(product_id);
		m.put("removed", "Item removed from cart");
		m.put("wallet", psc.getWalletAmount());
		m.put("totalPrice", psc.totalCartAmount());
		m.addAttribute("list", psc.getItems());
		return "cart";
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkoutPage(ModelMap m) {
		List<Product> list = psc.getItems();
		m.addAttribute("list", list);
		m.put("totalPrice", psc.totalCartAmount());
		m.put("total", psc.totalCartAmount());
		return "checkout";
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.POST)
	public String pay(ModelMap m) {
		psc.updateWalletAmount();
		psc.checkout();
		m.put("wallet", psc.getWalletAmount());
		m.addAttribute("list", psc.getItems());
		return "success";
	}

	@RequestMapping(value = "/thankyou", method = RequestMethod.GET)
	public String logout() {

		try {
		psc.logout();
		return "thankyou";
		}catch(Exception e) {
			return "thankyou";
			
		}
	}

}
