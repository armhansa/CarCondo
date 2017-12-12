package model;

public class Car {
    private final String id;
    private final String country;
    private final String brand;
    private final String color;
    private final int number;
    public Car(String id, String country, String brand, String color, int number) {
        this.id = id;
        this.country = country;
        this.brand = brand;
        this.color = color;
        this.number = number;
    }

    public int getNumber() { return number; }
    public String getId() { return id; }
    public String getCountry() { return country; }
    public String getBrand() { return brand; }
    public String getColor() { return color; }

}
