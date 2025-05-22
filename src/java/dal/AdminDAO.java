package dal;

import java.sql.*;
import model.Admin;

public class AdminDAO extends DBContext {
    public Admin login(String email, String password) {
        String sql = "SELECT * FROM Admins WHERE Email = ? AND Password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Admin(
                    rs.getInt("AdminID"),
                    rs.getString("FullName"),
                    rs.getString("Email"),
                    rs.getString("Password"),
                    rs.getString("Phone"),
                    rs.getTimestamp("CreatedAt")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
