<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextpath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理系统</title>
<link type="text/css" rel="stylesheet" href="${contextpath }/static/css/backgroundstyle.css" />
<script type="text/javascript" src="${contextpath }/static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${contextpath }/static/js/menu.js"></script>
	<style type="text/css">
		.book{font-weight:bold;font-size:150%;}
	</style>
</head>

<body>

<div class="top"></div>
<div id="header">
	<div class="logo">鱼总后台管理系统</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li><a href="#">${admin.realName }</a></li>
			<li><a href="bgadminupdate.jsp?">修改信息</a></li>
			<li><a href="${contextpath }/admin/loginout.do">退出</a></li>
		</ul>
	</div>
</div>
<div id="content">
	<div class="left_menu">
				<ul id="nav_dot">
      <li>
          <h4 class="M1"><span></span>系统公告</h4>
          <div class="list-item none">
            <a href="${contextpath }/background.jsp">最新公告</a>
          </div>
        </li>
        <li>
          <h4 class="M7"><span></span>订单处理</h4>
          <div class="list-item none">
            <a href="${contextpath }/order/list.do">查看订单</a>
           </div>
        </li>
        <li>
          <h4 class="M9"><span></span>商品管理</h4>
          <div class="list-item none">
            <a href="${contextpath }/cake/bglist.do">商品信息</a>
            <a href="${contextpath }/bgcakesave.jsp">新增商品</a>
          </div>
        </li>
				<li>
          <h4 class="M10"><span></span>用户管理</h4>
          <div class="list-item none">
            <a href="${contextpath }/user/list.do">用户信息</a>
          </div>
        </li>
  </ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
					<ul>
							<li><img src="images/home.png"></li>
								<li style="margin-left:25px;">您当前的位置：</li>
								<li><a href="#">用户管理</a></li>
								<li>></li>
								<li><a href="#">用户信息</a></li>
						</ul>
			</div>
			<div class="main">
			<center>
				<c:if test="${userlist == null }">
					<h1>无用户</h1>
				</c:if>
				<c:if test="${userlist != null }">
					<h1>用户列表</h1>
					<table align="center">
						<tr>
							<th width="60px">用户Id</th>
							<th width="100px">用户名称</th>
							<th width="100px">用户电话</th>
							<th width="200px">用户地址</th>
							<th width="60px">删除</th>
						</tr>
						<c:forEach items="${userlist }" var="user">
							<tr>
								<td align="center">${user.id }</td>
								<td align="center">${user.username }</td>
								<td align="center">${user.phone }</td>
								<td align="center">${user.address }</td>
								<td align="center"><a href="${contextpath }/user/delete.do?id=${user.id }&page=${page }">删除</a></td>
							</tr>
						</c:forEach>
					</table>
					<div>
					<form method="POST" action="${contextpath }/user/list.do" style="clear:left">
			                    第${page }页&nbsp;&nbsp;共${totalpages }页<a href="${contextpath }/user/list.do?page=1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a>
			           <a href="${contextpath }/user/list.do?page=${(page<=1)?page:(page-1) }">&nbsp;&nbsp;&nbsp;&nbsp;上一页</a>
			           <a href="${contextpath }/user/list.do?page=${(page>=totalpages)?totalpages:(page+1) }">&nbsp;&nbsp;&nbsp;&nbsp;下一页</a>
			           <a href="${contextpath }/user/list.do?page=${totalpages }&value=${value }">&nbsp;&nbsp;&nbsp;&nbsp;最后一页</a>
			           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;转到第:<input type="text" name="page" size="2">页&nbsp;&nbsp;<input type="submit" value="GO" name="cndok"> 
	 				</form>
 				</div>
				</c:if>
				</center>
			</div>
		</div>
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright©  2015 版权所有 京ICP备05019125号-10</p></div>
<script>navList(12);</script>
</body>
</html>