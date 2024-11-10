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
public class OrdermsgController extends BaseController {
	@Resource
	OrdermsgDAO ordermsgDAO;
	@Resource
	CartDAO cartDAO;
	@Resource
	MemberDAO memberDAO;
	@Resource
	ProductDAO productDAO;
	@Resource
	OrdermsgdetailsDAO ordermsgdetailsDAO;
	@Resource
	InventoryDAO inventoryDAO;
	@Resource
	CategoryDAO categoryDAO;
	@Resource
	MjDAO mjDAO;
	@Resource
	LogisticsDAO logisticsDAO;
	@Resource
	BackproductDAO backproductDAO;
	
	
	//创建订单
	@RequestMapping("creatOrder")
	public String creatOrder(HttpServletRequest request){
		//商品类别
		List<Category> ctlist = categoryDAO.selectAll();
		request.setAttribute("ctlist", ctlist);
		
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
		Member member = (Member)request.getSession().getAttribute("sessionmember");
			List<Cart> cartlist = cartDAO.selectMyProductList(member.getId());
			String orderno = Info.getOrderNo();
			String totalstr = "";
			double total = 0.0;
			for(int i=0;i<cartlist.size();i++){
				//添加订单详情信息
				Ordermsgdetails ordermsgdetails = new Ordermsgdetails();
				ordermsgdetails.setOrderno(orderno);
				ordermsgdetails.setProductid(cartlist.get(i).getProductid());
				ordermsgdetails.setNum(cartlist.get(i).getNum());
				ordermsgdetails.setMemberid(member.getId());
				ordermsgdetailsDAO.add(ordermsgdetails);
				
				//得到总价
				Member m = memberDAO.findById(cartlist.get(i).getMemberid());
				Product product = productDAO.findById(cartlist.get(i).getProductid());
				
				//存入会员价
				double plusprice = product.getPrice()*product.getDiscount();
				BigDecimal doubleplusprice = new BigDecimal(plusprice);
				plusprice = doubleplusprice.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
				product.setPlusprice(plusprice);
				
				cartlist.get(i).setMember(m);
				cartlist.get(i).setProduct(product);
				
				if(m.getLev().equals("普通用户")){
					total+=Double.parseDouble(String.valueOf(cartlist.get(i).getNum()))*product.getPrice();
					}else{
					total+=Double.parseDouble(String.valueOf(cartlist.get(i).getNum()))*product.getPlusprice();	
					}
				
				//删除购物车中的数据
				cartDAO.delCart(cartlist.get(i).getId());
			}
			//查看是否能满减
			//newtotaldouble=totaldouble;
//			Mj mj = mjDAO.findById(1);
//			if(total>=mj.getMmoney()){
//			total = total-mj.getJmoney();
//			}
			totalstr = String.format("%.2f", total);
			//添加订单
			Ordermsg ordermsg = new Ordermsg();
			ordermsg.setOrderno(orderno);
			ordermsg.setMemberid(member.getId());
			ordermsg.setTotal(totalstr);
			ordermsg.setName(name);
			ordermsg.setAddr(addr);
			ordermsg.setTel(tel);
			ordermsg.setFkstatus("待付款");
			ordermsgDAO.add(ordermsg);
		return "ordersuc";
		
	}
	
	//前台订单列表
	@RequestMapping("orderList")
	public String orderList(HttpServletRequest request){
		//商品类别
		List<Category> ctlist = categoryDAO.selectAll();
		request.setAttribute("ctlist", ctlist);
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
		
		
		List<Ordermsg> fklist = ordermsgDAO.selectPayment(member.getId());
		for(int a=0;a<fklist.size();a++ ){
			Member m = memberDAO.findById(fklist.get(a).getMemberid());
			fklist.get(a).setMember(m);
		}
		
		List<Ordermsg> fhlist = ordermsgDAO.selectFaHuo(member.getId());
		for(int i=0;i<fhlist.size();i++ ){
			Member m = memberDAO.findById(fhlist.get(i).getMemberid());
			fhlist.get(i).setMember(m);
		}
		
		List<Ordermsg> shlist = ordermsgDAO.selectShouhuo(member.getId());
		for(int b=0;b<shlist.size();b++ ){
			Member m = memberDAO.findById(shlist.get(b).getMemberid());
			shlist.get(b).setMember(m);
		}
		List<Ordermsg> wclist = ordermsgDAO.selectAccomplish(member.getId());
		for(int c=0;c<wclist.size();c++ ){
			Member m = memberDAO.findById(wclist.get(c).getMemberid());
			wclist.get(c).setMember(m);
		}
		request.setAttribute("fhlist", fhlist);
		request.setAttribute("fklist", fklist);
		request.setAttribute("shlist", shlist);
		request.setAttribute("wclist", wclist);
		
		//余额不足提示
		String msg = request.getParameter("msg")==null?"":request.getParameter("msg");
		if(msg.equals("msg")){
			request.setAttribute("suc", "余额不足");
		}
		return "orderlist";
		
	}
	
