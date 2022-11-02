<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
    <title>MiTao BookStore Main Page</title>

    <%-- 静态包含 base标签、css样式、jQuery文件 --%>
    <%@ include file="/pages/common/head.jsp"%>
    <script type="text/javascript">
        $(function () {
            $("button.addToCart").click(function () {
                var bookId = $(this).attr("bookId");
                <%--location.href="${basePath}cartServlet?action=addItem&id=" + bookId;--%>

                $.getJSON("${basePath}cartServlet", "action=ajaxAddItem&id=" + bookId, function (data) {
                    $("#cartTotalCount").text("There are " + data.totalCount + " in you cart.");
                    $(".cartLastName").text(data.lastName);
                });
            });
        })
    </script>
</head>
<body>
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
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Introduction<span class="sr-only">(current)</span></a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Key Points<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                            <li><a href="#"></a></li>
                        </ul>
                    </li>
                    <li><a href="#" data-toggle="modal" data-target=".modal-1">About</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="pages/cart/cart.jsp">Cart</a></li>
                    <li><a href="pages/manager/manager.jsp">Manage</a></li>
                    <c:if test="${empty sessionScope.user}">
                        <li><a href="pages/user/login.jsp" class="btn btn-default navbar-btn">Login</a></li>
                        <li><a href="pages/user/regist.jsp" class="btn btn-default navbar-btn">Register</a></li>
                    </c:if>
                    <c:if test="${not empty sessionScope.user}">
                        <li><a href="orderServlet?action=pageAllOrdersByUser">My Orders</a></li>
                        <li><a href="userServlet?action=logout" class="btn btn-default navbar-btn">Logout</a></li>
                    </c:if>

                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>

    <div id="carousel-example-generic" class="carousel slide aimi" data-ride="carousel" data-interval="2000">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            <li data-target="#carousel-example-generic" data-slide-to="4"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="static/img/5.png" alt="...">
                <div class="carousel-caption">
                    <c:if test="${not empty sessionScope.user}">
                        <span>Hello, <span class="um_span">${sessionScope.user.username}</span>! Welcome To MiTao BookStore!!</span>
                    </c:if>
                </div>
            </div>
            <div class="item">
                <img src="static/img/6.png" alt="...">
                <div class="carousel-caption">
                    <c:if test="${not empty sessionScope.user}">
                        <span>Hello, <span class="um_span">${sessionScope.user.username}</span>! Welcome To MiTao BookStore!!</span>
                    </c:if>
                </div>
            </div>
            <div class="item">
                <img src="static/img/8.png" alt="...">
                <div class="carousel-caption">
                    <c:if test="${not empty sessionScope.user}">
                        <span>Hello, <span class="um_span">${sessionScope.user.username}</span>! Welcome To MiTao BookStore!!</span>
                    </c:if>
                </div>
            </div>
            <div class="item">
                <img src="static/img/9.png" alt="...">
                <div class="carousel-caption">
                    <c:if test="${not empty sessionScope.user}">
                        <span>Hello, <span class="um_span">${sessionScope.user.username}</span>! Welcome To MiTao BookStore!!</span>
                    </c:if>
                </div>
            </div>
            <div class="item">
                <img src="static/img/11.png" alt="...">
                <div class="carousel-caption">
                    <c:if test="${not empty sessionScope.user}">
                        <span>Hello, <span class="um_span">${sessionScope.user.username}</span>! Welcome To MiTao BookStore!!</span>
                    </c:if>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

<%--    <div id="header" class="container">--%>
<%--        <div style="text-align: center">--%>
<%--            <c:if test="${empty sessionScope.user}">--%>
<%--                <a href="pages/user/login.jsp">Login</a> |--%>
<%--                <a href="pages/user/regist.jsp">Register</a> &nbsp;&nbsp;--%>
<%--            </c:if>--%>
<%--            <c:if test="${not empty sessionScope.user}">--%>
<%--                <span>Welcome<span class="um_span">${sessionScope.user.username}</span>To MiTao BookStore</span>--%>
<%--                <a href="orderServlet?action=pageAllOrdersByUser">My Orders</a>--%>
<%--                <a href="userServlet?action=logout">Logout</a>&nbsp;&nbsp;--%>
<%--            </c:if>--%>

<%--            <a href="pages/cart/cart.jsp">Cart</a> 🛒 |--%>
<%--            <a href="pages/manager/manager.jsp">Manage 🔐 </a>--%>
<%--        </div>--%>
<%--    </div>--%>

    <div id="book" class="container">
            <div class="book_cond" style="text-align: center">
                <form action="client/bookServlet" method="get">
                    <input type="hidden" name="action" value="pageByPrice">
                    Price：$ <label for="min"></label><input id="min" type="text" name="min" value="${param.min}" /> -
                    $ <label for="max"></label><input id="max" type="text" name="max" value="${param.max}" />
                    <input type="submit" value="Find" />
                </form>
            </div>
            <div style="text-align: center">
                <c:if test="${empty sessionScope.cart.items}">
                    <span id="cartTotalCount"></span>
                    <div>
                        <span style="color: red" class="cartLastName">Current Cart is Empty</span>
                    </div>
                </c:if>
                <c:if test="${not empty sessionScope.cart.items}">
                    <span id="cartTotalCount">There are ${sessionScope.cart.totalCount} items in your cart</span>
                    <div>
                        You have added <span style="color: red" class="cartLastName">${sessionScope.lastName}</span> into the cart.
                    </div>
                </c:if>
            </div>

           <div class="row">
                <c:forEach items="${requestScope.page.items}" var="book">
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 b_list">
                        <div class="thumbnail">
                            <div class="img_div">
                                <img class="book_img" alt="" src="${book.imgPath}" />
                            </div>
                            <div class="caption book_info">
                                <div class="book_name">
                                    <span class="sp1">Name:</span>
                                    <span class="sp2">${book.name}</span>
                                </div>
                                <div class="book_author">
                                    <span class="sp1">Author:</span>
                                    <span class="sp2">${book.author}</span>
                                </div>
                                <div class="book_price">
                                    <span class="sp1">Price:</span>
                                    <span class="sp2">$${book.price}</span>
                                </div>
                                <div class="book_sales">
                                    <span class="sp1">Sale:</span>
                                    <span class="sp2">${book.sales}</span>
                                </div>
                                <div class="book_amount">
                                    <span class="sp1">In Stock:</span>
                                    <span class="sp2">${book.stock}</span>
                                </div>
                                <div class="book_add">
                                    <button bookId="${book.id}" class="addToCart">Add To Cart</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
           </div>

          <%@include file="/pages/common/page_nav.jsp"%>
    </div>

   <%--静态包含页脚内容--%>
   <%@include file="/pages/common/footer.jsp"%>

    <div class="modal fade modal-1" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Author: Aimi Qian</h4>
                </div>
                <div class="modal-body">
                    <p>
                        Summer Project: MiTao BookStore
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>