package Controller;

import DAO.CustomerDAO;
import Model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        CustomerDAO customerDAO = new CustomerDAO();
        Customer customer = new Customer();
        customer.setUsername(username);
        customer.setPassword(password);
        customer.setEmail(email);

        boolean isUserCreated = customerDAO.createCustomer(customer);

        if (isUserCreated) {
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("errorMessage", "Username or Email already exists!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}