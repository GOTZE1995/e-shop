package com.bear.cakeonline.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bear.cakeonline.entity.Admin;
import com.bear.cakeonline.admin.service.AdminServiceImpl;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Resource
	private AdminServiceImpl adminServiceImpl;
	
	@RequestMapping("/list")
	public String list(Model model){
		List<Admin> list=this.adminServiceImpl.listAll();
		model.addAttribute("adminlist", list);
		return "";
	}
	
	@RequestMapping("/save")
	public String save(@RequestParam String adminname,@RequestParam String password,@RequestParam String realname) {
		Admin admin = new Admin();
		admin.setAdminName(adminname);
		admin.setPassword(password);
		admin.setRealName(realname);
		adminServiceImpl.saveAdmin(admin);
		return "";
	}
	
	@RequestMapping("/update")
	public String update(@RequestParam String adminname,@RequestParam String password,@RequestParam String realname) {
		Admin admin = new Admin();
		admin.setAdminName(adminname);
		admin.setPassword(password);
		admin.setRealName(realname);
		adminServiceImpl.updateAdmin(admin);
		return "";
	}
	
	@RequestMapping("/login")
	public String login(Model model,HttpServletRequest request,@RequestParam String adminname,@RequestParam String password) {
		List<Admin> list=this.adminServiceImpl.listAll();
		for(Admin admin:list) {
			if(admin.getAdminName().equals(adminname) && admin.getPassword().equals(password)) {
				request.getSession().setAttribute("admin",admin);
				return "background";
			}
		}
		model.addAttribute("fails","√‹¬Î¥ÌŒÛ!");
		return "adminlogin";
	}
	
	@RequestMapping("/loginout")
	public String loginout(HttpServletRequest request) {
		request.getSession().removeAttribute("admin");
		return "adminlogin";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam int id) {
		adminServiceImpl.deleteAdmin(id);
		return "";
	}
}
