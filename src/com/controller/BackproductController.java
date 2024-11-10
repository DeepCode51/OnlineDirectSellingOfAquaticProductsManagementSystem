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


@Controller
public class BackproductController extends BaseController {
	@Resource
	NewsDAO newsDAO;
	@Resource
	CategoryDAO categoryDAO;
	@Resource
	CartDAO cartDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	ProductDAO productDAO;
	@Resource
	BackproductDAO backproductDAO;
	@Resource
	OrdermsgdetailsDAO ordermsgdetailsDAO;
	@Resource
	InventoryDAO inventoryDAO;
	
	
	
	
	//后台查询退货列表
	@RequestMapping("/admin/backproductList")
	public String backproductList(HttpServletRequest request) {
		String index = request.getParameter("index");
		String key = request.getParameter("key");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
   	    HashMap map = new HashMap();
   	    map.put("key", key);
		List<Backproduct> list = backproductDAO.selectAll(map);
		for(Backproduct backproduct:list){
			Ordermsgdetails ordermsgdetails = ordermsgdetailsDAO.findById(backproduct.getOrderid());
			Product product = productDAO.findById(backproduct.getProductid());
			Member member = memberDAO.findById(backproduct.getMemberid());
			backproduct.setOrdermsgdetails(ordermsgdetails);
			backproduct.setProduct(product);
			backproduct.setMember(member);
		}
		request.setAttribute("list", list);
		request.setAttribute("key", key);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/backproductlist";
	}
	
	//前台查询退货列表
	@RequestMapping("listbackproduct")
	public String listbackproduct(HttpServletRequest request) {
		//商品类别
		List<Category> ctlist = categoryDAO.selectAll();
		request.setAttribute("ctlist", ctlist);
		String index = request.getParameter("index");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
	   	
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
			
			Page<Object> page = PageHelper.startPage(pageindex,6);
	   	    HashMap map = new HashMap();
		    map.put("memberid", member.getId());
			List<Backproduct> list = backproductDAO.selectAll(map);
			request.setAttribute("list", list);
			request.setAttribute("index", page.getPageNum());
			request.setAttribute("pages", page.getPages());
			request.setAttribute("total", page.getTotal());
			return "backproductlist";
		}else{
			return "login";
		}
	   	
	}
	
	
	
	
	//添加退货 
	@RequestMapping("backproductAdd")
	public String backproductAdd(HttpServletRequest request){
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		if(member!=null){
		String orderid = request.getParameter("orderid");
		String content = request.getParameter("content");
		Ordermsgdetails od = ordermsgdetailsDAO.findById(Integer.parseInt(orderid));
		Backproduct backproduct = new Backproduct();
		backproduct.setMemberid(member.getId());
		backproduct.setProductid(od.getProductid());
		backproduct.setSavetime(Info.getDateStr());
		backproduct.setContent(content);
		backproduct.setOrderid(Integer.parseInt(orderid));
		backproduct.setShstatus("待审核");
		backproductDAO.add(backproduct);
		
		od.setThstatus("已提交退货申请");
		ordermsgdetailsDAO.update(od);
		request.setAttribute("suc", "suc");
		
		return "backproductadd";
		}else{
			return "login";
		}
	}
	
	//退货
	@RequestMapping("admin/updatebacksh")
	public String updatebacksh(Backproduct backproduct, HttpServletRequest request){
		String type = request.getParameter("type")==null?"":request.getParameter("type");
		Backproduct bg = backproductDAO.findById(backproduct.getId());
		Product product = productDAO.findById(bg.getProductid());
		Ordermsgdetails ordermsgdetails = ordermsgdetailsDAO.findById(bg.getOrderid());
		Member member = memberDAO.findById(bg.getMemberid());
		if(type.equals("ty")){
			Inventory inventory = new Inventory();
			inventory.setNum(ordermsgdetails.getNum());
			inventory.setProductid(String.valueOf(bg.getProductid()));
			inventory.setType("in");
			inventoryDAO.add(inventory);
			
			//计算退还款
			double plusprice = product.getPrice()*product.getDiscount()*ordermsgdetails.getNum();
			BigDecimal doubleplusprice = new BigDecimal(plusprice);
			plusprice = doubleplusprice.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
			
			member.setYue(member.getYue()+plusprice);
			memberDAO.update(member);
			
			bg.setShstatus("已退货");
			backproductDAO.update(bg);
			ordermsgdetails.setThstatus("已退货");
			ordermsgdetailsDAO.update(ordermsgdetails);
		}else{
			ordermsgdetails.setThstatus("拒绝退货");
			backproductDAO.update(backproduct);
		}
		return "redirect:backproductList.do";
	}
	
	//删除退货
	@RequestMapping("admin/backproductDel")
	public String backproductDel(int id, HttpServletRequest request,HttpServletResponse response){
			backproductDAO.delete(id);
		return "redirect:backproductList.do";
	}
	
	
	
	

}
