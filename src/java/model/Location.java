package model;

public class Location {
    private final int loc_NO;
    private final float loc_lat;
    private final float loc_longt;
    private final int order_NO;
    private final String car_id;
    private final String car_country;

    public Location(int loc_NO, float loc_lat, float loc_longt, int order_NO, String car_id, String car_country) {
        this.loc_NO = loc_NO;
        this.loc_lat = loc_lat;
        this.loc_longt = loc_longt;
        this.order_NO = order_NO;
        this.car_id = car_id;
        this.car_country = car_country;
    }

    public int getLoc_NO() {
        return loc_NO;
    }

    public float getLoc_lat() {
        return loc_lat;
    }

    public float getLoc_longt() {
        return loc_longt;
    }

    public int getOrder_NO() {
        return order_NO;
    }

    public String getCar_id() {
        return car_id;
    }

    public String getCar_country() {
        return car_country;
    }

    

    
}