package com.mitao.service;

import com.mitao.pojo.Cart;
import com.mitao.pojo.Order;
import com.mitao.pojo.OrderItem;

import java.util.List;

public interface OrderService {
    public String createOrder(Cart cart, Integer userId);

    public List<Order> showAllOrders();

    public List<Order> showMyOrders(Integer userId);

    public void sendOrder(String orderId);

    public void receiveOrder(String orderId);

    public List<OrderItem> showOrderDetail(String orderId);
}
