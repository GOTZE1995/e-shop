package com.bear.cakeonline.order.controller;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bear.cakeonline.order.service.OrderServiceImpl;
import com.bear.cakeonline.util.Page;
import com.bear.cakeonline.entity.Cartiteam;
import com.bear.cakeonline.entity.Order;
import com.bear.cakeonline.entity.OrderDetail;
import com.bear.cakeonline.entity.User;

@Controller
@RequestMapping("order")
public class OrderController {
	@Resource
	private OrderServiceImpl orderServiceImpl;
	
	@RequestMapping("/list")
	public String list(Model model,@RequestParam(required=false) String page){
		if(page == null)
			page = "1";
		List<Order> list=this.orderServiceImpl.listAll(Integer.parseInt(page));
		if(list.size() == 0) {
			model.addAttribute("orderlist", null);
		} else {
			model.addAttribute("orderlist", list);
			model.addAttribute("page", Integer.parseInt(page));
			model.addAttribute("totalpages", Page.totalpages);
		}
		return "bgorder";
	}
	
	@RequestMapping("/detaillist")
	public String detaillist(Model model,@RequestParam int id){
		Set<OrderDetail> list=this.orderServiceImpl.find(id);
		if(list.size() == 0)
			model.addAttribute("detaillist", null);
		else
			model.addAttribute("detaillist", list);
		return "bgorderdetail";
	}
	
	@RequestMapping("/show")
	public String orderlist(Model model,@RequestParam int userid){
		if("".equals("" + userid))
			return "500";
		List<Order> list=this.orderServiceImpl.list(userid);
		if(list.size() == 0)
			model.addAttribute("orderlist", null);
		else
			model.addAttribute("orderlist", list);
		return "order";
	}
	
	@RequestMapping("/save")
	public String save(HttpServletRequest request,Model model,@RequestParam int userid){
		HttpSession session = request.getSession();
		Order order = new Order();
		Date date = new Date();
		order.setOdate(date);
		order.setStatus(0);
		order.setUser((User)session.getAttribute("user"));
		this.orderServiceImpl.saveOrder(order);
		List<Cartiteam> cartlist = (List<Cartiteam>) session.getAttribute("list");
		for(Cartiteam ct:cartlist) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setCake(ct.getCake());
			orderDetail.setCount(ct.getCount());
			orderDetail.setOrder(order);
			this.orderServiceImpl.saveOrderDetail(orderDetail);
			this.orderServiceImpl.deleteCart(ct.getId());
		}
		model.addAttribute("order","下单成功！");
		return "checkout";
	}
	
	@RequestMapping("/update")
	public String update(Model model,@RequestParam int orderid,@RequestParam int userid){
		Order order = new Order();
		order.setId(orderid);
		order.setStatus(2);
		this.orderServiceImpl.updateOrder(order);
		return orderlist(model,userid);
	}
	
	@RequestMapping("/bgupdate")
	public String bgupdate(Model model,@RequestParam int orderid,@RequestParam String page){
		Order order = new Order();
		order.setId(orderid);
		order.setStatus(1);
		this.orderServiceImpl.updateOrder(order);
		return list(model,page);
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam int id) {
		this.orderServiceImpl.deleteOrder(id);
		return "";
	}
}
