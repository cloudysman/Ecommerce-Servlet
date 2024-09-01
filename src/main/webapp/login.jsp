<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Login</title>
    <!-- Liên kết tới tệp CSS -->
    <link rel="stylesheet" href="css/login.css">
    <!-- Liên kết tới tệp JavaScript -->
    <script src="js/login.js" defer></script>
</head>
<body>
    <div class="login-container">
        <!-- Logo công ty -->
        <img src="images/logo.png" alt="Company Logo" class="logo">

        <h2>Login</h2>
        <form action="login" method="post" autocomplete="on">
            <label for="username">Email</label>
            <input type="text" id="username" name="username" placeholder="Enter your email" required autocomplete="username">
            <c:if test="${not empty usernameError}">
                <p class="error-message">${usernameError}</p>
            </c:if>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required autocomplete="current-password">
            <c:if test="${not empty passwordError}">
                <p class="error-message">${passwordError}</p>
            </c:if>

            <!-- Container cho Show Password và Remember Me -->
            <div class="options-container">
                <div class="show-password">
                    <input type="checkbox" id="showPassword">
                    <label for="showPassword">Show Password</label>
                </div>

                <div class="remember-me">
                    <input type="checkbox" id="rememberMe" name="rememberMe">
                    <label for="rememberMe">Remember Me</label>
                </div>
            </div>

            <input type="submit" value="Login">
        </form>

        <!-- Liên kết "Quên mật khẩu" và "Đăng ký" -->
        <div class="additional-links">
            <a href="forgot-password.jsp">Forgot Password?</a>
            <a href="register.jsp">Register here</a>
        </div>

    </div>
</body>
</html>
