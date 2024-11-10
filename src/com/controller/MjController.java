package com.controller;

import javax.annotation.Resource;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.dao.*;
import com.entity.*;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import java.util.*;

@Controller
public class MjController extends BaseController {
	@Resource
	MjDAO mjDAO;
	
	@RequestMapping("/admin/showMj")
	public String showMj(int id,HttpServletRequest request){
		String msg = request.getParameter("msg");
		Mj mj =  mjDAO.findById(id);
		request.setAttribute("mj", mj);
		if(msg!=null&&!msg.equals("")){
		request.setAttribute("suc", "价格输入有误");
		}
		return "admin/mjedit";
	}
	
	@RequestMapping("/admin/mjEdit")
	public String mjEdit(Mj mj,HttpServletRequest request){
		String msg ="";
		if(mj.getJmoney()>mj.getMmoney()){
			msg="msg";
		}else{
			mjDAO.update(mj);	
		}
		return "redirect:showMj.do?id=1&msg="+msg;
	}
	
	
	
	
	

}
