<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <!-- Liên kết tới tệp CSS -->
    <link rel="stylesheet" href="css/forgot-password.css">
</head>
<body>
    <div class="forgot-password-container">
        <img src="images/logo.png" alt="Company Logo" class="logo">

        <h2>Forgot Password</h2>
        <form action="ForgotPasswordServlet" method="post" autocomplete="on">
            <label for="email">Enter your email address:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required autocomplete="email">
            <c:if test="${not empty errorMessage}">
                <p class="error-message">${errorMessage}</p>
            </c:if>
            <c:if test="${not empty successMessage}">
                <p class="success-message">${successMessage}</p>
            </c:if>
            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
