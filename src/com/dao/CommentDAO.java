package com.dao;
import com.entity.*;

import java.util.*;
public interface CommentDAO {
	void add(Comment comment);
	List<Comment> selectProduct(int productid);
	void delete(int id);
}
