package com.shopable.Dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.shopable.model.Cart;
import com.shopable.model.Product;
import com.shopable.model.ProductRowMapper;
import com.shopable.model.UserRowMapper;

@Configuration
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	private Cart c;

	@Override
	public List<Product> getAllProducts() {
		 String query = "SELECT * from product";
		  RowMapper<Product> rowMapper = new ProductRowMapper();
		  List<Product> list = jdbcTemplate.query(query, rowMapper);
		  return list;
		
	}

	@Override
	public Product findProductById(int id) {
		String query = "SELECT * FROM product WHERE p_id = ?";
		RowMapper<Product> rowMapper = new BeanPropertyRowMapper<Product>(Product.class);
		Product product= jdbcTemplate.queryForObject(query, rowMapper, id);
		return product;
	}

}
