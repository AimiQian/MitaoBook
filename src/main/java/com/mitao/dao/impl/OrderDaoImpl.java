package com.mitao.dao.impl;

import com.mitao.dao.OrderDao;
import com.mitao.pojo.Order;

import java.util.List;

public class OrderDaoImpl extends BaseDao implements OrderDao{
    @Override
    public int saveOrder(Order order) {
        String sql = "insert into t_order(`order_id`,`create_time`,`price`,`status`,`user_id`) values(?,?,?,?,?)";
        return update(sql,order.getOrderId(),order.getCreateTime(),order.getPrice(),order.getStatus(),order.getUserId());
    }

    @Override
    public List<Order> queryOrdersByUserId(Integer userId) {
        String sql = "select `order_id` as orderId,`create_time` as createTime,`price`,`status`,`user_id` as userId from t_order where `user_id` = ?";
        return queryForList(Order.class, sql, userId);
    }

    @Override
    public List<Order> queryOrders() {
        String sql = "select `order_id` as orderId,`create_time` as createTime,`price`,`status`,`user_id` as userId from t_order";
        return queryForList(Order.class, sql);
    }

    @Override
    public Integer queryOrdersPageTotalCount() {
        String sql = "select count(*) from t_order";
        Number count = (Number)queryForSingleValue(sql);
        return count.intValue();
    }

    @Override
    public List<Order> queryOrdersPageItems(int begin, int pageSize) {
        String sql = "select `order_id` as orderId,`create_time` as createTime,`price`,`status`,`user_id` as userId from t_order limit ?,?";
        return queryForList(Order.class,sql,begin,pageSize);
    }

    @Override
    public Integer queryOrdersPageByUserTotalCount(Integer userId) {
        String sql = "select count(*) from t_order where `user_id` = ?";
        Number count = (Number)queryForSingleValue(sql,userId);
        return count.intValue();
    }

    @Override
    public List<Order> queryOrdersPageItemsByUser(Integer userId, int begin, int pageSize) {
        String sql = "select `order_id` as orderId,`create_time` as createTime,`price`,`status`,`user_id` as userId from t_order where `user_id` = ? limit ?,?";
        return queryForList(Order.class,sql,userId,begin,pageSize);
    }

    @Override
    public int changeOrderStatus(String orderId, Integer status) {
        String sql = "update t_order set `status` = ? where `order_id` = ?";
        return update(sql,status,orderId);
    }

    @Override
    public Order queryOrderByOrderId(String orderId) {
        String sql = "select `order_id` as orderId,`create_time` as createTime,`price`,`status`,`user_id` as userId from t_order where `order_id` = ?";
        return queryForOne(Order.class, sql, orderId);
    }
}
