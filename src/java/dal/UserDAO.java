package dal;

import dal.DBContext;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private Connection conn;

    public UserDAO() {
        DBContext db = new DBContext();
        conn = db.connection;
    }

    // Hàm kiểm tra đăng nhập, trả về User nếu thành công, null nếu sai
    public User login(String email, String password) {
        String sql = "SELECT * FROM users WHERE Email = ? AND Password = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setFullName(rs.getString("FullName"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setPhone(rs.getString("Phone"));
                user.setAddress(rs.getString("Address"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    //Hàm đăng ký
    public boolean register(User user) {
        String sql = "INSERT INTO users (FullName, Email, Password, Phone, Address) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getAddress());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
