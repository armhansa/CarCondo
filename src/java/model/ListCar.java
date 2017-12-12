package model;

import java.util.LinkedList;

public class ListCar {
    private LinkedList<Car> listCar;
    
    public ListCar() {
        listCar = new LinkedList();
    }
    
    public void addCar(Car car) { getListCar().add(car); }
    public LinkedList<Car> getListCar() { return listCar; }
    public void deleteCar(Car car) { listCar.remove(car); }
    
}
