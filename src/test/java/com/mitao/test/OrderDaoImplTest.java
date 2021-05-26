package com.mitao.test;

import com.mitao.dao.OrderDao;
import com.mitao.dao.impl.OrderDaoImpl;
import org.junit.jupiter.api.Test;

class OrderDaoImplTest {

    @Test
    void queryOrdersByUserId() {
        OrderDao orderDao = new OrderDaoImpl();
        System.out.println(orderDao.queryOrdersByUserId(1));
    }

    @Test
    void queryOrders() {
        OrderDao orderDao = new OrderDaoImpl();
        System.out.println(orderDao.queryOrders());
    }

    @Test
    void changeOrderStatus() {
        OrderDao orderDao = new OrderDaoImpl();
        System.out.println(orderDao.changeOrderStatus("16215444695531", 1));
    }
}