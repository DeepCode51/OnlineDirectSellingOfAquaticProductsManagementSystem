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
public class LogisticsController extends BaseController {
	@Resource
	LogisticsDAO logisticsDAO;
	@Resource
	OrdermsgDAO ordermsgDAO;
	
	//添加物流信息
	@RequestMapping("admin/logisticsAdd")
	public String newsAdd(Logistics logistics,HttpServletRequest request){
		logisticsDAO.add(logistics);
		if(logistics.getType().equals("目的地")){
			Ordermsg ordermsg = ordermsgDAO.searchOrdername(logistics.getOrderno()).get(0);
			ordermsgDAO.updateShsatus(ordermsg);
		}
		return "redirect:orderList.do";
	}
	
	
	//后台物流信息
	@RequestMapping("admin/wlinfoList")
	public String wlinfoList(HttpServletRequest request) {
		String index = request.getParameter("index");
		String orderno = request.getParameter("orderno");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Logistics> list = logisticsDAO.selectAll(orderno);
		request.setAttribute("list", list);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/logisticslist";
	}
	
	//前台物流信息
	@RequestMapping("wlMsg")
	public String wlMsg(HttpServletRequest request) {
		String orderno = request.getParameter("orderno");
		Ordermsg ordermsg = (Ordermsg)ordermsgDAO.searchOrdername(orderno).get(0);
		if(ordermsg.getShstatus().equals("")){
			request.setAttribute("st", "st");
		}
		List<Logistics> list = logisticsDAO.selectAll(orderno);
		request.setAttribute("list", list);
		return "wlinfo";
	}
	

}
