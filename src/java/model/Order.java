
package model;

import java.sql.Date;

public class Order {
    private final int orderNo;
    private Date hiredate;
    private final String carID;
    private final String carCountry;
    private String empID;
    
    public Order(int orderNo, Date hiredate, String carID, String carCountry, String empID) {
        this.orderNo = orderNo;
        this.hiredate = hiredate;
        this.carID = carID;
        this.carCountry = carCountry;
        this.empID = empID;
        
    }

    public void setHiredate(Date hiredate) {
        this.hiredate = hiredate;
    }

    public void setEmpID(String empID) {
        this.empID = empID;
    }

    public int getOrderNo() {
        return orderNo;
    }

    public Date getHiredate() {
        return hiredate;
    }

    public String getCarID() {
        return carID;
    }

    public String getCarCountry() {
        return carCountry;
    }

    public String getEmpID() {
        return empID;
    }
    
    
    
}
