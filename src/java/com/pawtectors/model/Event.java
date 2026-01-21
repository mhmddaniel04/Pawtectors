package com.pawtectors.model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;


public class Event {
    private int id;
    private String title;
    private Date eventDate;
    private String location;
    private String description;
    private String date; 
    private String time; 
    private String startTime;
    private String endTime;
    public Event() {}

    // --- HELPERS FOR ADMIN JSP ---
    public String getEventDateStr() {
        if (eventDate == null) return "";
        return new SimpleDateFormat("dd MMM yyyy").format(eventDate);
    }

    public String getHtmlDate() {
        if (eventDate == null) return "";
        return new SimpleDateFormat("yyyy-MM-dd").format(eventDate);
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public Date getEventDate() { return eventDate; }
    public void setEventDate(Date eventDate) { this.eventDate = eventDate; }
    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }
    public String getTime() { return time; }
    public void setTime(String time) { this.time = time; }
    public String getStartTime() { return startTime; }
    public void setStartTime(String startTime) { this.startTime = startTime; }
    public String getEndTime() { return endTime; }
    public void setEndTime(String endTime) { this.endTime = endTime; }
    
    
}