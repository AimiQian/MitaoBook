package com.mitao.web;

import com.mitao.pojo.*;
import com.mitao.service.OrderService;
import com.mitao.service.impl.OrderServiceImpl;
import com.mitao.utils.JdbcUtils;
import com.mitao.utils.WebUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderServlet", value = "/orderServlet")
public class OrderServlet extends BaseServlet {
    OrderService orderService = new OrderServiceImpl();

    protected void createOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cart cart = (Cart)request.getSession().getAttribute("cart");
        User loginUser = (User)request.getSession().getAttribute("user");

        if(loginUser == null){
            request.getRequestDispatcher("pages/user/login.jsp").forward(request,response);
            return;
        }

        Integer userId = loginUser.getId();
        String orderId = orderService.createOrder(cart,userId);

        // request.setAttribute("orderId", orderId);

        //request.getRequestDispatcher("/pages/cart/checkout.jsp").forward(request,response);
        request.getSession().setAttribute("orderId", orderId);

        response.sendRedirect(request.getContextPath() + "/pages/cart/checkout.jsp");
    }

    protected void showAllOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> allOrders = orderService.showAllOrders();
        request.setAttribute("allOrders", allOrders);
        request.getRequestDispatcher("/pages/manager/order_manager.jsp").forward(request,response);
    }

    protected void showMyOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User loginUser = (User)request.getSession().getAttribute("user");

        Integer userId = loginUser.getId();

        List<Order> myOrders = orderService.showMyOrders(userId);
        request.setAttribute("myOrders", myOrders);
        request.getRequestDispatcher("/pages/order/order.jsp").forward(request,response);
    }

    protected void pageAllOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageNo = WebUtils.parseInt(request.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(request.getParameter("pageSize"), Page.PAGE_SIZE);

        Page<Order> page = orderService.pageAllOrders(pageNo, pageSize);

        page.setUrl("orderServlet?action=pageAllOrders");

        request.setAttribute("page", page);
        request.getRequestDispatcher("/pages/manager/order_manager.jsp").forward(request,response);
    }

    protected void pageAllOrdersByUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageNo = WebUtils.parseInt(request.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(request.getParameter("pageSize"), Page.PAGE_SIZE);

        User loginUser = (User)request.getSession().getAttribute("user");

        Integer userId = loginUser.getId();

        Page<Order> page = orderService.pageAllOrdersByUser(userId, pageNo, pageSize);

        page.setUrl("orderServlet?action=pageAllOrdersByUser");

        request.setAttribute("page", page);
        request.getRequestDispatcher("/pages/order/order.jsp").forward(request,response);
    }

    protected void sendOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");

        orderService.sendOrder(orderId);

        response.sendRedirect(request.getHeader("Referer"));

    }

    protected void receiveOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");

        orderService.receiveOrder(orderId);

        response.sendRedirect(request.getHeader("Referer"));

    }

    protected void showOrderDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");



        Order order = orderService.showOrderByOrderId(orderId);
        List<OrderItem> orderItems = orderService.showOrderDetail(orderId);
        request.setAttribute("orderItems", orderItems);
        request.setAttribute("order", order);

        request.getRequestDispatcher("/pages/order/order_detail.jsp").forward(request,response);

    }




}
