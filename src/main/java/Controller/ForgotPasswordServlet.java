package Controller;

import DAO.CustomerDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");

        // Kiểm tra xem email có tồn tại trong cơ sở dữ liệu không
        boolean emailExists = checkEmailExists(email);

        if (emailExists) {
            // Logic gửi email đặt lại mật khẩu
            boolean emailSent = sendResetPasswordEmail(email);

            if (emailSent) {
                request.setAttribute("successMessage", "A reset link has been sent to your email.");
            } else {
                request.setAttribute("errorMessage", "Failed to send reset email. Please try again later.");
            }
        } else {
            request.setAttribute("errorMessage", "Email address not found.");
        }

        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    }

    // Kiểm tra email có tồn tại trong cơ sở dữ liệu
    private boolean checkEmailExists(String email) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.isEmailRegistered(email);
    }

    // Gửi email đặt lại mật khẩu
    private boolean sendResetPasswordEmail(String email) {
        try {
            // Logic gửi email ở đây (có thể sử dụng JavaMail API)
            // Đối với ví dụ này, chúng ta giả định email luôn được gửi thành công
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
