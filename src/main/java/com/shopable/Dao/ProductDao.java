package com.shopable.Dao;

import java.util.List;
import java.util.Map;

import com.shopable.model.Product;

public interface ProductDao {

	public List<Product> getAllProducts();
	 
	 public Product findProductById(int id);
}
