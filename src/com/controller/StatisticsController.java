package com.controller;

import javax.annotation.Resource;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import java.io.File;
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
public class StatisticsController extends BaseController {
	@Resource
	ProductDAO productDAO;
	@Resource
	OrdermsgdetailsDAO ordermsgdetailsDAO;
	@Resource
	OrdermsgDAO ordermsgDAO;
	
	
	
	
	//销售量统计
	@RequestMapping("admin/saleProduct")
	public  String saleProduct(HttpServletRequest request) {
		String key = request.getParameter("key");
		String key1 = request.getParameter("key1");
		HashMap map = new HashMap();
		map.put("key", key);
		map.put("key1", key1);
		List<Product> plist = productDAO.selectProductAll(map);
		//ArrayList nslist = new ArrayList();
		ArrayList nlist = new ArrayList();
		ArrayList slist = new ArrayList();
		for(Product product:plist){
	        List<Ordermsgdetails> ordermsgdetailslist = ordermsgdetailsDAO.selectSale(product.getId());
	        int i =0;
	        nlist.add("'"+product.getProductname()+"'");
	        if(ordermsgdetailslist.size()==0){
	        slist.add(i);	
	        }else{
	        	for(Ordermsgdetails ordermsgdetails:ordermsgdetailslist){
	        		i+=ordermsgdetails.getNum();
	        	}
	        slist.add(i);
	        }
		}
		request.setAttribute("key", key);
		request.setAttribute("key1", key1);
		request.setAttribute("nlist", nlist);
		request.setAttribute("slist", slist);
		return "admin/tjsaleproduct";
	}
	
	
	//商品访问量
	@RequestMapping("admin/visitProduct")
	public  String visitProduct(HttpServletRequest request) {
		List<Product> plist = productDAO.selectAll();
		//ArrayList nslist = new ArrayList();
		ArrayList nlist = new ArrayList();
		ArrayList slist = new ArrayList();
		for(Product product:plist){
			nlist.add("'"+product.getProductname()+"'");
			slist.add(product.getLooknum());
		}
		request.setAttribute("nlist", nlist);
		request.setAttribute("slist", slist);
		return "admin/tjvisitproduct";
	}
	
	//点赞统计
	@RequestMapping("admin/voteProduct")
	public  String voteProduct(HttpServletRequest request) {
		List<Product> plist = productDAO.selectAll();
		//ArrayList nslist = new ArrayList();
		ArrayList nlist = new ArrayList();
		ArrayList slist = new ArrayList();
		for(Product product:plist){
			nlist.add("'"+product.getProductname()+"'");
			slist.add(product.getVote());
		}
		request.setAttribute("nlist", nlist);
		request.setAttribute("slist", slist);
		return "admin/tjvoteproduct";
	}
	
	
	//销售额
	@RequestMapping("admin/saleMoney")
	public  String saleMoney(HttpServletRequest request) {
		List<Ordermsg> olist = ordermsgDAO.selectSaleMoney();
		//ArrayList nslist = new ArrayList();
		ArrayList nlist = new ArrayList();
		ArrayList slist = new ArrayList();
		for(Ordermsg ordermsg:olist){
			nlist.add("'"+ordermsg.getSavetime()+"'");
			slist.add(ordermsg.getTotal());
		}
		request.setAttribute("nlist", nlist);
		request.setAttribute("slist", slist);
		return "admin/tjsalemoney";
	}
	
	//订单量
	@RequestMapping("admin/orderNum")
	public  String orderNum(HttpServletRequest request) {
		List<Ordermsg> olist = ordermsgDAO.orderNum();
		//ArrayList nslist = new ArrayList();
		ArrayList nlist = new ArrayList();
		ArrayList slist = new ArrayList();
		for(Ordermsg ordermsg:olist){
			nlist.add("'"+ordermsg.getSavetime()+"'");
			slist.add(ordermsg.getOrderno());
		}
//		System.out.println("nlist==="+nlist);
//		System.out.println("slist==="+slist);
		request.setAttribute("nlist", nlist);
		request.setAttribute("slist", slist);
		return "admin/tjordernum";
	}
	
	
	

}
