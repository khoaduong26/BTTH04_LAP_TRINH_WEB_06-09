<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập Hệ Thống</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary: #8B5FBF;
            --primary-hover: #764BA2;
            --secondary: #667eea;
            --success: #10B981;
            --danger: #EF4444;
            --light: #F8FAFC;
            --dark: #2D3748;
            --gray: #A0AEC0;
            --gradient-start: #8B5FBF;
            --gradient-end: #667eea;
            --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, var(--gradient-start) 0%, var(--gradient-end) 100%);
            color: var(--dark);
            line-height: 1.6;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
        }

        .back-link {
            position: absolute;
            top: 30px;
            left: 30px;
            z-index: 10;
        }

        .back-link a {
            color: white;
            text-decoration: none;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
            background: rgba(255, 255, 255, 0.2);
            padding: 10px 16px;
            border-radius: 50px;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .back-link a:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
        }

        .login-container {
            background: white;
            padding: 30px;
            border-radius: 16px;
            box-shadow: var(--card-shadow);
            width: 100%;
            max-width: 420px;
            transition: all 0.3s ease;
        }

        .login-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
        }

        .logo {
            text-align: center;
            margin-bottom: 25px;
        }

        .logo-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-hover) 100%);
            color: white;
            border-radius: 50%;
            font-size: 32px;
            margin-bottom: 15px;
            box-shadow: 0 4px 10px rgba(139, 95, 191, 0.4);
        }

        h2 {
            font-weight: 700;
            color: var(--dark);
            text-align: center;
            margin-bottom: 25px;
            font-size: 28px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-hover) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .alert {
            padding: 12px 16px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
            display: flex;
            align-items: center;
        }

        .alert-error {
            background-color: rgba(239, 68, 68, 0.1);
            color: var(--danger);
            border-left: 4px solid var(--danger);
        }

        .input-group {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            overflow: hidden;
            transition: all 0.3s ease;
            background: white;
        }

        .input-group:focus-within {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(139, 95, 191, 0.3);
        }

        .input-group span {
            padding: 15px;
            background-color: #f8fafc;
            color: var(--primary);
            font-size: 18px;
            width: 55px;
            text-align: center;
            border-right: 1px solid #e2e8f0;
        }

        .input-group input {
            border: none;
            padding: 15px;
            width: 100%;
            font-size: 16px;
            outline: none;
            background: white;
            color: var(--dark);
        }

        .input-group input::placeholder {
            color: var(--gray);
            font-size: 15px;
        }

        .login-button {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-hover) 100%);
            color: white;
            padding: 16px;
            width: 100%;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(139, 95, 191, 0.3);
        }

        .login-button:hover {
            background: linear-gradient(135deg, var(--primary-hover) 0%, var(--primary) 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(139, 95, 191, 0.4);
        }

        .links {
            text-align: center;
            margin-top: 20px;
            color: var(--dark);
            font-size: 15px;
            display: flex;
            justify-content: center;
            gap: 15px;
            flex-wrap: wrap;
        }

        .links a {
            color: var(--primary);
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .links a:hover {
            color: var(--primary-hover);
            text-decoration: underline;
        }

        /* Animation for form elements */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .login-container {
            animation: fadeIn 0.5s ease-out;
        }

        /* Responsive adjustments */
        @media (max-width: 576px) {
            .login-container {
                padding: 25px 20px;
            }
            
            .back-link {
                top: 20px;
                left: 20px;
            }
            
            h2 {
                font-size: 24px;
            }
            
            .links {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="back-link">
        <a href="${pageContext.request.contextPath}/topbar.jsp">
            <i class="fas fa-arrow-left"></i> Quay lại trang chủ
        </a>
    </div>

    <div class="login-container">
        <div class="logo">
            <div class="logo-icon">
                <i class="fas fa-lock"></i>
            </div>
        </div>
        
        <h2>Đăng Nhập Hệ Thống</h2>

        <c:if test="${not empty alert}">
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i>${alert}
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
                <i class="fas fa-user-plus"></i> Đăng ký tài khoản
            </a>
        </div>
    </div>

    <script>
        // Hiệu ứng loading khi submit form
        document.querySelector('form').addEventListener('submit', function() {
            const button = this.querySelector('button[type="submit"]');
            button.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang xử lý...';
            button.disabled = true;
        });
        
        // Hiệu ứng khi di chuột vào các input group
        const inputGroups = document.querySelectorAll('.input-group');
        inputGroups.forEach(group => {
            const input = group.querySelector('input');
            
            input.addEventListener('focus', () => {
                group.style.borderColor = '#8B5FBF';
                group.style.boxShadow = '0 0 0 3px rgba(139, 95, 191, 0.3)';
            });
            
            input.addEventListener('blur', () => {
                group.style.borderColor = '#e2e8f0';
                group.style.boxShadow = 'none';
            });
        });
    </script>
</body>
</html>