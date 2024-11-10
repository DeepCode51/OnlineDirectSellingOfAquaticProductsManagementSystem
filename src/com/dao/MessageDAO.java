package com.dao;
import com.entity.*;

import java.util.*;
public interface MessageDAO {
	void add(Message message);
	List<Message> selectAll();
	List<Message> searchMessage(String key);
	void update(Message message);
	void delete(int id);
}
