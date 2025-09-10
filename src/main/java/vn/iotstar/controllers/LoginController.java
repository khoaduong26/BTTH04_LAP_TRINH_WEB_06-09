package vn.iotstar.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.entity.User;
import vn.iotstar.services.UserService;
import vn.iotstar.services.impl.UserServiceImpl;

@WebServlet(urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        User user = userService.login(username, password);
        
        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("account", user);
            
            String roleid = user.getRoleid();
            switch (roleid) {
                case "1": // User
                    resp.sendRedirect(req.getContextPath() + "/user/home");
                    break;
                case "2": // Manager
                    resp.sendRedirect(req.getContextPath() + "/manager/home");
                    break;
                case "3": // Admin
                    resp.sendRedirect(req.getContextPath() + "/admin/home");
                    break;
                default:
                    resp.sendRedirect(req.getContextPath() + "/user/home");
            }
        } else {
            req.setAttribute("alert", "Tên đăng nhập hoặc mật khẩu không đúng!");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }
}