<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <!-- Liên kết tới tệp CSS -->
    <link rel="stylesheet" href="css/register.css">
    <!-- Liên kết tới tệp JavaScript -->
    <script src="js/register.js" defer></script>
</head>
<body>
    <div class="register-container">
        <!-- Logo công ty -->
        <img src="images/logo.png" alt="Company Logo" class="logo">

        <h2>Register</h2>
        <form action="RegisterServlet" method="post" autocomplete="on"> <!-- Bật chế độ tự động điền thông tin -->
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" 
                   required class="${not empty usernameError ? 'input-error' : ''}" autocomplete="username">
            <c:if test="${not empty usernameError}">
                <p class="error-message">${usernameError}</p>
            </c:if>
            
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" 
                   required class="${not empty emailError ? 'input-error' : ''}" autocomplete="email">
            <c:if test="${not empty emailError}">
                <p class="error-message">${emailError}</p>
            </c:if>
            
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" 
                   required class="${not empty passwordError ? 'input-error' : ''}" autocomplete="new-password">
            <c:if test="${not empty passwordError}">
                <p class="error-message">${passwordError}</p>
            </c:if>

            <!-- Tùy chọn hiển thị mật khẩu -->
            <div class="show-password-container">
                <input type="checkbox" id="showPassword">
                <label for="showPassword">Show Password</label>
            </div>

            <input type="submit" value="Register">
        </form>

        <!-- Chính sách bảo mật -->
        <div class="security-policy">
            By registering, you agree to our <a href="#">Privacy Policy</a> and <a href="#">Terms of Service</a>.
        </div>
    </div>
</body>
</html>
