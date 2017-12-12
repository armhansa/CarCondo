/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

public class OrderService {
    private final int Order_NO;
    private final String carID;
    private final String carCountry;
    private int times[];
    private final int price[];
    private Date lastTime[];
    
    public OrderService(int Order_NO, String carID, String carCountry, int[] times, int[] price, Date[] lastTime) {
        this.Order_NO = Order_NO;
        this.carID = carID;
        this.carCountry = carCountry;
        this.times = times;
        this.price = price;
        this.lastTime = lastTime;
    }

    public void setTimes(int[] times) {
        this.times = times;
    }

    public void setLastTime(Date[] lastTime) {
        this.lastTime = lastTime;
    }

    public String getCarID() {
        return carID;
    }

    public String getCarCountry() {
        return carCountry;
    }

    public int[] getTimes() {
        return times;
    }

    public int[] getPrice() {
        return price;
    }

    public Date[] getLastTime() {
        return lastTime;
    }
    
    
    
}
