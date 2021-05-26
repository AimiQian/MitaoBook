package com.mitao.service;

import com.mitao.pojo.*;

import java.util.List;

public interface OrderService {
    public String createOrder(Cart cart, Integer userId);

    public List<Order> showAllOrders();

    public List<Order> showMyOrders(Integer userId);

    public void sendOrder(String orderId);

    public void receiveOrder(String orderId);

    public List<OrderItem> showOrderDetail(String orderId);

    public Page<Order> pageAllOrders(int pageNo, int pageSize);

    public Page<Order> pageAllOrdersByUser(Integer userId, int pageNo, int pageSize);

    public Order showOrderByOrderId(String orderId);
}
