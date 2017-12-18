<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextpath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Yummy后台管理系统</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="viewport" content="width=device-width">
<link href="${contextpath }/static/css/base.css" rel="stylesheet" type="text/css">
<link href="${contextpath }/static/css/login.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="login">
<form action="${contextpath }/admin/login.do" method="post" id="form">
	<div class="logo"></div>
    <div class="login_form">
    	<div class="user">
        	<input class="text_value" value="" name="adminname" type="text" id="username">
            <input class="text_value" value="" name="password" type="password" id="password">
        </div>
        <button class="button" id="submit" type="submit">登录</button>
    </div>
    <div id="tip">${fails }</div>
    <div class="foot">
	Copyright &copy; 2014.Company name All rights reserved.
    </div>
    </form>
</div>
<script>var basedir='${contextpath }/static/js/';</script>
<script src="${contextpath }/static/js/do.js"></script>
<script src="${contextpath }/static/js/config.js"></script>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>