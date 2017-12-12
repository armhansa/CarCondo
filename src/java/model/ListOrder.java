package model;

import java.util.LinkedList;

public class ListOrder {
    private LinkedList<Order> listOrder;
    
    public ListOrder() {
        listOrder = new LinkedList();
    }
    
    public void addOrder(Order order) { getListOrder().add(order); }
    public LinkedList<Order> getListOrder() { return listOrder; }
    public void deleteOrder(Order order) { listOrder.remove(order); }
    
}
