package com.mitao.dao;

import com.mitao.pojo.Book;
import com.mitao.pojo.Order;

import java.util.List;

public interface OrderDao {

    public int saveOrder(Order order);

    public List<Order> queryOrdersByUserId(Integer userId);

    public List<Order> queryOrders();

    public int changeOrderStatus(String orderId, Integer status);

    Integer queryOrdersPageTotalCount();

    List<Order> queryOrdersPageItems(int begin, int pageSize);

    Integer queryOrdersPageByUserTotalCount(Integer userId);

    List<Order> queryOrdersPageItemsByUser(Integer userId, int begin, int pageSize);

    public Order queryOrderByOrderId(String orderId);

}
