package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Model.Customer;
import util.DBConnection;

public class CustomerDAO {

	public Customer login(String username, String password) {
        Customer customer = null;
        String query = "SELECT * FROM customers WHERE username = ? AND password = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setUsername(rs.getString("username"));
                customer.setPassword(rs.getString("password"));
                customer.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customer;
    }

    // Phương thức tạo người dùng mới
    public boolean createCustomer(Customer customer) {
        String query = "INSERT INTO customers (username, password, email) VALUES (?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, customer.getUsername());
            statement.setString(2, customer.getPassword()); // Nên mã hóa mật khẩu
            statement.setString(3, customer.getEmail());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Phương thức kiểm tra xem email đã được đăng ký hay chưa
    public boolean isEmailRegistered(String email) {
        String query = "SELECT COUNT(*) FROM customers WHERE email = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0; // Trả về true nếu email tồn tại
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
