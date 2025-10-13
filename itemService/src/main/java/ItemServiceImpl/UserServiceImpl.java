package ItemServiceImpl;

import javax.sql.DataSource;
import java.sql.*;
import Service.UserService;
import model.User;

public class UserServiceImpl implements UserService {

    private final DataSource dataSource;

    public UserServiceImpl(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public User login(String username, String password) throws SQLException {
        try (Connection connection = dataSource.getConnection()) {
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                    rs.getInt("id"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("email")
                );
            }
        }
        return null;
    }

    @Override
    public boolean signup(User user) throws SQLException {
        if (usernameExists(user.getUsername())) {
            return false; // المستخدم موجود مسبقاً
        }
        try (Connection connection = dataSource.getConnection()) {
            String sql = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail()); // ✅ تم تصحيح الرقم هنا
            return ps.executeUpdate() > 0;
        }
    }

    @Override
    public boolean usernameExists(String username) throws SQLException {
        try (Connection connection = dataSource.getConnection()) {
            String sql = "SELECT id FROM users WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
    }

    @Override
    public boolean updatePassword(String username, String newPassword) throws SQLException {
        try (Connection connection = dataSource.getConnection()) {
            String sql = "UPDATE users SET password = ? WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, username);
            return ps.executeUpdate() > 0;
        }
    }

    @Override
    public boolean deleteAccount(String username, String password) throws SQLException {
        try (Connection connection = dataSource.getConnection()) {
            String sql = "DELETE FROM users WHERE username = ? AND password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            return ps.executeUpdate() > 0;
        }
    }
}
