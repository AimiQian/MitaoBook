package com.mitao.service.impl;

import com.mitao.dao.BookDao;
import com.mitao.dao.OrderDao;
import com.mitao.dao.OrderItemDao;
import com.mitao.dao.impl.BookDaoImpl;
import com.mitao.dao.impl.OrderDaoImpl;
import com.mitao.dao.impl.OrderItemImpl;
import com.mitao.pojo.*;
import com.mitao.service.OrderService;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

public class OrderServiceImpl implements OrderService {
    private OrderDao orderDao = new OrderDaoImpl();
    private OrderItemDao orderItemDao = new OrderItemImpl();
    private BookDao bookDao = new BookDaoImpl();

    @Override
    public String createOrder(Cart cart, Integer userId) {
        String orderId = System.currentTimeMillis() + "" + userId; //unique

        Order order = new Order(orderId, LocalDateTime.now(), cart.getTotalPrice(), 0 , userId);

        orderDao.saveOrder(order);

        for(Map.Entry<Integer, CartItem>entry : cart.getItems().entrySet()){
            CartItem cartItem = entry.getValue();
            OrderItem orderItem = new OrderItem(null,cartItem.getName(),cartItem.getCount(),cartItem.getPrice(),cartItem.getTotalPrice(),orderId);
            orderItemDao.saveOrderItem(orderItem);

            Book book = bookDao.queryBookById(cartItem.getId());
            book.setSales(book.getSales() + cartItem.getCount());
            book.setStock(book.getStock() - cartItem.getCount());
            bookDao.updateBook(book);

        }

        cart.clear();

        return orderId;
    }

    @Override
    public List<Order> showAllOrders() {
        return orderDao.queryOrders();
    }

    @Override
    public List<Order> showMyOrders(Integer userId) {
        return orderDao.queryOrdersByUserId(userId);
    }

    //shipped - 1, unshipped - 0, received - 2
    @Override
    public void sendOrder(String orderId) {
        orderDao.changeOrderStatus(orderId,1);
    }

    @Override
    public void receiveOrder(String orderId) {
        orderDao.changeOrderStatus(orderId,2);

    }

    @Override
    public List<OrderItem> showOrderDetail(String orderId) {
        return orderItemDao.queryOrderItemByOrderId(orderId);
    }

    @Override
    public Page<Order> pageAllOrders(int pageNo, int pageSize) {
        Page<Order> page = new Page<>();
        page.setPageSize(pageSize);
        Integer pageTotalCount = orderDao.queryOrdersPageTotalCount();
        page.setPageTotalCount(pageTotalCount);

        Integer pageTotal = pageTotalCount % pageSize > 0 ? pageTotalCount / pageSize + 1 : pageTotalCount / pageSize;
        page.setPageTotal(pageTotal);

        page.setPageNo(pageNo);

        Integer begin = (page.getPageNo() - 1) * pageSize;

        if(begin < 0){
            begin = 0;
        }

        List<Order> items = orderDao.queryOrdersPageItems(begin,pageSize);

        page.setItems(items);

        return page;
    }

    @Override
    public Page<Order> pageAllOrdersByUser(Integer userId, int pageNo, int pageSize) {
        Page<Order> page = new Page<>();
        page.setPageSize(pageSize);
        Integer pageTotalCount = orderDao.queryOrdersPageByUserTotalCount(userId);
        page.setPageTotalCount(pageTotalCount);

        Integer pageTotal = pageTotalCount % pageSize > 0 ? pageTotalCount / pageSize + 1 : pageTotalCount / pageSize;
        page.setPageTotal(pageTotal);

        page.setPageNo(pageNo);

        Integer begin = (page.getPageNo() - 1) * pageSize;

        if(begin < 0){
            begin = 0;
        }

        List<Order> items = orderDao.queryOrdersPageItemsByUser(userId, begin,pageSize);

        page.setItems(items);

        return page;
    }

    @Override
    public Order showOrderByOrderId(String orderId) {
        return orderDao.queryOrderByOrderId(orderId);
    }
}
