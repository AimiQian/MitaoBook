<%--
  Created by IntelliJ IDEA.
  User: amyyy
  Date: 5/13/2021
  Time: 12:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">MiTao BookStore</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="manager/bookServlet?action=page">Book Management</a></li>
        <li><a href="orderServlet?action=pageAllOrders">Order Management</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<%--<div>--%>
<%--  <a href="manager/bookServlet?action=page">图书管理</a>--%>
<%--  <a href="orderServlet?action=pageAllOrders">订单管理</a>--%>
<%--  <a href="index.jsp">返回商城</a>--%>
<%--</div>--%>