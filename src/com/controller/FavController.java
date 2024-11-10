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
public class FavController extends BaseController {
	@Resource
	FavDAO favDAO;
	@Resource
	CartDAO cartDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	ProductDAO productDAO;
	@Resource
	CategoryDAO categoryDAO;
	
	// 添加到收藏夹
	@RequestMapping("addFav")
	public void addFav(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			Member member = (Member) request.getSession().getAttribute(
					"sessionmember");
			if (member != null) {
				String productid = request.getParameter("productid");
				List<Fav> list = favDAO.selectMyProduct(member.getId(),Integer.parseInt(productid));
				if (list.size() == 0) {
					Fav fav = new Fav();
					fav.setMemberid(member.getId());
					fav.setProductid(Integer.parseInt(productid));
					favDAO.add(fav);
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
	
	//查询收藏夹里的商品
	@RequestMapping("favList")
	public String favList(HttpServletRequest request) {
		List<Category> ctlist = categoryDAO.selectAll();
		request.setAttribute("ctlist", ctlist);
			Member member = (Member) request.getSession().getAttribute(
					"sessionmember");
			if (member != null) {
				List<Fav> list = favDAO.selectAll(member.getId());
				for(int a = 0;a<list.size();a++){
					Product pt = productDAO.findById(list.get(a).getProductid());
					list.get(a).setProduct(pt);
				}
				//查询购物车
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
				
				request.setAttribute("list", list);
				return "favlist";
			}else{
				return "login";
			}
	}
	
	//移出收藏夹
	@RequestMapping("delFav")
	public void delFav(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
				String id = request.getParameter("id");
				favDAO.delete(Integer.parseInt(id));
				out.print("1");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
