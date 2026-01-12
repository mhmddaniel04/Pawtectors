package com.pawtectors.model;

import java.sql.Date;

public class AdoptionRequest {
    private int id;
    private int catId;
    private String catName;
    private String userName;
    private String email;
    private String gender;
    private int age;
    private String origin;
    private Date pickupDate;
    private String status;
    private Date requestDate;

    public AdoptionRequest() {}

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getCatId() { return catId; }
    public void setCatId(int catId) { this.catId = catId; }
    public String getCatName() { return catName; }
    public void setCatName(String catName) { this.catName = catName; }
    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
    public String getOrigin() { return origin; }
    public void setOrigin(String origin) { this.origin = origin; }
    public Date getPickupDate() { return pickupDate; }
    public void setPickupDate(Date pickupDate) { this.pickupDate = pickupDate; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public Date getRequestDate() { return requestDate; }
    public void setRequestDate(Date requestDate) { this.requestDate = requestDate; }
}