package Controller;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.DataSource;

import ItemServiceImpl.UserServiceImpl;
import Service.UserService;
import model.User;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AuthController")
public class AuthController extends HttpServlet {

    @Resource(name = "jdbc/connection")
    private DataSource dataSource;

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl(dataSource);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "loginPage";

        HttpSession session = request.getSession(false);
        if ((session != null && session.getAttribute("loggedUser") != null)
                && !action.equals("logout")) {
            response.sendRedirect("ItemController?action=show-items");
            return;
        }

        switch (action) {
            case "loginPage":
                request.getRequestDispatcher("login.jsp").forward(request, response);
                break;

            case "signupPage":
                request.getRequestDispatcher("signup.jsp").forward(request, response);
                break;

            case "forgetPasswordPage":
                request.getRequestDispatcher("forget-password.jsp").forward(request, response);
                break;

            case "deleteAccountPage":
                request.getRequestDispatcher("delete-account.jsp").forward(request, response);
                break;

            case "logout":
                doLogout(request, response);
                break;

            default:
                response.sendRedirect("AuthController?action=loginPage");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("doLogin".equals(action)) {
                doLogin(request, response);
            } else if ("doSignup".equals(action)) {
                doSignup(request, response);
            } else if ("doForgetPassword".equals(action)) {
                doForgetPassword(request, response);
            } else if ("doDeleteAccount".equals(action)) {
                doDeleteAccount(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error: " + e.getMessage(), e);
        }
    }

    private void doLogin(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException, SQLException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userService.login(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loggedUser", user);

            Cookie cookie = new Cookie("user", username);
            cookie.setMaxAge(24 * 60 * 60);
            cookie.setHttpOnly(true);
            cookie.setPath("/");
            response.addCookie(cookie);

            response.sendRedirect("ItemController?action=show-items");
        } else {
            request.setAttribute("error", "Invalid username or password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private void doSignup(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean success = false;

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        User user = new User(username, password, email);

        try {
            success = userService.signup(user);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while creating the account.");
        }

        if (success) {
            request.setAttribute("success", "Account created successfully! Please login.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Failed to create account. Username or email might already exist.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }

    private void doForgetPassword(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException, SQLException {

        String username = request.getParameter("username");
        String newPassword = request.getParameter("newPassword");

        if (userService.updatePassword(username, newPassword)) {
            request.setAttribute("success", "Password updated successfully! Please login.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Username not found!");
            request.getRequestDispatcher("forget-password.jsp").forward(request, response);
        }
    }

    private void doDeleteAccount(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException, SQLException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (userService.deleteAccount(username, password)) {
            HttpSession session = request.getSession(false);
            if (session != null) session.invalidate();

            Cookie cookie = new Cookie("user", "");
            cookie.setMaxAge(0);
            cookie.setPath("/");
            response.addCookie(cookie);

            request.setAttribute("success", "Account deleted successfully!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Invalid username or password!");
            request.getRequestDispatcher("delete-account.jsp").forward(request, response);
        }
    }

    private void doLogout(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);
        if (session != null) session.invalidate();

        Cookie cookie = new Cookie("user", "");
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);

        response.sendRedirect("AuthController?action=loginPage");
    }
}
