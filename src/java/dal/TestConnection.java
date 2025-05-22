/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import dal.DBContext;
import java.sql.Connection;

/**
 *
 * @author NGO VAN HAI
 */
public class TestConnection {
    public static void main(String[] args) {
        DBContext db = new DBContext();
        Connection conn = db.connection;

        if (conn != null) {
            System.out.println("Kết nối thành công đến database!");
        } else {
            System.out.println("Kết nối thất bại.");
        }
    }
}