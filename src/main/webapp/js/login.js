// Giảm bớt mã JavaScript, chỉ sử dụng khi cần
document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("showPassword").addEventListener("change", function() {
        var passwordField = document.getElementById("password");
        if (this.checked) {
            passwordField.type = "text";
        } else {
            passwordField.type = "password";
        }
    });
});


(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-XXXXX-Y', 'auto'); // Thay thế 'UA-XXXXX-Y' với ID theo dõi của bạn
ga('send', 'pageview');

// Tránh gây phiền nhiễu
// Không thêm pop-up hoặc quảng cáo không cần thiết
