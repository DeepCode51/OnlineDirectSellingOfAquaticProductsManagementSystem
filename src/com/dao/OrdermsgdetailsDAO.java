package com.dao;
import com.entity.*;

import java.util.*;
public interface OrdermsgdetailsDAO {
	void add(Ordermsgdetails ordermsgdetails);
	List<Ordermsgdetails> selectorderDetails(String orderno);
	void delete(int id);
	List<Ordermsgdetails> selectOne(int productid,int memberid);
	List<Ordermsgdetails> selectSale(int prodcutid);
	void update(Ordermsgdetails ordermsgdetails);
	Ordermsgdetails findById(int id);
}
