package com.mitao.test;

import com.mitao.dao.OrderItemDao;
import com.mitao.dao.impl.OrderItemImpl;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class OrderItemImplTest {

    @Test
    void queryOrderItemByOrderId() {
        OrderItemDao orderItemDao = new OrderItemImpl();
        System.out.println(orderItemDao.queryOrderItemByOrderId("16215444695531"));
    }
}