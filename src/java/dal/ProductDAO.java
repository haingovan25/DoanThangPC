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
public boolean deleteProductById(int id) {
    String sql = "DELETE FROM Products WHERE ProductID = ?";
    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, id);
        int rows = ps.executeUpdate();
        return rows > 0;
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}

public boolean addProduct(Product product) {
    String sql = "INSERT INTO Products (ProductName, Description, Price, CategoryID, ImageURL) VALUES (?, ?, ?, ?, ?)";
    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, product.getProductName());
        ps.setString(2, product.getDescription());
        ps.setDouble(3, product.getPrice());
        ps.setInt(4, product.getCategoryID());
        ps.setString(5, product.getImageURL());
        int rows = ps.executeUpdate();
        return rows > 0;
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}
    public boolean updateProduct(Product product) {
        String sql = "UPDATE Products SET ProductName = ?, Description = ?, Price = ?, CategoryID = ?, ImageURL = ? WHERE ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getCategoryID());
            ps.setString(5, product.getImageURL());
            ps.setInt(6, product.getProductID());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
