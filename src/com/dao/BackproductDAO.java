package com.dao;
import com.entity.*;

import java.util.*;
public interface BackproductDAO {
	void add(Backproduct backproduct);
	void delete(int id);
	void update(Backproduct backproduct);
	List<Backproduct> selectAll(HashMap map);
	Backproduct findById(int id);
}
