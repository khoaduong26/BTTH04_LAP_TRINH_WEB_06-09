package vn.iotstar.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.entity.User;
import vn.iotstar.services.UserService;
import vn.iotstar.services.impl.UserServiceImpl;

@WebServlet(urlPatterns = {"/forgot-password"})
public class ForgotPasswordController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/forgot-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        
        String step = req.getParameter("step");
        
        if ("verify".equals(step)) {
            handleVerifyStep(req, resp);
        } else if ("reset".equals(step)) {
            handleResetStep(req, resp);
        }
    }
    
    private void handleVerifyStep(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        
        if (!email.matches("^[a-zA-Z0-9._%+-]+@gmail\\.com$")) {
            req.setAttribute("alert", "Vui lòng nhập địa chỉ Gmail hợp lệ!");
            req.getRequestDispatcher("/forgot-password.jsp").forward(req, resp);
            return;
        }
        
        User user = userService.findByUsername(username);
        
        if (user == null) {
            req.setAttribute("alert", "Tên đăng nhập không tồn tại!");
            req.getRequestDispatcher("/forgot-password.jsp").forward(req, resp);
            return;
        }
        
        if (!email.equals(user.getEmail())) {
            req.setAttribute("alert", "Email không khớp với tài khoản này!");
            req.getRequestDispatcher("/forgot-password.jsp").forward(req, resp);
            return;
        }
        
        req.setAttribute("step", "reset");
        req.setAttribute("email", email);
        req.setAttribute("warning", "Thông tin xác minh thành công! Vui lòng nhập mật khẩu mới.");
        req.getRequestDispatcher("/forgot-password.jsp").forward(req, resp);
    }
    
    private void handleResetStep(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        String email = req.getParameter("email");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");
        
        if (!newPassword.equals(confirmPassword)) {
            req.setAttribute("step", "reset");
            req.setAttribute("email", email);
            req.setAttribute("alert", "Mật khẩu xác nhận không khớp!");
            req.getRequestDispatcher("/forgot-password.jsp").forward(req, resp);
            return;
        }
        
        if (newPassword.length() < 6) {
            req.setAttribute("step", "reset");
            req.setAttribute("email", email);
            req.setAttribute("alert", "Mật khẩu phải có ít nhất 6 ký tự!");
            req.getRequestDispatcher("/forgot-password.jsp").forward(req, resp);
            return;
        }
        
        User user = userService.findByEmail(email);
        if (user != null) {
            user.setPassword(newPassword);
            userService.update(user);
            
            req.setAttribute("success", "Đặt lại mật khẩu thành công! Vui lòng đăng nhập với mật khẩu mới.");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else {
            req.setAttribute("step", "reset");
            req.setAttribute("email", email);
            req.setAttribute("alert", "Có lỗi xảy ra. Vui lòng thử lại!");
            req.getRequestDispatcher("/forgot-password.jsp").forward(req, resp);
        }
    }
}