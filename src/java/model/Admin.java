package model;

import java.sql.Timestamp;

public class Admin {
    private int adminID;
    private String fullName;
    private String email;
    private String password;
    private String phone;
    private Timestamp createdAt;

    public Admin(int adminID, String fullName, String email, String password, String phone, Timestamp createdAt) {
        this.adminID = adminID;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.createdAt = createdAt;
    }

    // Getter & Setter methods...
}
