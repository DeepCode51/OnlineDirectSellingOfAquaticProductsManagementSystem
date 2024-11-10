package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.dao.*;
import com.entity.*;

@Controller
public class AboutController extends BaseController {
	@Resource
	AboutDAO aboutDAO;
	
	@RequestMapping("/admin/showAbout")
	public String showAbout(int id,HttpServletRequest request){
		String pagemsg = request.getParameter("pagemsg");
		About about =  aboutDAO.findById(id);
		request.setAttribute("about", about);
		request.setAttribute("pagemsg", pagemsg);
		return "admin/aboutedit";
	}
	
	@RequestMapping("/admin/aboutEdit")
	public String aboutEdit(About about,HttpServletRequest request){
		aboutDAO.update(about);
		return "redirect:showAbout.do?id=1";
	}
	
	
	
	
	

}
