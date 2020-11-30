package com.shopable.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.shopable.model.User;
import com.shopable.model.UserRowMapper;

@Configuration
public class UserDaoImpl implements UserDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public boolean create(User user) {

		String sql = "INSERT INTO USER (username,password,email,mobile) VALUES (?,?,?,?)";
		jdbcTemplate.update(sql, user.getUsername(), user.getPassword(), user.getEmail(), user.getMobile());
		return true;

	}

	@Override
	public User validateUser(User user) {

		String sql = "SELECT * FROM USER WHERE username=? AND password=?";
		User dbuser = jdbcTemplate.queryForObject(sql, new Object[] { user.getUsername(), user.getPassword() },
				new UserRowMapper());
		System.out.println();
		return dbuser;
	}

	@Override
	public User getWalletAmount(User user) {
		String query="SELECT wallet FROM USER WHERE username=? AND password=?";
		User u=jdbcTemplate.queryForObject(query, new Object[] { user.getUsername(), user.getPassword() },
				new UserRowMapper());
		System.out.println(u.getW_amount());
		return u;
	}

	@Override
	public void updateWalletAmount(User user,int w) {
		String query="UPDATE USER SET wallet=? WHERE username=? AND password=?";
		jdbcTemplate.update(query,w,user.getUsername(),user.getPassword());
	}


}
