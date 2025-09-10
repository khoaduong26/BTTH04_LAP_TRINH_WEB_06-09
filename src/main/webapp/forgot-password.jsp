<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quên Mật Khẩu</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<style>
:root {
	--primary: #8B5FBF;
	--primary-hover: #764BA2;
	--secondary: #667eea;
	--success: #10B981;
	--danger: #EF4444;
	--warning: #F59E0B;
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
	font-family: 'Inter', sans-serif;
	background: linear-gradient(135deg, var(--gradient-start) 0%,
		var(--gradient-end) 100%);
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

.auth-wrapper {
	width: 100%;
	max-width: 450px;
	z-index: 2;
	position: relative;
}

.auth-card {
	background: rgba(255, 255, 255, 0.95);
	backdrop-filter: blur(10px);
	border-radius: 16px;
	box-shadow: var(--card-shadow);
	padding: 40px 32px;
	transition: all 0.3s ease;
	border: 1px solid rgba(255, 255, 255, 0.2);
}

.auth-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
}

.logo {
	text-align: center;
	margin-bottom: 24px;
}

.logo-icon {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 70px;
	height: 70px;
	background: linear-gradient(135deg, var(--warning) 0%, #F59E0B 100%);
	color: white;
	border-radius: 50%;
	font-size: 32px;
	margin-bottom: 16px;
	box-shadow: 0 4px 10px rgba(245, 158, 11, 0.4);
	animation: pulse 2s infinite;
}

@
keyframes pulse { 0% {
	box-shadow: 0 4px 10px rgba(245, 158, 11, 0.4);
}

50
%
{
box-shadow
:
0
4px
20px
rgba(
245
,
158
,
11
,
0.6
);
}
100
%
{
box-shadow
:
0
4px
10px
rgba(
245
,
158
,
11
,
0.4
);
}
}
h2 {
	font-weight: 700;
	color: var(--dark);
	text-align: center;
	margin-bottom: 16px;
	font-size: 26px;
	background: linear-gradient(135deg, var(--warning) 0%, #F59E0B 100%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	background-clip: text;
}

.subtitle {
	text-align: center;
	color: var(--gray);
	margin-bottom: 24px;
	font-size: 14px;
	line-height: 1.5;
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

.alert-success {
	background-color: rgba(16, 185, 129, 0.1);
	color: var(--success);
	border-left: 4px solid var(--success);
}

.alert-warning {
	background-color: rgba(245, 158, 11, 0.1);
	color: var(--warning);
	border-left: 4px solid var(--warning);
}

.alert i {
	margin-right: 10px;
	font-size: 18px;
}

.form-group {
	margin-bottom: 20px;
	position: relative;
}

.input-group {
	position: relative;
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
	transition: all 0.3s ease;
	display: flex;
	align-items: stretch;
}

.input-group:focus-within {
	box-shadow: 0 0 0 3px rgba(245, 158, 11, 0.3);
	transform: translateY(-2px);
}

.input-group-prepend {
	display: flex;
	align-items: center;
}

.input-group-text {
	width: 50px;
	justify-content: center;
	background-color: white;
	border: none;
	color: var(--warning);
	font-size: 18px;
	display: flex;
	align-items: center;
	padding: 0;
	height: 100%;
}

.form-control {
	border: none;
	border-left: 1px solid #eee;
	padding: 15px;
	height: 55px;
	font-size: 16px;
	transition: all 0.3s ease;
	flex: 1;
	color: var(--dark);
}

.form-control:focus {
	box-shadow: none;
	border-color: #eee;
	outline: none;
}

.form-control::placeholder {
	color: var(--gray);
	font-size: 15px;
}

.password-toggle {
	position: absolute;
	right: 15px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
	color: var(--gray);
	z-index: 5;
	background: none;
	border: none;
	font-size: 18px;
	height: 100%;
	display: flex;
	align-items: center;
}

.btn-submit {
	background: linear-gradient(135deg, var(--warning) 0%, #F59E0B 100%);
	border: none;
	color: white;
	padding: 16px;
	font-weight: 600;
	border-radius: 12px;
	margin-top: 10px;
	transition: all 0.3s ease;
	box-shadow: 0 4px 6px rgba(245, 158, 11, 0.3);
	width: 100%;
	font-size: 16px;
	cursor: pointer;
}

.btn-submit:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 12px rgba(245, 158, 11, 0.4);
	background: linear-gradient(135deg, #F59E0B 0%, var(--warning) 100%);
}

.btn-submit:disabled {
	opacity: 0.6;
	cursor: not-allowed;
	transform: none;
	box-shadow: 0 4px 6px rgba(245, 158, 11, 0.3);
}

.links {
	text-align: center;
	margin-top: 25px;
	color: var(--dark);
	font-size: 15px;
}

.links a {
	color: var(--primary);
	font-weight: 600;
	text-decoration: none;
	transition: all 0.3s ease;
	margin: 0 5px;
}

.links a:hover {
	color: var(--primary-hover);
	text-decoration: underline;
}

.step-indicator {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 30px;
	gap: 10px;
}

.step {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 12px;
	font-weight: 600;
	transition: all 0.3s ease;
}

.step.active {
	background: var(--warning);
	color: white;
}

.step.inactive {
	background: #e5e7eb;
	color: var(--gray);
}

.step-line {
	width: 40px;
	height: 2px;
	background: #e5e7eb;
}

.step-line.active {
	background: var(--warning);
}

/* Animation for form elements */
@
keyframes fadeIn {from { opacity:0;
	transform: translateY(10px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.auth-card {
	animation: fadeIn 0.5s ease-out;
}

/* Responsive adjustments */
@media ( max-width : 576px) {
	.auth-card {
		padding: 24px 20px;
	}
	.back-link {
		top: 20px;
		left: 20px;
	}
	h2 {
		font-size: 22px;
	}
}
</style>
</head>
<body>
	<div class="back-link">
		<a href="${pageContext.request.contextPath}/"> <i
			class="fas fa-home"></i> Quay lại trang chủ
		</a>
	</div>

	<div class="auth-wrapper">
		<div class="auth-card">
			<div class="logo">
				<div class="logo-icon">
					<i class="fas fa-key"></i>
				</div>
			</div>

			<h2>Quên Mật Khẩu</h2>
			<p class="subtitle">Nhập thông tin để đặt lại mật khẩu của bạn</p>

			<!-- Step Indicator -->
			<div class="step-indicator">
				<div class="step active">1</div>
				<div class="step-line"></div>
				<div class="step inactive">2</div>
			</div>

			<c:if test="${not empty alert}">
				<div class="alert alert-error">
					<i class="fas fa-exclamation-circle"></i>${alert}
				</div>
			</c:if>

			<c:if test="${not empty success}">
				<div class="alert alert-success">
					<i class="fas fa-check-circle"></i>${success}
				</div>
			</c:if>

			<c:if test="${not empty warning}">
				<div class="alert alert-warning">
					<i class="fas fa-info-circle"></i>${warning}
				</div>
			</c:if>

			<form action="${pageContext.request.contextPath}/forgot-password"
				method="post" id="forgotPasswordForm">
				<c:choose>
					<c:when test="${step == 'reset'}">
						<!-- Step 2: Reset Password -->
						<input type="hidden" name="step" value="reset">
						<input type="hidden" name="email" value="${email}">

						<!-- New Password -->
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-lock"></i></span>
								</div>
								<input type="password" name="newPassword" class="form-control"
									placeholder="Mật khẩu mới" minlength="6" required>
								<button type="button" class="password-toggle"
									id="toggleNewPassword">
									<i class="far fa-eye"></i>
								</button>
							</div>
						</div>

						<!-- Confirm Password -->
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-lock"></i></span>
								</div>
								<input type="password" name="confirmPassword"
									class="form-control" placeholder="Xác nhận mật khẩu mới"
									minlength="6" required>
								<button type="button" class="password-toggle"
									id="toggleConfirmPassword">
									<i class="far fa-eye"></i>
								</button>
							</div>
						</div>

						<button type="submit" class="btn-submit">
							<i class="fas fa-save"></i> Đặt lại mật khẩu
						</button>
					</c:when>
					<c:otherwise>
						<!-- Step 1: Enter Email and Username -->
						<input type="hidden" name="step" value="verify">

						<!-- Email -->
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i
										class="fas fa-envelope"></i></span>
								</div>
								<input type="email" name="email" class="form-control"
									placeholder="Địa chỉ email"
									pattern="[a-z0-9._%+-]+@gmail\.com$"
									title="Vui lòng nhập địa chỉ Gmail hợp lệ (ví dụ: example@gmail.com)"
									required>
							</div>
						</div>

						<!-- Username -->
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input type="text" name="username" class="form-control"
									placeholder="Tên đăng nhập" required>
							</div>
						</div>

						<button type="submit" class="btn-submit">
							<i class="fas fa-search"></i> Xác minh thông tin
						</button>
					</c:otherwise>
				</c:choose>
			</form>

			<div class="links">
				<a href="${pageContext.request.contextPath}/login"> <i
					class="fas fa-arrow-left"></i> Quay lại đăng nhập
				</a> | <a href="${pageContext.request.contextPath}/register"> <i
					class="fas fa-user-plus"></i> Đăng ký tài khoản
				</a>
			</div>
		</div>
	</div>

	<script>
        // Password toggle functionality
        document.querySelectorAll('.password-toggle').forEach(toggle => {
            toggle.addEventListener('click', function() {
                const passwordInput = this.parentNode.querySelector('input[type="password"], input[type="text"]');
                const icon = this.querySelector('i');
                
                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                    icon.classList.remove('fa-eye');
                    icon.classList.add('fa-eye-slash');
                } else {
                    passwordInput.type = 'password';
                    icon.classList.remove('fa-eye-slash');
                    icon.classList.add('fa-eye');
                }
            });
        });

        // Form submission with loading effect
        document.getElementById('forgotPasswordForm').addEventListener('submit', function(e) {
            const submitBtn = this.querySelector('button[type="submit"]');
            const step = this.querySelector('input[name="step"]').value;
            
            // Validate confirm password if in reset step
            if (step === 'reset') {
                const newPassword = this.querySelector('input[name="newPassword"]').value;
                const confirmPassword = this.querySelector('input[name="confirmPassword"]').value;
                
                if (newPassword !== confirmPassword) {
                    e.preventDefault();
                    alert('Mật khẩu xác nhận không khớp!');
                    return;
                }
            }
            
            if (step === 'verify') {
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang xác minh...';
            } else {
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang cập nhật...';
            }
            submitBtn.disabled = true;
        });
        
        // Input group focus effects
        const inputGroups = document.querySelectorAll('.input-group');
        inputGroups.forEach(group => {
            const input = group.querySelector('input');
            
            input.addEventListener('focus', () => {
                group.style.boxShadow = '0 0 0 3px rgba(245, 158, 11, 0.3)';
                group.style.transform = 'translateY(-2px)';
            });
            
            input.addEventListener('blur', () => {
                group.style.boxShadow = '0 2px 5px rgba(0, 0, 0, 0.05)';
                group.style.transform = 'none';
            });
        });

        // Update step indicator
        const step = '${step}';
        if (step === 'reset') {
            const steps = document.querySelectorAll('.step');
            const stepLine = document.querySelector('.step-line');
            
            steps[1].classList.remove('inactive');
            steps[1].classList.add('active');
            stepLine.classList.add('active');
        }

        // Email validation
        const emailInput = document.querySelector('input[name="email"]');
        if (emailInput) {
            emailInput.addEventListener('input', function() {
                const value = this.value;
                const gmailPattern = /^[a-z0-9._%+-]+@gmail\.com$/i;
                
                if (value && !gmailPattern.test(value)) {
                    this.setCustomValidity('Vui lòng nhập địa chỉ Gmail hợp lệ (ví dụ: example@gmail.com)');
                } else {
                    this.setCustomValidity('');
                }
            });
        }
    </script>
</body>
</html>