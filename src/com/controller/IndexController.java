package com.controller;

import javax.annotation.Resource;


import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.dao.*;
import com.entity.*;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;


@Controller
public class IndexController extends BaseController {
	@Resource
	ProductDAO productDAO;
	@Resource
	CategoryDAO categoryDAO;
	@Resource
	PictureDAO pictureDAO;
	@Resource
	NewsDAO newsDAO;
	@Resource
	AboutDAO aboutDAO;
	@Resource
	CartDAO cartDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	OrdermsgDAO ordermsgDAO;
	
	
	
	@RequestMapping("index")
	public  String index(HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		List<Product> ptlist = productDAO.selectAll();
		List<Category> ctlist = categoryDAO.selectAll();
		List<Picture> pclist = pictureDAO.selectAll();
		List<News> newslist = newsDAO.selectAll();
		About about = aboutDAO.findById(1);
		
		//购物车
		if(member!=null){
			List<Cart> cartlist = cartDAO.selectMyProductList(member.getId());
			String totalstr = "";
			double total = 0.0;
			for(int i=0;i<cartlist.size();i++){
				Member m = memberDAO.findById(cartlist.get(i).getMemberid());
				Product product = productDAO.findById(cartlist.get(i).getProductid());
				//存入会员价
				double plusprice = product.getPrice()*product.getDiscount();
				BigDecimal doubleplusprice = new BigDecimal(plusprice);
				plusprice = doubleplusprice.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
				product.setPlusprice(plusprice);
				
				cartlist.get(i).setMember(m);
				cartlist.get(i).setProduct(product);
				
				//是否为会员算会员价
				if(m.getLev().equals("普通用户")){
				total+=Double.parseDouble(String.valueOf(cartlist.get(i).getNum()))*product.getPrice();
				}else{
				total+=Double.parseDouble(String.valueOf(cartlist.get(i).getNum()))*product.getPlusprice();	
				}
			}
			totalstr = String.format("%.2f", total);
			request.setAttribute("cartlist", cartlist);
			request.setAttribute("totalstr", totalstr);
		}
		
		//其它
		request.setAttribute("about", about);
		request.setAttribute("newslist", newslist);
		request.setAttribute("pclist", pclist);
		request.setAttribute("ptlist", ptlist);
		request.setAttribute("ctlist", ctlist);
		System.out.println();
		return "index";
	}
	
	//后台index
	@RequestMapping("admin/index")
	public  String adminIndex(HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		List<Member> mblist = memberDAO.selectAll();
		List<News> newslist = newsDAO.selectAll();
		List<Ordermsg> ddlist = ordermsgDAO.selectAll();
		List<Ordermsg> orderlist = ordermsgDAO.selectFkorder();
		double total =0.0;
		for(Ordermsg ordermsg:orderlist){
			total +=Double.parseDouble(ordermsg.getTotal());
		}
		
		BigDecimal doubleplusprice = new BigDecimal(total);
		total = doubleplusprice.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
		
		
		
		//其它
		request.setAttribute("ddlist", ddlist);
		request.setAttribute("total", total);
		request.setAttribute("newslist", newslist);
		request.setAttribute("mblist", mblist);
		System.out.println();
		return "admin/index";
	}
	
	//商品搜索
	@RequestMapping("searchProductname")
	public  String searchProductname(String productname, HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		List<Category> ctlist = categoryDAO.selectAll();
		request.setAttribute("ctlist", ctlist);
		
		//购物车
		if(member!=null){
			List<Cart> cartlist = cartDAO.selectMyProductList(member.getId());
			String totalstr = "";
			double total = 0.0;
			for(int i=0;i<cartlist.size();i++){
				Member m = memberDAO.findById(cartlist.get(i).getMemberid());
				Product product = productDAO.findById(cartlist.get(i).getProductid());
				cartlist.get(i).setMember(m);
				cartlist.get(i).setProduct(product);
				total+=Double.parseDouble(String.valueOf(cartlist.get(i).getNum()))*product.getPrice();
			}
			totalstr = String.format("%.2f", total);
			request.setAttribute("cartlist", cartlist);
			request.setAttribute("totalstr", totalstr);
		}
		
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Product> list = productDAO.selectProductname(productname);
		request.setAttribute("list", list);
		request.setAttribute("productname", productname);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "searchproductname";
		
	}
	
	

}
