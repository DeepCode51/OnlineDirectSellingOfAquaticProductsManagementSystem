package com.dao;
import com.entity.*;

import java.util.*;
public interface CartDAO {
	List<Cart> selectAll();
	List<Cart> selectMyProduct(int memberid,int productid);
	void add(Cart cart);
	void update(Cart cart);
	List<Cart> selectMyProductList(int memberid);
	void delCart(int id);
	void updateNum(Cart cart);
}
