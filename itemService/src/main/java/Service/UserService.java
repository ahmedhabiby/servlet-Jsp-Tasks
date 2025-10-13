package Service;

import java.sql.SQLException;
import model.User;

public interface UserService {
    User login(String username, String password) throws SQLException;
    boolean signup(User user) throws SQLException;
    boolean usernameExists(String username) throws SQLException;

    // ميزة نسيان كلمة المرور
    boolean updatePassword(String username, String newPassword) throws SQLException;

    // ميزة حذف الحساب
    boolean deleteAccount(String username, String password) throws SQLException;
}