	//前台查看订单详情
	@RequestMapping("orderDetails")
	public String orderDetails(String orderno, HttpServletRequest request){
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		if(member!=null){
			List<Cart> cartlist = cartDAO.selectMyProductList(member.getId());
			String totalstr = "";
			double total = 0.0;
			for(int i=0;i<cartlist.size();i++){
				Member m = memberDAO.findById(cartlist.get(i).getMemberid());
				Product product = productDAO.findById(cartlist.get(i).getProductid());
				
				double plusprice = product.getPrice()*product.getDiscount();
				BigDecimal doubleplusprice = new BigDecimal(plusprice);
				plusprice = doubleplusprice.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
				product.setPlusprice(plusprice);
				
				cartlist.get(i).setMember(m);
				cartlist.get(i).setProduct(product);
				total+=Double.parseDouble(String.valueOf(cartlist.get(i).getNum()))*product.getPrice();
			}
			totalstr = String.format("%.2f", total);
			request.setAttribute("cartlist", cartlist);
			request.setAttribute("totalstr", totalstr);
		}
		
		List<Ordermsgdetails> list = ordermsgdetailsDAO.selectorderDetails(orderno);
		for(int a=0;a<list.size();a++ ){
			Product product = productDAO.findById(list.get(a).getProductid());
			//存入会员价
			double plusprice = product.getPrice()*product.getDiscount();
			BigDecimal doubleplusprice = new BigDecimal(plusprice);
			plusprice = doubleplusprice.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
			product.setPlusprice(plusprice);
			
			list.get(a).setProduct(product);
		}
		request.setAttribute("list", list);
		return "orderdetails";
		
	}
	
    //订单付款
	@RequestMapping("payOrder")
	public String payOrder(int id, HttpServletRequest request){
		Member member = (Member)request.getSession().getAttribute("sessionmember");
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
		
		Member mmm = (Member)memberDAO.findById(member.getId());
		Ordermsg ordermsg = (Ordermsg)ordermsgDAO.findById(id);
		double ddtotal = Double.parseDouble(ordermsg.getTotal());
		if(mmm.getYue()>=ddtotal){
			double yue = mmm.getYue()-ddtotal;
			mmm.setYue(yue);
			memberDAO.update(mmm);
			ordermsgDAO.payOrder(id);
			return "redirect:orderList.do";
		}else{
			return "redirect:orderList.do?msg=msg";
		}
		
		
	}
	
    //后台查询所有订单
	@RequestMapping("admin/orderList")
	public String adminorderList(HttpServletRequest request){
		String index = request.getParameter("index");
		String msg = request.getParameter("msg");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Ordermsg> list = ordermsgDAO.selectAll();
		for(int i=0;i<list.size();i++){
			Member m = memberDAO.findById(list.get(i).getMemberid());
			list.get(i).setMember(m);
		}
		if(msg!=null&&msg.equals("msg")){
			request.setAttribute("msg", "msg");
		}
		request.setAttribute("list", list);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/orderlist";
		
	}
	
	//后台查看订单详情
	@RequestMapping("admin/orderDetails")
	public String orderadminDetails(String orderno, HttpServletRequest request){
		String index = request.getParameter("index");
		String msg = request.getParameter("msg");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Ordermsgdetails> list = ordermsgdetailsDAO.selectorderDetails(orderno);
		for(int a=0;a<list.size();a++ ){
			Product product = productDAO.findById(list.get(a).getProductid());
			
			//存入会员价
			double plusprice = product.getPrice()*product.getDiscount();
			BigDecimal doubleplusprice = new BigDecimal(plusprice);
			plusprice = doubleplusprice.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
			product.setPlusprice(plusprice);
			
			list.get(a).setProduct(product);
		}
		request.setAttribute("list", list);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/orderdetails";
		
	}
	
	//后台查询订单信息
	@RequestMapping("admin/searchOrdername")
	public String searchOrdername(HttpServletRequest request){
		String index = request.getParameter("index");
		String orderno = request.getParameter("orderno");
	   	int pageindex = 1;
	   	if(index!=null){
	   		 pageindex = Integer.parseInt(index);
	   	}
   	    Page<Object> page = PageHelper.startPage(pageindex,6);
		List<Ordermsg> list = ordermsgDAO.searchOrdername(orderno);
		for(int i=0;i<list.size();i++){
			Member m = memberDAO.findById(list.get(i).getMemberid());
			list.get(i).setMember(m);
		}
		request.setAttribute("list", list);
		request.setAttribute("orderno", orderno);
		request.setAttribute("index", page.getPageNum());
		request.setAttribute("pages", page.getPages());
		request.setAttribute("total", page.getTotal());
		return "admin/ordersearchlist";
		
	}
	
