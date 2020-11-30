package com.shopable.Dao;

import com.shopable.model.User;

public interface UserDao {
	public boolean create(User user);

	public User validateUser(User user);

	public User getWalletAmount(User user);
	
	public void updateWalletAmount(User user,int w);


}
