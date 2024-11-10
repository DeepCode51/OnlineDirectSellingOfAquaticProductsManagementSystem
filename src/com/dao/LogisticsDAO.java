package com.dao;
import com.entity.*;

import java.util.*;
public interface LogisticsDAO {
	List<Logistics> selectAll(String orderno);
	void add(Logistics logistics);
	void delete(int id);
}
