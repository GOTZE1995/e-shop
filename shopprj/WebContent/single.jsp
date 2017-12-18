<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextpath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>single</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="${contextpath }/static/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="${contextpath }/static/css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="${contextpath }/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextpath }/static/js/bootstrap-3.1.1.min.js"></script>
<script src="${contextpath }/static/js/imagezoom.js"></script>
<!-- //js -->
<!-- cart -->
<script src="${contextpath }/static/js/simpleCart.min.js"> </script>
<!-- cart -->
<!-- FlexSlider -->
<script defer src="${contextpath }/static/js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="${contextpath }/static/css/flexslider.css" type="text/css" media="screen" />
<script>
	// Can also be used with $(document).ready()
	$(window).load(function() {
	  $('.flexslider').flexslider({
		animation: "slide",
		controlNav: "thumbnails"
	  });
	});
</script>
<!--//FlexSlider -->
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
	<!--//single-page-->
	<div class="single">
		<div class="container">
			<div class="single-grids">				
				<div class="col-md-4 single-grid">		
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="${contextpath }/static/images/${cake.img1 }">
								<div class="thumb-image"> <img src="${contextpath }/static/images/${cake.img1 }" data-imagezoom="true" class="img-responsive"> </div>
							</li>
							<li data-thumb="${contextpath }/static/images/${cake.img2 }">
								 <div class="thumb-image"> <img src="${contextpath }/static/images/${cake.img2 }" data-imagezoom="true" class="img-responsive"> </div>
							</li>
							<li data-thumb="${contextpath }/static/images/${cake.img3 }">
							   <div class="thumb-image"> <img src="${contextpath }/static/images/${cake.img3 }" data-imagezoom="true" class="img-responsive"> </div>
							</li> 
						</ul>
					</div>
				</div>	
				<div class="col-md-4 single-grid simpleCart_shelfItem">		
					<h3>${cake.name }</h3>
					<p>${cake.description }</p>
					<ul class="size">
						<h3>Size</h3>
							<li><a href="#">1 KG</a></li>
							<li><a href="#">2 KG</a></li>
							<li><a href="#">3 KG</a></li>
							<li><a href="#">4 KG</a></li>
					</ul>
					<ul class="size">
						<h3>2-3 Tier Cakes</h3>
							<li><a href="#">1 Step</a></li>
							<li><a href="#">2 Step</a></li>
							<li><a href="#">3 Step</a></li>
					</ul>
					<div class="galry">
						<div class="prices">
							<h5 class="item_price">￥${cake.discountprice }</h5>
						</div>
						<div class="rating">
							<span>☆</span>
							<span>☆</span>
							<span>☆</span>
							<span>☆</span>
							<span>☆</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<p class="qty"> Qty :  </p><input min="1" type="number" id="quantity" name="quantity" value="1" class="form-control input-small">
					<div class="btn_form">
						<a href="${contextpath }/cartiteam/save.do?cartid=${user.cart.cartid }&cakeid=${cake.id}" class="add-cart item_add">添加购物车</a>	
					</div>
					<div class="tag">
						<p>种类 : <a href="#">${cake.cakeType.name }</a></p>
						<p>附带 : <a href="#">精美包装，餐具</a></p>
					</div>
				</div>
				<div class="col-md-4 single-grid1">
					
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- collapse -->
	<div class="collpse tabs">
		<div class="container">
			<div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							  Description
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
							Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
							   additional information
							</a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
						<div class="panel-body">
							Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
								reviews (5)
							</a>
						</h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
						<div class="panel-body">
							Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingFour">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
								help
							</a>
						</h4>
					</div>
					<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
						<div class="panel-body">
							Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//collapse -->
	<!--related-products-->
	<div class="related-products">
		<div class="container">
			<h3>本店热销</h3>
			<div class="product-model-sec single-product-grids">
				<div class="product-grid single-product">
					<a href="${contextpath }/cake/single.do?cakeid=1">
					<div class="more-product"><span> </span></div>						
					<div class="product-img b-link-stripe b-animate-go  thickbox">
						<img src="${contextpath }/static/images/cake1.jpg" class="img-responsive" alt="">
						<div class="b-wrapper">
						<h4 class="b-animate b-from-left  b-delay03">							
						<button>View</button>
						</h4>
						</div>
					</div>
					</a>					
					<div class="product-info simpleCart_shelfItem">
						<div class="product-info-cust prt_name">
							<h4>细细的爱</h4>								
							<span class="item_price">￥178.0</span>
							<div class="ofr">
							  <p class="pric1"><del>￥1000.0</del></p>
							  <p class="disc">[82.2% Off]</p>
							</div>
							<div class="clearfix"> </div>
						</div>												
					</div>
				</div>
				<div class="product-grid single-product">
					<a href="${contextpath }/cake/single.do?cakeid=6">
					<div class="more-product"><span> </span></div>						
					<div class="product-img b-link-stripe b-animate-go  thickbox">
						<img src="${contextpath }/static/images/cake6.jpg" class="img-responsive" alt="">
						<div class="b-wrapper">
						<h4 class="b-animate b-from-left  b-delay03">							
						<button>View</button>
						</h4>
						</div>
					</div>
					</a>					
					<div class="product-info simpleCart_shelfItem">
						<div class="product-info-cust prt_name">
							<h4>心心相印</h4>								
							<span class="item_price">￥318.0</span>
							<div class="ofr">
							  <p class="pric1"><del>￥1000.0</del></p>
							  <p class="disc">[68.2% Off]</p>
							</div>
							<div class="clearfix"> </div>
						</div>												
					</div>
				</div>
				<div class="product-grid single-product">
					<a href="${contextpath }/cake/single.do?cakeid=10">
					<div class="more-product"><span> </span></div>						
					<div class="product-img b-link-stripe b-animate-go  thickbox">
						<img src="${contextpath }/static/images/cake10.jpg" class="img-responsive" alt="">
						<div class="b-wrapper">
						<h4 class="b-animate b-from-left  b-delay03">							
						<button>View</button>
						</h4>
						</div>
					</div>
					</a>					
					<div class="product-info simpleCart_shelfItem">
						<div class="product-info-cust prt_name">
							<h4>彩色的梦</h4>								
							<span class="item_price">￥374.0</span>
							<div class="ofr">
							  <p class="pric1"><del>￥1000.0</del></p>
							  <p class="disc">[62.6% Off]</p>
							</div>
							<div class="clearfix"> </div>
						</div>												
					</div>
				</div>
				<div class="product-grid single-product">
					<a href="${contextpath }/cake/single.do?cakeid=16">
					<div class="more-product"><span> </span></div>						
					<div class="product-img b-link-stripe b-animate-go  thickbox">
						<img src="${contextpath }/static/images/cake16.jpg" class="img-responsive" alt="">
						<div class="b-wrapper">
						<h4 class="b-animate b-from-left  b-delay03">							
						<button>view</button>
						</h4>
						</div>
					</div>
					</a>					
					<div class="product-info simpleCart_shelfItem">
						<div class="product-info-cust prt_name">
							<h4>一生钟爱</h4>								
							<span class="item_price">￥1314.0</span>
							<div class="ofr">
							  <p class="pric1"><del>￥2000.0</del></p>
							  <p class="disc">[34.3% Off]</p>
							</div>
							<div class="clearfix"> </div>
						</div>												
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--related-products-->
	<!--footer-->
	<div class="footer">
		<div class="container">
			<div class="footer-grids">
				<div class="col-md-2 footer-grid">
					<h4>company</h4>
					<ul>
						<li><a href="products.jsp">products</a></li>
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
						<li><a href="contact.jsp">Contact Us</a></li>
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
	<!--footer-->
	<div class="footer-bottom">
		<div class="container">
			<p>Copyright &copy; 2015.Company name All rights reserved.</p>
		</div>
	</div>
</html>