package model;

import java.util.LinkedList;


public class ListOrderService {
    private LinkedList<OrderService> listOrderService;
    
    public ListOrderService() {
        listOrderService = new LinkedList();
    }
    
    public void addOrderService(OrderService orderService) { getListOrderService().add(orderService); }
    public LinkedList<OrderService> getListOrderService() { return listOrderService; }
    public void deleteOrderService(OrderService orderService) { listOrderService.remove(orderService); }
}
