package cust_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;

@WebServlet(name = "EditProfileServlet", urlPatterns = {"/EditProfileServlet"})
public class EditProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            request.setCharacterEncoding("UTF-8");

            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            Connection conn = (Connection) session.getAttribute("conn");
            Statement st = conn.createStatement();

            String password = request.getParameter("oldPassword");
            String nPass = request.getParameter("password");
            String confirmNPass = request.getParameter("confirm-newPassword");
            
            ResultSet cust = st.executeQuery("select Cust_password from customers where Cust_username='" + username + "'");
            
            if (cust.next() && password.equals(cust.getString("Cust_password"))) {
                Customer user = (Customer) session.getAttribute("custDetail");
                user.setFirstname(request.getParameter("firstname"));
                user.setLastname(request.getParameter("lastname"));
                user.setPhone(request.getParameter("phone"));
                user.setEmail(request.getParameter("email"));
                
                String sql = "update customers set ";
                sql += "Cust_firstname = '"+user.getFirstname()+"'";
                sql += ", Cust_lastname = '"+user.getLastname()+"'";
                sql += ", Cust_phone = '"+user.getPhone()+"'";
                sql += ", Cust_email = '"+user.getEmail()+"'";
                
                if (nPass != null && nPass.equals(confirmNPass)) {
                    sql += ", Cust_password = '" + nPass + "'";
                }
                out.println(sql + "where Cust_username = '" + username + "'");
                int numrow = st.executeUpdate(sql + "where Cust_username = '" + username + "'");
                if(numrow == 1) {
                    RequestDispatcher rdsend = request.getRequestDispatcher("ViewProfile.jsp");
                    rdsend.forward(request, response);
                }
                else {
                    request.setAttribute("notice", "unique");
                    RequestDispatcher rdsend = request.getRequestDispatcher("EditProfile.jsp");
                    rdsend.forward(request, response);
                }
                
            } else {
                request.setAttribute("notice", "password");
                RequestDispatcher rdsend = request.getRequestDispatcher("EditProfile.jsp");
                rdsend.forward(request, response);
                
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
            Logger.getLogger(EditProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(EditProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
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
