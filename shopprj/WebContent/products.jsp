<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextpath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Products</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="${contextpath }/static/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="${contextpath }/static/css/style.css" type="text/css" rel="stylesheet" media="all">
<link href="${contextpath }/static/css/form.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="${contextpath }/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextpath }/static/js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->	
<!-- cart -->
<script src="${contextpath }/static/js/simpleCart.min.js"> </script>
<!-- cart -->
<!-- the jScrollPane script -->
<script type="text/javascript" src="${contextpath }/static/js/jquery.jscrollpane.min.js"></script>
		<script type="text/javascript" id="sourcecode">
			$(function()
			{
				$('.scroll-pane').jScrollPane();
			});
		</script>
<!-- //the jScrollPane script -->
<script type="text/javascript" src="${contextpath }/static/js/jquery.mousewheel.js"></script>
<!-- the mousewheel plugin -->		
</head>
<body>
	<!--header-->
	<div class="header">
		<div class="container">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<h1 class="navbar-brand"><a  href="${contextpath }/index.jsp">Yummy</a></h1>
				</div>
				<!--navbar-header-->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="${contextpath }/index.jsp" class="active">首页</a></li>
						<li class="dropdown">
							<a href="${contextpath }/cake/list.do?value=蛋糕" class="dropdown-toggle">蛋糕</a>
						</li>
					   <li class="dropdown grid">
							<a href="${contextpath }/cake/list.do?value=果冻" class="dropdown-toggle list1">果冻</a>
						</li>				
						<li class="dropdown grid">
							<a href="${contextpath }/cake/list.do?value=鲜花" class="dropdown-toggle list1">鲜花</a>
					<!--/.navbar-collapse-->
				</div>
				<!--//navbar-header-->
			</nav>
			<div class="header-info">
				<div class="header-right search-box">
					<a href="#"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>				
					<div class="search">
						<form class="navbar-form" action="${contextpath }/cake/list.do">
							<input type="text" class="form-control" name="value" >
							<button type="submit" class="btn btn-default" aria-label="Left Align">
								搜索
							</button>
						</form>
					</div>	
				</div>
				<div class="header-right login">
					<a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
					<div id="loginBox">        
						<c:if test="${user.username != null }">
							<form id="loginForm">
							<br>
							<h3>欢迎您，<a class="sign" href="#">${user.username }</a>！<span><a href="${contextpath }/user/loginout.do">注销</a></span></h3>
							<br>
							<h4><span><a href="${contextpath }/information.jsp">修改个人信息</a></span></h4>
							</form>
						</c:if>
						<c:if test="${user.username == null }">
							<form id="loginForm" action="${contextpath }/user/login.do" method="post">
								<fieldset id="body">
								<h4>${fails }</h4>
									<fieldset>
										<label for="email">用户名</label>
										<input type="text" name="username" id="email">
									</fieldset>
									<fieldset>
										<label for="password">密码</label>
										<input type="password" name="password" id="password">
									</fieldset>
									<input type="submit" id="login" value="登录">
									<label for="checkbox"><input type="checkbox" id="checkbox"> <i>记住我</i></label>
								</fieldset>
								<p>新用户 ? <a class="sign" href="${contextpath }/account.jsp">注册</a> <span><a class="sign" href="${contextpath }/password.jsp">忘记密码?</a><a href="${contextpath }/adminlogin.jsp">店长登录</a></span></p>
							</form>
						</c:if>
					</div>
				</div>
				<div class="header-right cart">
					<a href="#"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></a>
					<div class="cart-box">
						<p><a href="${contextpath }/cartiteam/show.do?cartid=${user.cart.cartid}" >查看购物车</a></p>
						<p><a href="${contextpath }/order/show.do?userid=${user.id }" >查看订单</a></p>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!--//header-->
	<!--products-->
	<div class="products">	 
		<div class="container">
			<h2>商品</h2>
			<div class="col-md-9 product-model-sec">
				<c:forEach items="${cakelist }" var="cake">	
					<div class="product-grid">
						<a href="${contextpath }/cake/single.do?cakeid=${cake.id }">	
							<div class="more-product"><span> </span></div>						
							<div class="product-img b-link-stripe b-animate-go  thickbox">
								<img src="${contextpath }/static/images/${cake.listimg }" class="img-responsive" alt="">
								<div class="b-wrapper">
									<h4 class="b-animate b-from-left  b-delay03">							
										<button>View</button>
									</h4>
								</div>
							</div>
						</a>				
						<div class="product-info simpleCart_shelfItem">
							<div class="product-info-cust prt_name">
								<h4>${cake.name }</h4>								
								<span class="item_price">￥${cake.discountprice }</span>
								<div class="ofr">
									<p class="pric1"><del>￥${cake.price }</del></p>
									<p class="disc">[${100-cake.discountprice/cake.price*100 }% Off]</p>
								</div>
									<a href="${contextpath }/cartiteam/save.do?cartid=${user.cart.cartid }&cakeid=${cake.id}"><input type="button" class="item_add items" value="添加"></a>
								<div class="clearfix"> </div>
							</div>												
						</div>
					</div>
				</c:forEach>
				<div>
					<form method="POST" action="${contextpath }/cake/list.do?value=${value }&price1=${price1 }&price2=${price2 }" style="clear:left">
			            <table border="0" align="center" >
			                <tr>
			                    <td>第${page }页&nbsp;&nbsp;共${totalpages }页<a href="${contextpath }/cake/list.do?page=1&value=${value }&price1=${price1 }&price2=${price2 }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a></td>
			                    <td><a href="${contextpath }/cake/list.do?page=${(page<=1)?page:(page-1) }&value=${value }&price1=${price1 }&price2=${price2 }">&nbsp;&nbsp;&nbsp;&nbsp;上一页</a></td>
			                    <td><a href="${contextpath }/cake/list.do?page=${(page>=totalpages)?totalpages:(page+1) }&value=${value }&price1=${price1 }&price2=${price2 }">&nbsp;&nbsp;&nbsp;&nbsp;下一页</a></td>
			                    <td><a href="${contextpath }/cake/list.do?page=${totalpages }&value=${value }&price1=${price1 }&price2=${price2 }">&nbsp;&nbsp;&nbsp;&nbsp;最后一页</a></td>
			                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;转到第:<input type="text" name="page" size="2">页&nbsp;&nbsp;<input type="submit" value="GO" name="cndok"></td>
			                </tr>
			            </table> 
	 				</form>
 				</div>
			</div>	
			<div class="col-md-3 rsidebar span_1_of_left">
				<section  class="sky-form">
					<h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>种类</h4>
					<div class="row row1 scroll-pane">
						<div class="col col-4">
							<label class="checkbox"><input type="radio" name="value1" checked=""><a href="${contextpath }/cake/list.do?value=&price1=${price1 }&price2=${price2 }"><i></i>全部</a></label>
							<label class="checkbox"><input type="radio" name="value1"><a href="${contextpath }/cake/list.do?value=蛋糕&price1=${price1 }&price2=${price2 }"><i></i>蛋糕</a></label>
							<label class="checkbox"><input type="radio" name="value1"><a href="${contextpath }/cake/list.do?value=果冻&price1=${price1 }&price2=${price2 }"><i></i>果冻</a></label>
							<label class="checkbox"><input type="radio" name="value1"><a href="${contextpath }/cake/list.do?value=鲜花&price1=${price1 }&price2=${price2 }"><i></i>鲜花</a></label>
						</div>
					</div>
				</section>  				 
				<section  class="sky-form">
					<h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>价格</h4>
					<div class="row row1 scroll-pane">
						<div class="col col-4">
							<label class="checkbox"><input type="radio" name="value2" checked=""><a href="${contextpath }/cake/list.do?value=${value }&price1=&price2="><i></i>全部</a></label>
							<label class="checkbox"><input type="radio" name="value2"><a href="${contextpath }/cake/list.do?value=${value }&price1=0&price2=100"><i></i>0-100</a></label>
							<label class="checkbox"><input type="radio" name="value2"><a href="${contextpath }/cake/list.do?value=${value }&price1=100&price2=200"><i></i>100-200</a></label>
							<label class="checkbox"><input type="radio" name="value2"><a href="${contextpath }/cake/list.do?value=${value }&price1=200&price2=300"><i></i>200-300</a></label>
							<label class="checkbox"><input type="radio" name="value2"><a href="${contextpath }/cake/list.do?value=${value }&price1=300&price2=400"><i></i>300-400</a></label>
							<label class="checkbox"><input type="radio" name="value2"><a href="${contextpath }/cake/list.do?value=${value }&&price1=400&price2=1000"><i></i>400-1000</a></label>
						</div>
					</div>
				</section>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!--//products-->
	<!--footer-->
	<div class="footer">
		<div class="container">
			<div class="footer-grids">
				<div class="col-md-2 footer-grid">
					<h4>company</h4>
					<ul>
						<li><a href="${contextpath }/products.jsp">products</a></li>
						<li><a href="#">Work Here</a></li>
						<li><a href="#">Team</a></li>
						<li><a href="#">Happenings</a></li>
						<li><a href="#">Dealer Locator</a></li>
					</ul>
				</div>
				<div class="col-md-2 footer-grid">
					<h4>service</h4>
					<ul>
						<li><a href="#">Support</a></li>
						<li><a href="#">FAQ</a></li>
						<li><a href="#">Warranty</a></li>
						<li><a href="${contextpath }/contact.jsp">Contact Us</a></li>
					</ul>
				</div>
				<div class="col-md-3 footer-grid">
					<h4>order & returns</h4>
					<ul>
						<li><a href="#">Order Status</a></li>
						<li><a href="#">Shipping Policy</a></li>
						<li><a href="#">Return Policy</a></li>
						<li><a href="#">Digital Gift Card</a></li>
					</ul>
				</div>
				<div class="col-md-2 footer-grid">
					<h4>legal</h4>
					<ul>
						<li><a href="#">Privacy</a></li>
						<li><a href="#">Terms and Conditions</a></li>
						<li><a href="#">Social Responsibility</a></li>
					</ul>
				</div>
				<div class="col-md-3 footer-grid icons">
					<h4>Connect with Us</h4>
					<ul>
						<li><a href="#"><img src="${contextpath }/static/images/i1.png" alt=""/>Follow us on Facebook</a></li>
						<li><a href="#"><img src="${contextpath }/static/images/i2.png" alt=""/>Follow us on Twitter</a></li>
						<li><a href="#"><img src="${contextpath }/static/images/i3.png" alt=""/>Follow us on Google-plus</a></li>
						<li><a href="#"><img src="${contextpath }/static/images/i4.png" alt=""/>Follow us on Pinterest</a></li>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--//footer-->
	<div class="footer-bottom">
		<div class="container">
			<p>Copyright &copy; 2015.Company name All rights reserved.</p>
		</div>
	</div>
</body>
</html>