<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Welcome to Our Website</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --dark-gradient: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            --primary: #667eea;
            --secondary: #764ba2;
            --accent: #f093fb;
            --success: #4facfe;
            --danger: #ff6b6b;
            --warning: #feca57;
            --light: #f8f9fa;
            --dark: #2c3e50;
            --gray: #6c757d;
            --white: #ffffff;
            --shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            --shadow-hover: 0 15px 40px rgba(0, 0, 0, 0.15);
            --transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            --border-radius: 20px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', 'Inter', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
            min-height: 100vh;
            color: var(--dark);
            overflow-x: hidden;
        }

        /* Animated Background */
        .animated-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
            background-size: 400% 400%;
            animation: gradientAnimation 15s ease infinite;
        }

        .animated-bg::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.05'%3E%3Ccircle cx='30' cy='30' r='4'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E") repeat;
            animation: float 20s linear infinite;
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            100% { transform: translateY(-100px); }
        }

        /* Welcome Banner */
        .welcome-banner {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            margin: 20px;
            border-radius: var(--border-radius);
            padding: 60px 40px;
            text-align: center;
            box-shadow: var(--shadow);
            position: relative;
            overflow: hidden;
            animation: slideInFromTop 1s ease-out;
        }

        .welcome-banner::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: conic-gradient(from 0deg, transparent, rgba(102, 126, 234, 0.1), transparent);
            animation: rotate 20s linear infinite;
        }

        @keyframes rotate {
            100% { transform: rotate(360deg); }
        }

        @keyframes slideInFromTop {
            0% { opacity: 0; transform: translateY(-50px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        .welcome-banner h1 {
            font-family: 'Poppins', sans-serif;
            font-size: 3.5rem;
            font-weight: 800;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 20px;
            z-index: 2;
            position: relative;
            text-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .welcome-banner .subtitle {
            font-size: 1.3rem;
            color: var(--gray);
            margin-bottom: 30px;
            z-index: 2;
            position: relative;
            font-weight: 500;
        }

        .cta-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 40px;
            z-index: 2;
            position: relative;
            flex-wrap: wrap;
        }

        .cta-button {
            padding: 15px 30px;
            border: none;
            border-radius: 50px;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: var(--transition);
            font-size: 16px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
        }

        .cta-primary {
            background: var(--primary-gradient);
            color: white;
        }

        .cta-secondary {
            background: var(--secondary-gradient);
            color: white;
        }

        .cta-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.6s;
        }

        .cta-button:hover::before {
            left: 100%;
        }

        .cta-button:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: var(--shadow-hover);
        }

        /* Navigation Bar */
        .main-navbar {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            margin: 20px;
            border-radius: var(--border-radius);
            padding: 20px 30px;
            box-shadow: var(--shadow);
            animation: slideInFromLeft 1s ease-out 0.3s both;
        }

        @keyframes slideInFromLeft {
            0% { opacity: 0; transform: translateX(-50px); }
            100% { opacity: 1; transform: translateX(0); }
        }

        .navbar-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .nav-links {
            display: flex;
            list-style: none;
            gap: 25px;
            align-items: center;
            flex-wrap: wrap;
        }

        .nav-link {
            color: var(--dark);
            text-decoration: none;
            font-weight: 500;
            padding: 12px 20px;
            border-radius: 15px;
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 8px;
            position: relative;
            overflow: hidden;
        }

        .nav-link::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 0;
            height: 100%;
            background: var(--primary-gradient);
            transition: width 0.3s ease;
            z-index: -1;
        }

        .nav-link:hover::before {
            width: 100%;
        }

        .nav-link:hover {
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3);
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 12px 20px;
            background: var(--primary-gradient);
            border-radius: 15px;
            color: white;
            font-weight: 500;
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3);
        }

        .user-avatar {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 18px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            transition: var(--transition);
        }

        .user-avatar:hover {
            transform: scale(1.1) rotate(10deg);
        }

        /* Contact & Social Section */
        .contact-social {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            margin: 20px;
            border-radius: var(--border-radius);
            padding: 30px;
            box-shadow: var(--shadow);
            animation: slideInFromRight 1s ease-out 0.6s both;
        }

        @keyframes slideInFromRight {
            0% { opacity: 0; transform: translateX(50px); }
            100% { opacity: 1; transform: translateX(0); }
        }

        .contact-social h3 {
            text-align: center;
            font-size: 2rem;
            font-weight: 700;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 30px;
        }

        .contact-info {
            display: flex;
            justify-content: space-around;
            align-items: center;
            flex-wrap: wrap;
            gap: 30px;
            margin-bottom: 30px;
        }

        .contact-item {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 15px 25px;
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(240, 147, 251, 0.1));
            border-radius: 15px;
            transition: var(--transition);
            border: 1px solid rgba(102, 126, 234, 0.2);
        }

        .contact-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.2);
        }

        .contact-icon {
            width: 50px;
            height: 50px;
            background: var(--primary-gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 20px;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 rgba(102, 126, 234, 0.4); }
            70% { box-shadow: 0 0 0 10px rgba(102, 126, 234, 0); }
            100% { box-shadow: 0 0 0 0 rgba(102, 126, 234, 0); }
        }

        .contact-text {
            font-weight: 500;
            color: var(--dark);
        }

        .social-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .social-link {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 24px;
            text-decoration: none;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }

        .social-link::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border-radius: 50%;
            transform: scale(0);
            transition: transform 0.3s ease;
        }

        .social-link:hover::before {
            transform: scale(1);
        }

        .facebook {
            background: linear-gradient(135deg, #3b5998, #4267B2);
        }

        .facebook:hover {
            transform: translateY(-5px) rotate(10deg);
            box-shadow: 0 10px 25px rgba(59, 89, 152, 0.4);
        }

        .instagram {
            background: linear-gradient(135deg, #E4405F, #F77737, #FCAF45);
        }

        .instagram:hover {
            transform: translateY(-5px) rotate(-10deg);
            box-shadow: 0 10px 25px rgba(228, 64, 95, 0.4);
        }

        .tiktok {
            background: linear-gradient(135deg, #000000, #ff0050);
        }

        .tiktok:hover {
            transform: translateY(-5px) scale(1.1);
            box-shadow: 0 10px 25px rgba(255, 0, 80, 0.4);
        }

        /* Features Grid */
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin: 20px;
            animation: fadeInUp 1s ease-out 0.9s both;
        }

        @keyframes fadeInUp {
            0% { opacity: 0; transform: translateY(30px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        .feature-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            padding: 30px;
            border-radius: var(--border-radius);
            text-align: center;
            transition: var(--transition);
            box-shadow: var(--shadow);
            position: relative;
            overflow: hidden;
        }

        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: var(--primary-gradient);
        }

        .feature-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: var(--shadow-hover);
        }

        .feature-icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 20px;
            background: var(--primary-gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 30px;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .feature-card h4 {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 15px;
            color: var(--dark);
        }

        .feature-card p {
            color: var(--gray);
            line-height: 1.6;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .welcome-banner {
                margin: 15px;
                padding: 40px 20px;
            }

            .welcome-banner h1 {
                font-size: 2.5rem;
            }

            .main-navbar {
                margin: 15px;
                padding: 20px;
            }

            .navbar-content {
                flex-direction: column;
                gap: 15px;
            }

            .nav-links {
                justify-content: center;
                gap: 15px;
            }

            .contact-social {
                margin: 15px;
                padding: 20px;
            }

            .contact-info {
                flex-direction: column;
                gap: 20px;
            }

            .features-grid {
                margin: 15px;
                grid-template-columns: 1fr;
            }

            .cta-buttons {
                flex-direction: column;
                align-items: center;
            }
        }

        /* Loading Animation */
        .loading-spinner {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 60px;
            height: 60px;
            border: 6px solid rgba(102, 126, 234, 0.1);
            border-top: 6px solid var(--primary);
            border-radius: 50%;
            animation: spin 1s linear infinite;
            z-index: 1000;
        }

        @keyframes spin {
            0% { transform: translate(-50%, -50%) rotate(0deg); }
            100% { transform: translate(-50%, -50%) rotate(360deg); }
        }
    </style>
</head>
<body>
    <!-- Animated Background -->
    <div class="animated-bg"></div>

    <!-- Loading Spinner (hidden after page load) -->
    <div class="loading-spinner" id="loadingSpinner"></div>

    <!-- Welcome Banner -->
    <div class="welcome-banner">
        <h1>🌟 Chào Mừng Đến Website Của Chúng Tôi! 🌟</h1>
        <p class="subtitle">Khám phá thế giới công nghệ hiện đại với những trải nghiệm tuyệt vời nhất</p>
        
        <div class="cta-buttons">
            <a href="#features" class="cta-button cta-primary">
                <i class="fas fa-rocket"></i>
                Khám Phá Ngay
            </a>
            <a href="#contact" class="cta-button cta-secondary">
                <i class="fas fa-star"></i>
                Tham Gia Với Chúng Tôi
            </a>
        </div>
    </div>

    <!-- Main Navigation -->
    <nav class="main-navbar">
        <div class="navbar-content">
            <ul class="nav-links">
                <c:choose>
                    <c:when test="${empty sessionScope.account}">
                        <li>
                            <a href="${pageContext.request.contextPath}/login" class="nav-link">
                                <i class="fas fa-sign-in-alt"></i>
                                Đăng Nhập
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/register" class="nav-link">
                                <i class="fas fa-user-plus"></i>
                                Đăng Ký
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="${pageContext.request.contextPath}/profile" class="nav-link">
                                <i class="fas fa-user-circle"></i>
                                Hồ Sơ
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/dashboard" class="nav-link">
                                <i class="fas fa-tachometer-alt"></i>
                                Dashboard
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/logout" class="nav-link" 
                               onclick="return confirm('Bạn có chắc muốn đăng xuất?')">
                                <i class="fas fa-sign-out-alt"></i>
                                Đăng Xuất
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>

            <c:if test="${not empty sessionScope.account}">
                <div class="user-info">
                    <div class="user-avatar">
                        ${sessionScope.account.fullname.charAt(0)}
                    </div>
                    <div>
                        <div>Xin chào, <strong>${sessionScope.account.fullname}</strong>!</div>
                        <small>Chúc bạn một ngày tốt lành ✨</small>
                    </div>
                </div>
            </c:if>
        </div>
    </nav>

    <!-- Contact & Social Section -->
    <section class="contact-social" id="contact">
        <h3>🤝 Kết Nối Với Chúng Tôi</h3>
        
        <div class="contact-info">
            <div class="contact-item">
                <div class="contact-icon">
                    <i class="fas fa-envelope"></i>
                </div>
                <div class="contact-text">
                    <strong>Email:</strong><br>
                    phamngochuu3101@gmail.com
                </div>
            </div>
            
            <div class="contact-item">
                <div class="contact-icon">
                    <i class="fas fa-phone"></i>
                </div>
                <div class="contact-text">
                    <strong>Hotline:</strong><br>
                    0564789567
                </div>
            </div>
        </div>

        <div class="social-links">
            <a href="https://www.facebook.com/huu.phamngoc.52" target="_blank" class="social-link facebook">
                <i class="fab fa-facebook-f"></i>
            </a>
            <a href="https://www.instagram.com/nqochuuwx/" target="_blank" class="social-link instagram">
                <i class="fab fa-instagram"></i>
            </a>
            <a href="https://www.tiktok.com/@ngochuu_" target="_blank" class="social-link tiktok">
                <i class="fab fa-tiktok"></i>
            </a>
        </div>
    </section>

    <!-- Features Grid -->
    <div class="features-grid" id="features">
        <div class="feature-card">
            <div class="feature-icon">
                <i class="fas fa-shield-alt"></i>
            </div>
            <h4>Bảo Mật Tuyệt Đối</h4>
            <p>Hệ thống bảo mật hiện đại với công nghệ mã hóa tiên tiến, đảm bảo an toàn thông tin người dùng 100%.</p>
        </div>
        
        <div class="feature-card">
            <div class="feature-icon">
                <i class="fas fa-lightning-bolt"></i>
            </div>
            <h4>Tốc Độ Vượt Trội</h4>
            <p>Tối ưu hóa hiệu suất với tốc độ tải trang siêu nhanh, mang đến trải nghiệm mượt mà nhất.</p>
        </div>
        
        <div class="feature-card">
            <div class="feature-icon">
                <i class="fas fa-users"></i>
            </div>
            <h4>Cộng Đồng Sôi Nổi</h4>
            <p>Tham gia cộng đồng hàng triệu người dùng, chia sẻ kinh nghiệm và học hỏi từ những chuyên gia.</p>
        </div>
        
        <div class="feature-card">
            <div class="feature-icon">
                <i class="fas fa-mobile-alt"></i>
            </div>
            <h4>Responsive Design</h4>
            <p>Giao diện thích ứng hoàn hảo trên mọi thiết bị từ desktop, tablet đến smartphone.</p>
        </div>
    </div>

    <script>
        // Hide loading spinner after page load
        window.addEventListener('load', function() {
            const spinner = document.getElementById('loadingSpinner');
            spinner.style.opacity = '0';
            setTimeout(() => {
                spinner.style.display = 'none';
            }, 500);
        });

        // Smooth scrolling for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });

        // Add hover effects to feature cards
        document.querySelectorAll('.feature-card').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.background = 'rgba(102, 126, 234, 0.05)';
            });
            
            card.addEventListener('mouseleave', function() {
                this.style.background = 'rgba(255, 255, 255, 0.95)';
            });
        });

        // Add click animation to buttons
        document.querySelectorAll('.cta-button, .nav-link, .social-link').forEach(button => {
            button.addEventListener('click', function() {
                this.style.transform = 'scale(0.95)';
                setTimeout(() => {
                    this.style.transform = '';
                }, 150);
            });
        });

        // Parallax effect for banner
        window.addEventListener('scroll', function() {
            const scrolled = window.pageYOffset;
            const banner = document.querySelector('.welcome-banner');
            if (banner) {
                banner.style.transform = `translateY(${scrolled * 0.5}px)`;
            }
        });

        // Add typing effect to welcome text
        function typeWriter(text, element, speed = 50) {
            let i = 0;
            element.innerHTML = '';
            function type() {
                if (i < text.length) {
                    element.innerHTML += text.charAt(i);
                    i++;
                    setTimeout(type, speed);
                }
            }
            type();
        }

        // Initialize typing effect after page load
        window.addEventListener('load', function() {
            setTimeout(() => {
                const subtitle = document.querySelector('.subtitle');
                if (subtitle) {
                    const originalText = subtitle.innerText;
                    typeWriter(originalText, subtitle, 30);
                }
            }, 1000);
        });

        // Add floating animation to social icons
        document.querySelectorAll('.social-link').forEach((link, index) => {
            link.style.animationDelay = `${index * 0.2}s`;
            link.style.animation = 'bounce 3s infinite';
        });

        // Random color change for user avatar
        const userAvatar = document.querySelector('.user-avatar');
        if (userAvatar) {
            const colors = [
                'linear-gradient(135deg, #667eea, #764ba2)',
                'linear-gradient(135deg, #f093fb, #f5576c)',
                'linear-gradient(135deg, #4facfe, #00f2fe)',
                'linear-gradient(135deg, #43e97b, #38f9d7)',
                'linear-gradient(135deg, #fa709a, #fee140)'
            ];
            
            userAvatar.addEventListener('click', function() {
                const randomColor = colors[Math.floor(Math.random() * colors.length)];
                this.style.background = randomColor;
            });
        }

        // Add particle effect on hover for banner
        const banner = document.querySelector('.welcome-banner');
        if (banner) {
            banner.addEventListener('mousemove', function(e) {
                const particle = document.createElement('div');
                particle.style.position = 'absolute';
                particle.style.left = e.clientX - this.offsetLeft + 'px';
                particle.style.top = e.clientY - this.offsetTop + 'px';
                particle.style.width = '4px';
                particle.style.height = '4px';
                particle.style.background = 'rgba(102, 126, 234, 0.6)';
                particle.style.borderRadius = '50%';
                particle.style.pointerEvents = 'none';
                particle.style.animation = 'particleFloat 2s ease-out forwards';
                
                this.appendChild(particle);
                
                setTimeout(() => {
                    if (particle.parentNode) {
                        particle.parentNode.removeChild(particle);
                    }
                }, 2000);
            });
        }

        // Add CSS for particle animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes particleFloat {
                0% {
                    opacity: 1;
                    transform: translateY(0) scale(1);
                }
                100% {
                    opacity: 0;
                    transform: translateY(-50px) scale(0);
                }
            }
        `;
        document.head.appendChild(style);

        // Console greeting
        console.log('%c🌟 Welcome to our awesome website! 🌟', 'color: #667eea; font-size: 20px; font-weight: bold;');
        console.log('%cDeveloped with ❤️ by Ngoc Huu', 'color: #764ba2; font-size: 14px;');
    </script>
</body>
</html>