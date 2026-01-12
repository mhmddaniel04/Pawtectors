package com.pawtectors.dao;

import com.pawtectors.model.Cat;
import com.pawtectors.model.Event;
import com.pawtectors.model.AdoptionRequest;
import com.pawtectors.model.Message; 
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {
    private Connection conn;

    public AdminDAO() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            this.conn = DriverManager.getConnection("jdbc:derby://localhost:1527/pawtectors_db", "app", "app");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // --- PUBLIC VIEW (Events.jsp) ---
    public List<Event> getAllAnnouncements() throws Exception {
        List<Event> list = new ArrayList<>();
        String sql = "SELECT * FROM EVENTS ORDER BY EVENT_DATE ASC";
        SimpleDateFormat sdf = new SimpleDateFormat("MMM dd");

        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Event e = new Event();

                e.setId(rs.getInt("ID"));
                e.setTitle(rs.getString("TITLE"));

                Date dbDate = rs.getDate("EVENT_DATE");
                if (dbDate != null) {
                    e.setEventDate(dbDate);
                    e.setDate(sdf.format(dbDate));
                }

                e.setLocation(rs.getString("LOCATION"));
                e.setDescription(rs.getString("DESCRIPTION"));

                e.setStartTime(rs.getString("START_TIME"));
                e.setEndTime(rs.getString("END_TIME"));

                list.add(e);
            }
        }
        return list;
    }


    // --- UTILITIES ---
    public static byte[] toByteArray(InputStream is) throws Exception {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[16384];
        while ((nRead = is.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }
        buffer.flush();
        return buffer.toByteArray();
    }

    // --- CAT CRUD ---
    public List<Cat> getAllCats() throws Exception {
        List<Cat> list = new ArrayList<>();
        String sql = "SELECT * FROM CATS ORDER BY ID DESC";
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Cat c = new Cat();
                c.setId(rs.getInt("ID"));
                c.setName(rs.getString("NAME"));
                c.setBreed(rs.getString("BREED"));
                c.setAge(rs.getInt("AGE"));
                c.setGender(rs.getString("GENDER"));
                c.setShelterLocation(rs.getString("SHELTER_LOCATION"));
                c.setDateArrived(rs.getDate("DATE_ARRIVED"));
                c.setStatus(rs.getString("STATUS"));
                c.setDetails(rs.getString("DETAILS"));
                c.setImageData(rs.getBytes("IMAGE_DATA"));
                list.add(c);
            }
        }
        return list;
    }

    public void addCat(Cat cat) throws Exception {
        String sql = "INSERT INTO CATS (NAME, BREED, AGE, GENDER, SHELTER_LOCATION, DATE_ARRIVED, STATUS, DETAILS, IMAGE_DATA) VALUES (?,?,?,?,?,?,?,?,?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cat.getName());
            ps.setString(2, cat.getBreed());
            ps.setInt(3, cat.getAge());
            ps.setString(4, cat.getGender());
            ps.setString(5, cat.getShelterLocation());
            ps.setDate(6, cat.getDateArrived());
            ps.setString(7, cat.getStatus());
            ps.setString(8, cat.getDetails());
            ps.setBytes(9, cat.getImageData());
            ps.executeUpdate();
        }
    }

    public void updateCat(Cat cat) throws Exception {
        String sql = "UPDATE CATS SET NAME=?, BREED=?, AGE=?, GENDER=?, SHELTER_LOCATION=?, DATE_ARRIVED=?, STATUS=?, DETAILS=?, IMAGE_DATA=? WHERE ID=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cat.getName());
            ps.setString(2, cat.getBreed());
            ps.setInt(3, cat.getAge());
            ps.setString(4, cat.getGender());
            ps.setString(5, cat.getShelterLocation());
            ps.setDate(6, cat.getDateArrived());
            ps.setString(7, cat.getStatus());
            ps.setString(8, cat.getDetails());
            ps.setBytes(9, cat.getImageData());
            ps.setInt(10, cat.getId());
            ps.executeUpdate();
        }
    }

    public void updateCatStatus(int id, String status) throws Exception {
        String sql = "UPDATE CATS SET STATUS=? WHERE ID=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        }
    }

    public Cat getCatById(int id) {
        Cat cat = null;
        String sql = "SELECT * FROM CATS WHERE ID = ?"; 
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    cat = new Cat();
                    cat.setId(rs.getInt("ID"));
                    cat.setName(rs.getString("NAME"));
                    cat.setBreed(rs.getString("BREED"));
                    cat.setAge(rs.getInt("AGE")); 
                    cat.setGender(rs.getString("GENDER"));
                    cat.setShelterLocation(rs.getString("SHELTER_LOCATION"));
                    cat.setDateArrived(rs.getDate("DATE_ARRIVED"));
                    cat.setStatus(rs.getString("STATUS"));
                    cat.setDetails(rs.getString("DETAILS"));
                    byte[] imgBytes = rs.getBytes("IMAGE_DATA"); 
                    if (imgBytes != null) {
                        String base64Image = java.util.Base64.getEncoder().encodeToString(imgBytes);
                        cat.setBase64Image("data:image/jpeg;base64," + base64Image);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cat;
    }

    public void deleteCat(int id) throws Exception {
        String sql = "DELETE FROM CATS WHERE ID=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    // --- EVENT CRUD ---
    public List<Event> getAllEvents() throws Exception {
        List<Event> list = new ArrayList<>();
        String sql = "SELECT * FROM EVENTS ORDER BY ID DESC";
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Event e = new Event();
                e.setId(rs.getInt("ID"));
                e.setTitle(rs.getString("TITLE"));
                e.setEventDate(rs.getDate("EVENT_DATE"));
                e.setLocation(rs.getString("LOCATION"));
                e.setDescription(rs.getString("DESCRIPTION"));
                e.setStartTime(rs.getString("START_TIME"));
                e.setEndTime(rs.getString("END_TIME"));
                list.add(e);
            }
        }
        return list;
    }

    public void addEvent(Event e) throws Exception {
        String sql = "INSERT INTO EVENTS (TITLE, EVENT_DATE, LOCATION, DESCRIPTION, START_TIME, END_TIME) VALUES (?,?,?,?,?,?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, e.getTitle());
            ps.setDate(2, e.getEventDate());
            ps.setString(3, e.getLocation());
            ps.setString(4, e.getDescription());
            ps.setString(5, e.getStartTime());
            ps.setString(6, e.getEndTime());
            ps.executeUpdate();
        }
    }

    public void updateEvent(Event e) throws Exception {
        String sql = "UPDATE EVENTS SET TITLE=?, EVENT_DATE=?, LOCATION=?, DESCRIPTION=? WHERE ID=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, e.getTitle());
            ps.setDate(2, e.getEventDate());
            ps.setString(3, e.getLocation());
            ps.setString(4, e.getDescription());
            ps.setInt(5, e.getId());
            ps.executeUpdate();
        }
    }

    public void deleteEvent(int id) throws Exception {
        String sql = "DELETE FROM EVENTS WHERE ID=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
    
    // --- ADOPTION REQUESTS ---
    public void submitAdoptionRequest(AdoptionRequest ar) throws Exception {
        String sql = "INSERT INTO ADOPTION_REQUESTS (CAT_ID, USER_NAME, ORIGIN, GENDER, EMAIL, AGE, PICKUP_DATE, STATUS) VALUES (?,?,?,?,?,?,?,?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, ar.getCatId());
            ps.setString(2, ar.getUserName());
            ps.setString(3, ar.getOrigin());
            ps.setString(4, ar.getGender());
            ps.setString(5, ar.getEmail());
            ps.setInt(6, ar.getAge());
            ps.setDate(7, ar.getPickupDate());
            ps.setString(8, "Pending");
            ps.executeUpdate();
        }
    }

    public List<AdoptionRequest> getPendingRequests() throws Exception {
        List<AdoptionRequest> list = new ArrayList<>();
        String sql = "SELECT a.*, c.NAME as CAT_NAME FROM ADOPTION_REQUESTS a JOIN CATS c ON a.CAT_ID = c.ID WHERE a.STATUS = 'Pending'";
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                AdoptionRequest ar = new AdoptionRequest();
                ar.setId(rs.getInt("ID"));
                ar.setCatId(rs.getInt("CAT_ID"));
                ar.setCatName(rs.getString("CAT_NAME"));
                ar.setUserName(rs.getString("USER_NAME"));
                ar.setOrigin(rs.getString("ORIGIN"));
                ar.setEmail(rs.getString("EMAIL"));
                ar.setAge(rs.getInt("AGE"));
                ar.setPickupDate(rs.getDate("PICKUP_DATE"));
                ar.setRequestDate(rs.getDate("REQUEST_DATE")); 
                ar.setStatus(rs.getString("STATUS"));
                list.add(ar);
            }
        }
        return list;
    }

    public void updateRequestStatus(int requestId, String status) throws Exception {
        String sql = "UPDATE ADOPTION_REQUESTS SET STATUS = ? WHERE ID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, requestId);
            ps.executeUpdate();
        }
    }
    
    public AdoptionRequest getRequestById(int id) throws Exception {
        AdoptionRequest ar = null;
        String sql = "SELECT a.*, c.NAME as CAT_NAME FROM ADOPTION_REQUESTS a " +
                     "JOIN CATS c ON a.CAT_ID = c.ID WHERE a.ID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    ar = new AdoptionRequest();
                    ar.setId(rs.getInt("ID"));
                    ar.setCatId(rs.getInt("CAT_ID"));
                    ar.setCatName(rs.getString("CAT_NAME"));
                    ar.setUserName(rs.getString("USER_NAME"));
                    ar.setEmail(rs.getString("EMAIL"));
                    ar.setStatus(rs.getString("STATUS"));
                }
            }
        }
        return ar;
    }
    
    public List<AdoptionRequest> getRequestsByEmail(String email) throws Exception {
        List<AdoptionRequest> list = new ArrayList<>();
        String sql = "SELECT a.*, c.NAME as CAT_NAME FROM ADOPTION_REQUESTS a " +
                     "JOIN CATS c ON a.CAT_ID = c.ID WHERE a.EMAIL = ? ORDER BY a.ID DESC";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    AdoptionRequest ar = new AdoptionRequest();
                    ar.setCatName(rs.getString("CAT_NAME"));
                    ar.setStatus(rs.getString("STATUS"));
                    ar.setPickupDate(rs.getDate("PICKUP_DATE"));
                    list.add(ar);
                }
            }
        }
        return list;
    }

    // --- ADDED: INQUIRY/MESSAGE METHODS ---
    public List<Message> getMessages() throws Exception {
        List<Message> list = new ArrayList<>();

        String sql = "SELECT ID, NAME, EMAIL, MESSAGE, CREATED_AT FROM CONTACT_MESSAGES ORDER BY ID DESC";

        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Message m = new Message();
                m.setId(rs.getInt("ID"));
                m.setName(rs.getString("NAME"));
                m.setEmail(rs.getString("EMAIL"));
                m.setMessage(rs.getString("MESSAGE"));
                m.setCreatedAt(rs.getTimestamp("CREATED_AT"));

                list.add(m);
            }
        }
        return list;
    }


    public void deleteInquiry(int id) throws Exception {
        String sql = "DELETE FROM CONTACT_MESSAGES WHERE ID=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}