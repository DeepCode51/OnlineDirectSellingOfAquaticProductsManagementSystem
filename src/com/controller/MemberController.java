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
public class MemberController extends BaseController {
	@Resource
	MemberDAO memberDAO;
	@Resource
	CartDAO cartDAO;
	@Resource
	ProductDAO productDAO;
	@Resource
	CategoryDAO categoryDAO;
	
	
	
	
	//登录
	@RequestMapping("Login")
	public String Login(String uname,String upass, HttpServletRequest request){
		List<Member> list = memberDAO.selectOne(uname,upass);
		if(list.size()==0){
			request.setAttribute("msg", "upasserr");
			return "login";
		}else{
			request.getSession().setAttribute("sessionmember", list.get(0));
			return "redirect:index.do";	
		}
	}
	
	//注册
	@RequestMapping("Register")
	public String Register(Member member, HttpServletRequest request){
		memberDAO.add(member);
		request.setAttribute("msg", "registersuc");
			return "login";
	}
	
	//检查用户名的唯一性
	@RequestMapping("checkUname")
	public void checkUname(String uname, HttpServletRequest request, HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			List<Member> list = memberDAO.checkUname(uname);
			if(list.size()==0){
				out.print(0);
			}else{
				out.print(1);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查找用户信息
	@RequestMapping("showMember")
	public String showMember(HttpServletRequest request){
		Member member  = (Member)request.getSession().getAttribute("sessionmember");
		
		//类别
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
		
		Member m = memberDAO.findById(member.getId());
		request.setAttribute("member", m);
		String msg = request.getParameter("msg")==null?"":request.getParameter("msg");
		if(msg.equals("suc")){
		request.setAttribute("suc", "编辑成功");
		}
			return "myinfo";
	}
	
	//修改个人信息
	@RequestMapping("memberinfoEidt")
	public String memberinfoEidt(Member member, HttpServletRequest request){
		memberDAO.update(member);
		return "redirect:showMember.do?msg=suc";
	}
	
	//退出
	@RequestMapping("Exit")
	public String Exit(HttpServletRequest request){
		request.getSession().removeAttribute("sessionmember");
		return "redirect:index.do";
	}
	
	
	//后台查询会员列表
	@RequestMapping("/admin/memberList")
	public String memberList(HttpServletRequest request) {
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Member> list = memberDAO.selectAll();
		request.setAttribute("list", list);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/memberlist";
	}
	
	@RequestMapping("/admin/searchMember")
	public String searchMember(String key, HttpServletRequest request) {
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Member> list = memberDAO.selectMember(key);
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/membersearchlist";
	}
	
	//删除会员
	@RequestMapping("admin/memberDelAll")
	public String memberDelAll(int id, HttpServletRequest request,HttpServletResponse response){
			memberDAO.delete(id);
		return "redirect:memberList.do";
	}
	
	//查找会员等级
	@RequestMapping("/admin/showLev")
	public String showLev( int id, HttpServletRequest request){
		Member m = memberDAO.findById(id);
		request.setAttribute("member", m);
			return "admin/showlev";
	}
	
	//提升等级
	@RequestMapping("/admin/levUpate")
	public String levUpate(Member member, HttpServletRequest request){
		memberDAO.updateLev(member);
		return "redirect:memberList.do";
	}
	
	//查看帐户余额
	@RequestMapping("yueMsg")
	public String yueMsg(HttpServletRequest request){
		Member mmm = (Member)request.getSession().getAttribute("sessionmember");
		//类别
		List<Category> ctlist = categoryDAO.selectAll();
		request.setAttribute("ctlist", ctlist);
		//购物车
		if(mmm!=null){
			List<Cart> cartlist = cartDAO.selectMyProductList(mmm.getId());
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
		
		
		Member member = (Member)memberDAO.findById(mmm.getId());
		request.setAttribute("member", member);
		return "yue";
	}
	
	//帐户充值
	@RequestMapping("chongzhi")
	public String yueMsg(Member member, HttpServletRequest request){
		
		Member mmm = (Member)memberDAO.findById(member.getId());
		double yue = member.getYue()+mmm.getYue();
		member.setYue(yue);
		memberDAO.update(member);
		return "redirect:yueMsg.do";
	}
	
	//查看会员等级
	@RequestMapping("buyLev")
	public String buyLev(HttpServletRequest request){
		Member mmm = (Member)request.getSession().getAttribute("sessionmember");
		//类别
		List<Category> ctlist = categoryDAO.selectAll();
		request.setAttribute("ctlist", ctlist);
		//购物车
		if(mmm!=null){
			List<Cart> cartlist = cartDAO.selectMyProductList(mmm.getId());
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
		
		
		
		Member member = (Member)memberDAO.findById(mmm.getId());
		request.setAttribute("member", member);
		request.getSession().setAttribute("sessionmember", member);
		
		//支付会员成功提示
		String msg = request.getParameter("msg")==null?"":request.getParameter("msg");
		if(msg.equals("msg")){
			request.setAttribute("suc", "支付成功");
		}
		if(msg.equals("err")){
			request.setAttribute("suc", "余额不足");
		}
		return "buylev";
	}
	
	//支付会员
	@RequestMapping("upLev")
	public String upLev(Member member, HttpServletRequest request){
		Member mmm = (Member)memberDAO.findById(member.getId());
		if(mmm.getYue()<100){
			request.setAttribute("member",mmm);
			return "redirect:buyLev.do?msg=err";
		}else{
			double yue = mmm.getYue()-100;
			member.setYue(yue);
			member.setLev("会员");
			memberDAO.update(member);
			return "redirect:buyLev.do?msg=msg";
		}
	}
	
	
}
