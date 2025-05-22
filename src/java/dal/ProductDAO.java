package dal;

import java.sql.*;
import java.util.*;
import model.Product;

public class ProductDAO extends DBContext {

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                    rs.getInt("ProductID"),
                    rs.getInt("CategoryID"),
                    rs.getString("ProductName"),
                    rs.getString("Description"),
                    rs.getDouble("Price"),
                    rs.getString("ImageURL")
                );
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Product> getProductsByCategory(int categoryId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE CategoryID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                    rs.getInt("ProductID"),
                    rs.getInt("CategoryID"),
                    rs.getString("ProductName"),
                    rs.getString("Description"),
                    rs.getDouble("Price"),
                    rs.getString("ImageURL")
                );
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Product> searchProductsByName(String name) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE ProductName LIKE ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                    rs.getInt("ProductID"),
                    rs.getInt("CategoryID"),
                    rs.getString("ProductName"),
                    rs.getString("Description"),
                    rs.getDouble("Price"),
                    rs.getString("ImageURL")
                );
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public Product getProductById(int id) {
        String sql = "SELECT * FROM Products WHERE ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Product(
                    rs.getInt("ProductID"),
                    rs.getInt("CategoryID"),
                    rs.getString("ProductName"),
                    rs.getString("Description"),
                    rs.getDouble("Price"),
                    rs.getString("ImageURL")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
