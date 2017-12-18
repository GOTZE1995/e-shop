package com.bear.cakeonline.cartiteam.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bear.cakeonline.cartiteam.service.CartiteamServiceImpl;
import com.bear.cakeonline.entity.Cake;
import com.bear.cakeonline.entity.Cartiteam;

@Controller
@RequestMapping("cartiteam")
public class CartiteamController {
	@Resource
	private CartiteamServiceImpl cartiteamServiceImpl;
	
	@RequestMapping("save")
	public String save(@RequestParam String cartid,@RequestParam String cakeid) {
		int count = 1;
		Cartiteam cartiteam = new Cartiteam();
		Cake cake = new Cake();
		cake.setId(Integer.parseInt(cakeid));
		cartiteam.setCartid(Integer.parseInt(cartid));
		cartiteam.setCake(cake);
		List<Cartiteam> list=this.cartiteamServiceImpl.listAll(cartid);
		for(Cartiteam ct:list) {
			if(cakeid.equals(""+ct.getCake().getId())) {
				count = ct.getCount() + 1;
				ct.setCount(count);
				cartiteamServiceImpl.updateCartiteam(ct);
				return "products";
			}	
		}
		cartiteam.setCount(count);
		cartiteamServiceImpl.saveCartiteam(cartiteam);
		return "products";
	}
	
	@RequestMapping("/show")
	public String show(HttpServletRequest request,Model model,@RequestParam String cartid) {
		int sum = 0;
		if("".equals(cartid))
			return "500";
		List<Cartiteam> cartlist=this.cartiteamServiceImpl.listAll(cartid);
		if(cartlist.size() == 0) {
			request.getSession().setAttribute("list",null);
		} else {
			for(Cartiteam ct:cartlist) {
				sum += ct.getCake().getDiscountprice() * ct.getCount();
			}
			request.getSession().setAttribute("list",cartlist);
		}
		model.addAttribute("sum",sum);
		return "checkout";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request,Model model,@RequestParam String cartid,@RequestParam int id) {
		Cartiteam cartiteam = this.cartiteamServiceImpl.listOne(id);
		if(cartiteam.getCount() > 1) {
			cartiteam.setCount(cartiteam.getCount()-1);
			this.cartiteamServiceImpl.updateCartiteam(cartiteam);
		}
		else {
			this.cartiteamServiceImpl.deleteCartiteam(id);
		}
		return show(request,model,cartid);
	}
}
