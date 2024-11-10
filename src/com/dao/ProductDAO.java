package com.dao;
import com.entity.*;

import java.util.*;
public interface ProductDAO {
	List<Product> selectAll();
	void add(Product ct);
	Product findById(int id);
	void update(Product product);
	void delete(int id);
	List<Product> search(String key,String key1);
	List<Product> selectCorrelation(int id,String categoryid);
	List<Product> selectCategory(int categoryid);
	List<Product> selectProductname(String productname);
    void updateVote(Product product);
    List<Product> selectVote();
    void updateLooknum(Product product);
    List<Product> selectProductAll(HashMap map);
    void updateIsxs(Product product);
}
