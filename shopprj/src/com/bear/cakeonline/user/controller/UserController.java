package com.bear.cakeonline.user.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bear.cakeonline.user.service.UserServiceImpl;
import com.bear.cakeonline.util.Page;
import com.bear.cakeonline.entity.User;

@Controller
@RequestMapping("user")
public class UserController {

	@Resource
	private UserServiceImpl userServiceImpl;
	
	@RequestMapping("/list")
	public String list(Model model,@RequestParam(required=false) String page){
		if(page == null)
			page = "1";
		List<User> list=this.userServiceImpl.bglist(Integer.parseInt(page));
		if(list.size() == 0) {
			model.addAttribute("userlist", null);
		} else {
			model.addAttribute("userlist", list);
			model.addAttribute("page", Integer.parseInt(page));
			model.addAttribute("totalpages", Page.totalpages);
		}
		return "bguser";
	}
	
	@RequestMapping("/save")
	public String save(Model model,@RequestParam String username,@RequestParam String password,@RequestParam String phone,@RequestParam String address) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setPhone(phone);
		user.setAddress(address);
		userServiceImpl.saveUser(user);
		model.addAttribute("information","注册成功！");
		return "account";
	}
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request,Model model,@RequestParam String username,@RequestParam String password,@RequestParam String phone,@RequestParam String address) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setPhone(phone);
		user.setAddress(address);
		if(userServiceImpl.updateUser(user)) {
			model.addAttribute("information","修改成功！请重新登录");
			request.getSession().removeAttribute("user");
			return "information";
		}else {
			model.addAttribute("information","修改失败！");
			return "information";
		}
	}
	
	@RequestMapping("/newpwd")
	public String newpwd(Model model,@RequestParam String username,@RequestParam String password,@RequestParam String phone,@RequestParam String address) {
		List<User> list=this.userServiceImpl.listAll();
		for(int i = 0;i < list.size();i++) {
			if(list.get(i).getUsername().equals(username) && list.get(i).getPhone().equals(phone) && list.get(i).getAddress().equals(address)) {
				User user = new User();
				user.setUsername(username);
				user.setPassword(password);
				user.setPhone(phone);
				user.setAddress(address);
				if(userServiceImpl.updateUser(user)) {
					model.addAttribute("information","修改成功！");
					return "password";
				}
			}
		}
		model.addAttribute("information","修改失败！");
		return "password";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request,Model model,@RequestParam String username,@RequestParam String password) {
		List<User> list=this.userServiceImpl.listAll();
		for(int i = 0;i < list.size();i++) {
			if(list.get(i).getUsername().equals(username) && list.get(i).getPassword().equals(password)) {
				request.getSession().setAttribute("user",list.get(i));
				break;
			}
		}
		model.addAttribute("fails","密码错误!");
		return "index";
	}
	
	@RequestMapping("/loginout")
	public String loginout(HttpServletRequest request) {
		request.getSession().removeAttribute("user");
		return "index";
	}
	
	@RequestMapping("/delete")
	public String delete(Model model,@RequestParam int id,@RequestParam String page) {
		userServiceImpl.deleteUser(id);
		return list(model,page);
	}
}
