package com.pawtectors.model;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class Cat {
    private int id;
    private String name;
    private String breed;
    private String status;
    private int age;
    private String gender;
    private String shelterLocation;
    private Date dateArrived;
    private String details;
    private byte[] imageData;
    private String base64Image;

    public Cat() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getBreed() { return breed; }
    public void setBreed(String breed) { this.breed = breed; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public String getShelterLocation() { return shelterLocation; }
    public void setShelterLocation(String shelterLocation) { this.shelterLocation = shelterLocation; }
    public Date getDateArrived() { return dateArrived; }
    public void setDateArrived(Date dateArrived) { this.dateArrived = dateArrived; }
    public String getDetails() { return details; }
    public void setDetails(String details) { this.details = details; }
    public byte[] getImageData() { return imageData; }
    public void setImageData(byte[] imageData) { this.imageData = imageData; }
    public String getBase64Image() { return base64Image; }
    public void setBase64Image(String base64Image) { this.base64Image = base64Image; }

    public String getDateArrivedStr() {
        if (this.dateArrived == null) return "";
        return new SimpleDateFormat("dd MMM yyyy").format(this.dateArrived);
    }

    public String getHtmlDate() {
        if (this.dateArrived == null) return "";
        return new SimpleDateFormat("yyyy-MM-dd").format(this.dateArrived);
    }
}