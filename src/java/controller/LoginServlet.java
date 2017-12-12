package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import model.Customer;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Resource(name = "car_condo")
    private DataSource car_condo;

    Connection conn;

    @Override
    public void init() {
        try {
            conn = car_condo.getConnection();
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            request.setCharacterEncoding("UTF-8");

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            Statement st = conn.createStatement();

            // Login For Customers
            ResultSet user = st.executeQuery("SELECT * FROM customers WHERE Cust_username = '" + username + "'");

            RequestDispatcher send;
            if (user.next() && password.equals(user.getString("Cust_password"))) {
                String firstname = user.getString("Cust_firstname");
                String lastname = user.getString("Cust_lastname");
                Date birthDay = user.getDate("Cust_birthDay");
                String email = user.getString("Cust_email");
                String phone = user.getString("Cust_phone");
                String address = user.getString("Cust_address");
                String citizenID = user.getString("Cust_citizenID");
                HttpSession session = request.getSession(true);
                session.setMaxInactiveInterval(3600);
                session.setAttribute("conn", conn);
                session.setAttribute("username", username);
                session.setAttribute("rolename", "cust");
                Customer custDetail = new Customer(password, firstname, lastname, birthDay, email, phone, address, citizenID);
                session.setAttribute("custDetail", custDetail);

                send = request.getRequestDispatcher("Home.jsp");
                send.forward(request, response);
            } else {

                user = st.executeQuery("select * from employees where Emp_username = '" + username + "'");

                if (user.next()) {

                    HttpSession session = request.getSession(true);
                    session.setMaxInactiveInterval(3600);
                    session.setAttribute("conn", conn);
                    session.setAttribute("username", username);

                    String department = user.getString("Emp_department");
                    session.setAttribute("rolename", department);
                    switch (department) {
                        case "driver":
                            
                            send = request.getRequestDispatcher("Home.jsp");
                            send.forward(request, response);
                            break;
                        case "mechanic":
                            ResultSet work = st.executeQuery("select * from orders ord left outer join  where Emp_username = '" + username + "'");
                            break;
                    }

                } else {
                    request.setAttribute("notice", "username");
                    send = request.getRequestDispatcher("Login.jsp");
                    send.forward(request, response);
                }

            }

        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
