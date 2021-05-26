package com.mitao.dao;

import com.mitao.pojo.OrderItem;

import java.util.List;

public interface OrderItemDao {
    public int saveOrderItem(OrderItem orderItem);

    public List<OrderItem> queryOrderItemByOrderId(String orderId);
}