	//后台删除订单
	@RequestMapping("admin/orderDelAll")
	public String orderDelAll(HttpServletRequest request){
		String vals = request.getParameter("vals");
		String[] val = vals.split(",");
		for(int i=0;i<val.length;i++){
			Ordermsg ordermsg  = ordermsgDAO.findById(Integer.parseInt(val[i]));
			List<Ordermsgdetails> detailslist = ordermsgdetailsDAO.selectorderDetails(ordermsg.getOrderno());
			for(Ordermsgdetails ordermsgdetails:detailslist ){
				ordermsgdetailsDAO.delete(ordermsgdetails.getId());
			}
			ordermsgDAO.delete(Integer.parseInt(val[i]));
		}
		return "admin/ordersearchlist";
		
	}
	
	//发货
	@RequestMapping("admin/faHuo")
	public String faHuo(int id,HttpServletRequest request){
		Ordermsg ordermsg = ordermsgDAO.findById(id);
		List<Ordermsgdetails> list = ordermsgdetailsDAO.selectorderDetails(ordermsg.getOrderno());
		
		boolean flag = true;
		for(Ordermsgdetails ordermsgdetails:list){
			int inventoryrecord = Info.getInventory(ordermsgdetails.getProductid());
			if(inventoryrecord<ordermsgdetails.getNum()){
				flag = false;
				break;
			}
		}
		if(flag==true){
			for(Ordermsgdetails omd:list){
				Inventory inv = new Inventory();
				inv.setNum(omd.getNum());
				inv.setType("out");
				inv.setProductid(String.valueOf( omd.getProductid()));
				inventoryDAO.add(inv);
			}
			ordermsgDAO.update(ordermsg);
			return "redirect:orderList.do";
		}else{
			return "redirect:orderList.do?msg=msg";
		}
		
	}
	
	//收货
	@RequestMapping("orderShouhuo")
	public String orderShouhuo(int id,HttpServletRequest request){
		ordermsgDAO.updateSh(id);
		Ordermsg ordermsg = ordermsgDAO.findById(id);
		List<Ordermsgdetails> list = ordermsgdetailsDAO.selectorderDetails(ordermsg.getOrderno());
		System.out.println("list=="+list.size());
		for(Ordermsgdetails od:list){
			od.setThstatus("可退货");
			ordermsgdetailsDAO.update(od);
		}
		return "redirect:orderList.do";
	}
	
	//跳转付款页面
	@RequestMapping("orderpay")
	public String orderpay(HttpServletRequest request){
		String id  = request.getParameter("id");
		String total  = request.getParameter("total");
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		//购物车
		if(member!=null){
			List<Cart> cartlist = cartDAO.selectMyProductList(member.getId());
			String totalstr = "";
			double dtotal = 0.0;
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
				dtotal+=Double.parseDouble(String.valueOf(cartlist.get(i).getNum()))*product.getPrice();
				}else{
				dtotal+=Double.parseDouble(String.valueOf(cartlist.get(i).getNum()))*product.getPlusprice();	
				}
			}
			totalstr = String.format("%.2f", dtotal);
			request.setAttribute("cartlist", cartlist);
			request.setAttribute("totalstr", totalstr);
		}
		
		//商品类别
		List<Category> ctlist = categoryDAO.selectAll();
		request.setAttribute("ctlist", ctlist);
		request.setAttribute("total", total);
		request.setAttribute("id", id);
		return "orderpay";
	}
	
	//后台删除订单
	@RequestMapping("admin/orderDel")
	public String orderDel(int id,HttpServletRequest request){
		Ordermsg ordermsg = (Ordermsg)ordermsgDAO.findById(id);
		ArrayList<Ordermsgdetails> list = (ArrayList<Ordermsgdetails>)ordermsgdetailsDAO.selectorderDetails(ordermsg.getOrderno());
		for(Ordermsgdetails ordermsgdetails:list){
			HashMap map = new HashMap();
			map.put("orderid", ordermsgdetails.getId());
			List<Backproduct> bglist = backproductDAO.selectAll(map);
			for(Backproduct backproduct:bglist){
				backproductDAO.delete(backproduct.getId());
			}
			ordermsgdetailsDAO.delete(ordermsgdetails.getId());
		}
		ArrayList<Logistics> llist = (ArrayList<Logistics>)logisticsDAO.selectAll(ordermsg.getOrderno());
		for(Logistics logistics:llist){
			logisticsDAO.delete(logistics.getId());
		}
		ordermsgDAO.delete(id);
		return "redirect:orderList.do";
		
	}

}
