package filter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        HttpSession session = request.getSession(false);
        String path = request.getRequestURI();

        // ✅ Allow only login, signup, and static files without login
        boolean isLoginPage = path.endsWith("login.jsp") || path.contains("AuthController");
        boolean isSignupPage = path.endsWith("signup.jsp");
        boolean isStaticResource = path.contains("/css/") || path.contains("/js/") || path.contains("/images/");

        // Only these are public
        boolean allowedPublic = isLoginPage || isSignupPage || isStaticResource;

        // ✅ Check if user is logged in
        boolean loggedIn = (session != null && session.getAttribute("loggedUser") != null);

        if (loggedIn || allowedPublic) {
            chain.doFilter(req, res); // continue
        } else {
            // 🚫 Redirect unauthenticated users
            response.sendRedirect(request.getContextPath() + "/AuthController?action=loginPage");
        }
    }
}
