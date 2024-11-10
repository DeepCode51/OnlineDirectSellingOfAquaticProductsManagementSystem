package com.controller;

import javax.annotation.Resource;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.dao.*;
import com.entity.*;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;


@Controller
public class UserController extends BaseController {
	@Resource
	UserDAO userDAO;
	@RequestMapping("/admin/login")
	public String login(User user ,HttpServletRequest request) {
		    List<User> list = userDAO.selectOne(user);
		    if(list.size()==0){
		    	request.setAttribute("error", "用户名或密码错误");
		    	return "admin/login";
		    }else{
		    	request.getSession().setAttribute("admin", list.get(0));
		    	return "redirect:index.do";
		    }

	}
	
	@RequestMapping("/admin/grInfo")
	public String findById(HttpServletRequest request){
		User u = (User)request.getSession().getAttribute("admin");
		User user = userDAO.findById(u.getId());
		request.setAttribute("user", user);
		
		String suc = request.getParameter("suc");
		if(suc!=null){
			request.setAttribute("suc", "编辑成功");
		}
		return "admin/grinfo";
	}
	
	@RequestMapping("/admin/updateGrinfo")
	public String update(User u, HttpServletRequest request){
		userDAO.update(u);
		return "redirect:grInfo.do?suc=suc";
	}
	
	@RequestMapping("/admin/updatepwd")
	public String updatepwd(int id,String userpassword, HttpServletRequest request) {
		String oldpassword = request.getParameter("oldpassword");
		User user = userDAO.findById(id);
		if(oldpassword.equals(user.getUserpassword())){
			userDAO.updatepwd(id,userpassword);
			request.setAttribute("suc", "操作成功");
		}else{
			request.setAttribute("error", "原密码错误");
		}
		return "admin/updatepwd";
	}
	
	@RequestMapping("/admin/userList")
	public String selectAll(HttpServletRequest request){
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<User> list = userDAO.selectAll();
		request.setAttribute("list", list);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/userlist";
	}
	
	@RequestMapping("/admin/searchUser")
	public String searchUser(HttpServletRequest request){
		String index = request.getParameter("index");
		String key = request.getParameter("key");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<User> list = userDAO.searchUser(key);
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/searchuserlist";
	}
	
	@RequestMapping("admin/userAdd")
	public String userAdd(User user, HttpServletRequest request){
		userDAO.add(user);
		return "redirect:userList.do";
	}
	
	@RequestMapping("/admin/usernameCheck")
	public String usernameCheck(String username, HttpServletRequest request,HttpServletResponse response){
   	 try {
			PrintWriter out =  response.getWriter();
			List<User> list = userDAO.usernamecheck(username);
	    	 if(list.size()==0){
	    		 out.write("0");
	    	 }else{
	    		 out.write("1");
	    	 }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   	 return null;
    }
	
	
	@RequestMapping("/admin/showUser")
	public String showUser(int id, HttpServletRequest request){
		User user = userDAO.findById(id);
		request.setAttribute("user", user);
		return "admin/useredit";
	}
	
	@RequestMapping("/admin/userEdit")
	public String userEdit(User u, HttpServletRequest request){
		userDAO.userEdit(u);
		return "redirect:userList.do";
	}
	
	@RequestMapping("/admin/userDelAll")
	public String userDelAll(HttpServletRequest request,HttpServletResponse response){
		String vals = request.getParameter("vals");
		String[] val = vals.split(",");
		for(int i=0;i<val.length;i++){
			userDAO.deleteUser(Integer.parseInt(val[i]));
		}
		return "redirect:userList.do";
	}
	
	

}
