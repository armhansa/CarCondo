/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.LinkedList;

/**
 *
 * @author LAB203_59
 */
public class ListLocation {
    private LinkedList<Location> listLocation;
    
    public ListLocation() {
        listLocation = new LinkedList();
    }
    
    public void addLocation(Location loc) { getListLocation().add(loc); }
    public LinkedList<Location> getListLocation() { return listLocation; }
    public void deleteLocation(Location loc) { listLocation.remove(loc); }
}
