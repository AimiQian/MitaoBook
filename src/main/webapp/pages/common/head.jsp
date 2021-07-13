<%--
  Created by IntelliJ IDEA.
  User: amyyy
  Date: 5/13/2021
  Time: 11:52 AM
  To change this template use File | Settings | File Templates.
--%>
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
    pageContext.setAttribute("basePath",basePath);
%>
<base href="<%=basePath%>">
<link type="text/css" rel="stylesheet" href="static/css/style.css" >
<script type="text/javascript" src="static/script/jquery-3.6.0.js" ></script>
<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
<script src="static/script/jquery.min.js"></script>
<script src="static/script/bootstrap.min.js"></script>