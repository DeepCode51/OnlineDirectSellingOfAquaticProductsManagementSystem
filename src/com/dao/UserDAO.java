package com.dao;
import com.entity.*;

import java.util.*;
public interface UserDAO {
   User findById(int id);
   List<User> selectOne(User user);
   void update(User user);
   void updatepwd(int id,String userpassword);
   List<User> selectAll();
   void add(User user);
   List<User> usernamecheck(String username);
   List<User> searchUser(String key);
   void userEdit(User user);
   void deleteUser(int id);
}
