package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.dao.*;
import com.entity.*;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;


@Controller
public class CartController extends BaseController {
	@Resource
	CartDAO cartDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	ProductDAO productDAO;
	@Resource
	CategoryDAO categoryDAO;
	@Resource
	MjDAO mjDAO;
	

	// 查询购车商品
	@RequestMapping("cartList")
	public String cartList(HttpServletRequest request) {
		//商品类别
		List<Category> ctlist = categoryDAO.selectAll();
		request.setAttribute("ctlist", ctlist);
		
		Member member = (Member) request.getSession().getAttribute(
				"sessionmember");
		String index = request.getParameter("index");
		int pageindex = 1;
		if (index != null) {
			pageindex = Integer.parseInt(index);
		}
		Page<Object> page = PageHelper.startPage(pageindex, 6);
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
				double doublesubtotal=0.0;
				if(m.getLev().equals("普通用户")){
				total+=Double.parseDouble(String.valueOf(cartlist.get(i).getNum()))*product.getPrice();
				doublesubtotal = Double.parseDouble(String.valueOf(cartlist.get(i).getNum()))*product.getPrice();
				}else{
				total+=Double.parseDouble(String.valueOf(cartlist.get(i).getNum()))*product.getPlusprice();	
			    doublesubtotal = Double.parseDouble(String.valueOf(cartlist.get(i).getNum()))*product.getPlusprice();
				}
				cartlist.get(i).setSubtotal(String.format("%.2f", doublesubtotal));
			}
			totalstr = String.format("%.2f", total);
			request.setAttribute("cartlist", cartlist);
			request.setAttribute("totalstr", totalstr);
		}
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "cartlist";
	}

	// 添加购物车
	@RequestMapping("addCart")
	public void addCart(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			Member member = (Member) request.getSession().getAttribute(
					"sessionmember");
			if (member != null) {
				String productid = request.getParameter("productid");
				List<Cart> list = cartDAO.selectMyProduct(member.getId(),
						Integer.parseInt(productid));
				if (list.size() == 0) {
					Cart cart = new Cart();
					cart.setMemberid(member.getId());
					cart.setProductid(Integer.parseInt(productid));
					cart.setNum(1);
					cartDAO.add(cart);
				} else {
					Cart ct = new Cart();
					ct.setId(list.get(0).getId());
					ct.setNum(list.get(0).getNum() + 1);
					cartDAO.update(ct);
				}
				out.print("1");
			} else {
				out.println("0");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 删除购物车中的商品
	@RequestMapping("delCart")
	public void delCart(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			String id = request.getParameter("id");
			cartDAO.delCart(Integer.parseInt(id));
			out.println("0");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//修改购物车
	@RequestMapping("EditNum")
	public void EditNum(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			String id = request.getParameter("id");
			String num = request.getParameter("num");
			Cart ct = new Cart();
			ct.setId(Integer.parseInt(id));
			ct.setNum(Integer.parseInt(num));
			cartDAO.updateNum(ct);
			out.println("0");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//结算
	@RequestMapping("accountCart")
	public String accountCart(String total, HttpServletRequest request){
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		//商品类别
		List<Category> ctlist = categoryDAO.selectAll();
		request.setAttribute("ctlist", ctlist);
		if(member!=null){
			List<Cart> cartlist = cartDAO.selectMyProductList(member.getId());
			String totalstr = "";
			String newtotalstr = "";
			double totaldouble = 0.0;
			double newtotaldouble = 0.0;
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
				//totaldouble+=Double.parseDouble(String.valueOf(cartlist.get(i).getNum()))*product.getPrice();
				if(m.getLev().equals("普通用户")){
					totaldouble+=Double.parseDouble(String.valueOf(cartlist.get(i).getNum()))*product.getPrice();
					}else{
						totaldouble+=Double.parseDouble(String.valueOf(cartlist.get(i).getNum()))*product.getPlusprice();	
					}
			}
			//查看是否能满减
			//newtotaldouble=totaldouble;
			Mj mj = mjDAO.findById(1);
			if(totaldouble>=mj.getMmoney()){
			newtotaldouble = totaldouble-mj.getJmoney();
			request.setAttribute("msg", "msg");
			}
			totalstr = String.format("%.2f", totaldouble);
			newtotalstr = String.format("%.2f", newtotaldouble);
			request.setAttribute("newtotalstr", newtotalstr);
			request.setAttribute("cartlist", cartlist);
			request.setAttribute("totalstr", totalstr);
		}
		return "creatorder";
	}

}
