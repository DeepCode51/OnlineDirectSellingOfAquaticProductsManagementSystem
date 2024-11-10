package com.controller;

import javax.annotation.Resource;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.math.BigDecimal;
import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.dao.*;
import com.entity.*;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.util.Info;

import java.util.*;

@Controller
public class MessageController extends BaseController {
	@Resource
	MessageDAO messageDAO;
	@Resource
	CartDAO cartDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	ProductDAO productDAO;
	@Resource
	CategoryDAO categoryDAO;
	
	//前台留言列表
	@RequestMapping("message_List")
	public String message_List(HttpServletRequest request){
		String msg = request.getParameter("msg");
		List<Message> list = messageDAO.selectAll();
		for(int i=0;i<list.size();i++){
			Member m = memberDAO.findById(list.get(i).getMemberid());
			list.get(i).setMember(m);
		}
		//商品类别
		List<Category> ctlist = categoryDAO.selectAll();
		//购物车
		Member member = (Member)request.getSession().getAttribute("sessionmember");
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
		request.setAttribute("ctlist", ctlist);
		request.setAttribute("list", list);
		return "messagelist";
	}
	
	
	//前台留言添加
	@RequestMapping("messageAdd")
	public String messageAdd(HttpServletRequest request){
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		String content = request.getParameter("content");
		if(member!=null){
			Message message = new Message();
			message.setContent(content);
			message.setMemberid(member.getId());
			message.setSavetime(Info.getDateStr());
			messageDAO.add(message);
			return "redirect:message_List.do";
		}else{
			return "login";
		}
	}
	
	//后台留言列表
	@RequestMapping("/admin/messageList")
	public String messageList(HttpServletRequest request) {
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Message> list = messageDAO.selectAll();
		for(int i=0;i<list.size();i++){
			Member m = memberDAO.findById(list.get(i).getMemberid());
			list.get(i).setMember(m);
		}
		request.setAttribute("list", list);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/messagelist";
	}
	
	//后台搜索留言
	@RequestMapping("/admin/searchMessage")
	public String searchMessage(String key, HttpServletRequest request) {
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Message> list = messageDAO.searchMessage(key);
		for(int i=0;i<list.size();i++){
			Member m = memberDAO.findById(list.get(i).getMemberid());
			list.get(i).setMember(m);
		}
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/messagesearchlist";
	}
	
	//留言回复
	@RequestMapping("/admin/updateMessage")
	public String updateMessage(Message message,HttpServletRequest request) {
		messageDAO.update(message);
		return "redirect:messageList.do";
	}
	
	//删除留言
	@RequestMapping("/admin/messageDel")
	public String updateMessage(int id,HttpServletRequest request) {
			messageDAO.delete(id);
		return "redirect:messageList.do";
	}

}
