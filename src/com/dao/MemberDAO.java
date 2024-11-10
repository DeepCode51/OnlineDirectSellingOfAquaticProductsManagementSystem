package com.dao;
import com.entity.*;

import java.util.*;
public interface MemberDAO {
	List<Member> selectOne(String uname,String upass);
	void add(Member member);
	List<Member> checkUname(String uname);
	Member findById(int id);
	void update(Member member);
	List<Member> selectAll();
	List<Member> selectMember(String key);
	void delete(int id);
	void updateLev(Member member);
}
