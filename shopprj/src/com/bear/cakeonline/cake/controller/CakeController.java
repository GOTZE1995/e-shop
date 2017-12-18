package com.bear.cakeonline.cake.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bear.cakeonline.cake.service.CakeServiceImpl;
import com.bear.cakeonline.entity.Cake;
import com.bear.cakeonline.entity.CakeType;
import com.bear.cakeonline.util.Page;

@Controller
@RequestMapping("cake")
public class CakeController {
	
	@Resource
	private CakeServiceImpl cakeServiceImpl;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request,@RequestParam(required=false) String page,@RequestParam(required=false) String value,
			@RequestParam(required=false) String price1,@RequestParam(required=false) String price2){
		HttpSession session = request.getSession();
		if(page == null)
			page = "1";
		List<Cake> list=this.cakeServiceImpl.listCake(Integer.parseInt(page),value,price1,price2);
		session.setAttribute("cakelist", list);
		session.setAttribute("page", Integer.parseInt(page));
		session.setAttribute("totalpages", Page.totalpages);
		session.setAttribute("value",value);
		session.setAttribute("price1",price1);
		session.setAttribute("price2",price2);
		return "products";
	}
	
	@RequestMapping("/bglist")
	public String bglist(Model model,@RequestParam(required=false) String page){
		if(page == null)
			page = "1";
		List<Cake> list=this.cakeServiceImpl.listCake(Integer.parseInt(page),null,null,null);
		model.addAttribute("cakelist", list);
		model.addAttribute("page", Integer.parseInt(page));
		model.addAttribute("totalpages", Page.totalpages);
		return "bgcake";
	}
	
	@RequestMapping("/single")
	public String single(Model model,@RequestParam int cakeid){
		Cake cake=this.cakeServiceImpl.single(cakeid);
		model.addAttribute("cake", cake);
		return "single";
	}
	
	@RequestMapping("/save")
	public String save(HttpServletRequest request,Model model,@RequestParam String name,@RequestParam String description, @RequestParam double price,@RequestParam double discountprice,
			@RequestParam MultipartFile listimg,@RequestParam MultipartFile img1,@RequestParam MultipartFile img2,@RequestParam MultipartFile img3,@RequestParam int cakeType) throws IOException{
		Date cakedate = new Date();
		Cake cake = new Cake();
		CakeType ct = new CakeType();
		ct.setId(cakeType);
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath("/static/images");
		if (listimg != null) {
			String filename = listimg.getOriginalFilename();
			File file = new File(realPath + "/" + filename);
			cake.setListimg(filename);
			byte[] bytes = listimg.getBytes();
			FileOutputStream fos = new FileOutputStream(file);
			fos.write(bytes);
			fos.flush();
			fos.close();
		}
		if (img1 != null) {
			String filename = img1.getOriginalFilename();
			File file = new File(realPath + "/" + filename);
			cake.setImg1(filename);
			byte[] bytes = img1.getBytes();
			FileOutputStream fos = new FileOutputStream(file);
			fos.write(bytes);
			fos.flush();
			fos.close();
		}
		if (img2 != null) {
			String filename = img2.getOriginalFilename();
			File file = new File(realPath + "/" + filename);
			cake.setImg2(filename);
			byte[] bytes = img2.getBytes();
			FileOutputStream fos = new FileOutputStream(file);
			fos.write(bytes);
			fos.flush();
			fos.close();
		}
		if (img3 != null) {
			String filename = img3.getOriginalFilename();
			File file = new File(realPath + "/" + filename);
			cake.setImg3(filename);
			byte[] bytes = img3.getBytes();
			FileOutputStream fos = new FileOutputStream(file);
			fos.write(bytes);
			fos.flush();
			fos.close();
		}
		cake.setName(name);
		cake.setDescription(description);
		cake.setPrice(price);
		cake.setDiscountprice(discountprice);
		cake.setCakedate(cakedate);
		cake.setCakeType(ct);
		this.cakeServiceImpl.saveCake(cake);
		return bglist(model,"1");
	}
	
	@RequestMapping("/update")
	public String update(Model model,@RequestParam int id,@RequestParam(required=false) String name,@RequestParam(required=false) String description,
			@RequestParam double price,@RequestParam double discountprice){
		Cake c = this.cakeServiceImpl.single(id);
		Cake cake = new Cake();
		cake.setId(id);
		if(name.equals(null))
			cake.setName(c.getName());
		else
			cake.setName(name);
		if(description.equals(null))
			cake.setDescription(c.getDescription());
		else
			cake.setDescription(description);
		
		cake.setPrice(price);
		cake.setDiscountprice(discountprice);
		this.cakeServiceImpl.updateCake(cake);
		return bglist(model,"1");
	}
	
	@RequestMapping("/delete")
	public String delete(Model model,@RequestParam int id,@RequestParam String page) {
		this.cakeServiceImpl.deleteCake(id);
		return bglist(model,page);
	}
}
