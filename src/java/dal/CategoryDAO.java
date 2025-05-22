package dal;

import model.Category;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO extends DBContext {

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
            String sql = "SELECT CategoryID, CategoryName FROM Categories ORDER BY CategoryID ASC";
            try {
                PreparedStatement ps = connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Category c = new Category(rs.getInt("CategoryID"), rs.getString("CategoryName"));
                    list.add(c);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return list;

    }
}
