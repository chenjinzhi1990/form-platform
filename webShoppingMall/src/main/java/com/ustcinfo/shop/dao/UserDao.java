package com.ustcinfo.shop.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ustcinfo.shop.entity.User;

@Repository("userDao")
public interface UserDao {
		
	public void saveUser(User user);
	public User  selectUser(String username);
	public User checkUser(@Param("username")String username,@Param("password")String password);
	
}
