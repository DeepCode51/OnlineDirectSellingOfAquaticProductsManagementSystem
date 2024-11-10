package com.dao;
import com.entity.*;

import java.util.*;
public interface FavDAO {
	List<Fav> selectMyProduct(int memberid,int productid);
	void add(Fav fav);
	List<Fav> selectAll(int memberid);
	void delete(int id);
}
