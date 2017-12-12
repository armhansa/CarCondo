package model;

import java.sql.Date;

public class Customer {
    private String password;
    private String firstname;
    private String lastname;
    private Date birthDay;
    private String email;
    private String phone;
    private String address;
    private String citizenID;

    public Customer(String password, String fname, String lname, Date birthDay, String email, String phone, String address, String citizenID) {
        this.password = password;
        this.firstname = fname;
        this.lastname = lname;
        this.birthDay = birthDay;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.citizenID = citizenID;
    }

    public String getPassword() { return password; }
    public String getFirstname() { return firstname; }
    public String getLastname() { return lastname; }
    public String getBirthDay() { return birthDay.toString(); }
    public String getEmail() { return email; }
    public String getPhone() { return phone; }
    public String getAddress() { return address; }
    public String getCitizenId() { return citizenID; }

    public void setPassword(String password) { this.password = password; }
    public void setFirstname(String firstname) { this.firstname = firstname; }
    public void setLastname(String lastname) { this.lastname = lastname; }
    public void setBirthDay(Date birthDay) { this.birthDay = birthDay; }
    public void setEmail(String email) { this.email = email; }
    public void setPhone(String phone) { this.phone = phone; }
    public void setAddress(String address) { this.address = address; }
    public void setCitizenID(String citizenID) { this.citizenID = citizenID; }
   
}
