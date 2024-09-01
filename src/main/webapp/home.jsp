<%@ page import="Model.Customer" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
	HttpSession mySession = request.getSession(false);
	Customer customer = (Customer) mySession.getAttribute("customer");


    if (customer == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
</head>
<body>
    <h2>Welcome, <%= customer.getUsername() %></h2>
    <p>Your email: <%= customer.getEmail() %></p>
    <a href="logout">Logout</a>
</body>
</html>
