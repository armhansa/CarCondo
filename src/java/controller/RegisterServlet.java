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
import javax.sql.DataSource;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    @Resource(name = "car_condo")
    private DataSource car_condo;

    Connection conn;
    
    @Override
    public void init() {
        try {
            conn = car_condo.getConnection();
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // ***Must Have if want to use Thai parameter
            request.setCharacterEncoding("UTF-8");

            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String citizenID = request.getParameter("citizenID");
            String birthDay = request.getParameter("birthDay");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirm = request.getParameter("re-password");
            
            Statement st = conn.createStatement();
            String sql = "insert into customers values('"+username+"', '"+password+"', '"+firstname+"', '"+lastname+"', '"+birthDay+"', '"+email+"', '"+phone+"', '"+address+"', '"+citizenID+"')";
            
            ResultSet rs = st.executeQuery("select Cust_username from customers where Cust_username = '"+username+"'");
            
            // Temp
            String link = null;
            
            if(rs.next()) {
                if(password.equals(confirm)) request.setAttribute("notice", "Username is has Already");
                else request.setAttribute("notice", "Confirm Password not match");
                link = "Register.jsp";
            }
            else if(st.executeUpdate(sql) == 1) {
                request.setAttribute("notice", "SignUp Successful, Please Login");
                link = "Login.jsp";
            }
            
            RequestDispatcher rdsend = request.getRequestDispatcher(link);
            rdsend.forward(request, response);
            
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
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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
