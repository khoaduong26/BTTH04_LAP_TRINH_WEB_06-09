package vn.iotstar.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.services.UserService;
import vn.iotstar.services.impl.UserServiceImpl;

@WebServlet(urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String fullname = req.getParameter("fullname");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        
        if (!email.matches("^[a-zA-Z0-9._%+-]+@gmail\\.com$")) {
            req.setAttribute("alert", "Vui lòng nhập địa chỉ Gmail hợp lệ!");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }
        
        if (!phone.matches("^[0-9]{10}$")) {
            req.setAttribute("alert", "Số điện thoại phải có đúng 10 chữ số!");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }
        
        boolean isSuccess = userService.register(email, username, fullname, password, phone);
        
        if (isSuccess) {
            req.setAttribute("success", "Đăng ký thành công! Vui lòng đăng nhập với tài khoản mới.");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else {
            req.setAttribute("alert", "Email hoặc tên đăng nhập đã tồn tại!");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        }
    }
}