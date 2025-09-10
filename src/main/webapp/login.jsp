<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập Hệ Thống</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            padding: 40px 35px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.25);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            width: 100%;
            max-width: 400px;
            animation: fadeIn 0.6s ease-out;
        }

        .logo {
            text-align: center;
            margin-bottom: 25px;
        }

        .logo-icon {
            font-size: 50px;
            color: #fff;
            background: linear-gradient(135deg, #8B5FBF, #667eea);
            width: 90px;
            height: 90px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%;
            margin: 0 auto 15px;
            box-shadow: 0 6px 20px rgba(139,95,191,0.5);
        }

        h2 {
            text-align: center;
            font-size: 28px;
            color: #fff;
            margin-bottom: 25px;
            font-weight: 700;
        }

        .alert {
            padding: 12px 15px;
            border-radius: 10px;
            margin-bottom: 15px;
            font-size: 14px;
            background: rgba(255, 0, 0, 0.15);
            color: #ff6b6b;
            border-left: 4px solid #ff6b6b;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .input-group {
            display: flex;
            align-items: center;
            margin-bottom: 18px;
            border-radius: 12px;
            overflow: hidden;
            background: rgba(255,255,255,0.9);
            box-shadow: inset 0 2px 6px rgba(0,0,0,0.1);
        }

        .input-group span {
            padding: 12px;
            color: #764ba2;
            background: #f1f5f9;
            font-size: 18px;
        }

        .input-group input {
            border: none;
            padding: 14px;
            width: 100%;
            font-size: 16px;
            outline: none;
            background: transparent;
            color: #2d3748;
        }

        .login-button {
            background: linear-gradient(135deg, #8B5FBF, #667eea);
            color: #fff;
            padding: 14px;
            width: 100%;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 10px;
            box-shadow: 0 4px 12px rgba(139,95,191,0.4);
        }

        .login-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(139,95,191,0.6);
        }

        .links {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .links a {
            color: #fff;
            font-weight: 600;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 6px;
            transition: 0.3s;
        }

        .links a:hover {
            color: #ffd369;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="logo">
            <div class="logo-icon">
                <i class="fas fa-lock"></i>
            </div>
            <h2>Đăng Nhập</h2>
        </div>

        <c:if test="${not empty alert}">
            <div class="alert">
                <i class="fas fa-exclamation-circle"></i> ${alert}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="input-group">
                <span><i class="fas fa-user"></i></span>
                <input type="text" name="username" placeholder="Tên đăng nhập" required>
            </div>
            <div class="input-group">
                <span><i class="fas fa-lock"></i></span>
                <input type="password" name="password" placeholder="Mật khẩu" required>
            </div>
            <button type="submit" class="login-button">
                <i class="fas fa-sign-in-alt"></i> Đăng nhập
            </button>
        </form>

        <div class="links">
            <a href="${pageContext.request.contextPath}/forgot-password">
                <i class="fas fa-key"></i> Quên mật khẩu?
            </a>
            <a href="${pageContext.request.contextPath}/register">
                <i class="fas fa-user-plus"></i> Đăng ký
            </a>
        </div>
    </div>
</body>
</html>
