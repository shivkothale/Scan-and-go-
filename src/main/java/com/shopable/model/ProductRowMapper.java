package com.shopable.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;

public class ProductRowMapper implements RowMapper<Product> {

	@Override
	public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		Product product=new Product();
		product.setP_id(rs.getInt("p_id"));
		product.setP_name(rs.getString("p_name"));
		product.setP_price(rs.getInt("p_price"));
		product.setP_desc(rs.getString("p_desc"));
		product.setP_category(rs.getString("p_category"));
		
		return product;
	}

}
