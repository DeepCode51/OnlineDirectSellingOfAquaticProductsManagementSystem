package com.dao;
import com.entity.*;

import java.util.*;
public interface InventoryDAO {
	List<Inventory> selectInventory(int id);
	void add(Inventory inventory);
}
