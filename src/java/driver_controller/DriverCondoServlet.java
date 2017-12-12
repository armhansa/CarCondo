package driver_controller;

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
import model.ListLocation;
import model.Location;

@WebServlet(name = "DriverCondoServlet", urlPatterns = {"/DriverCondoServlet"})
public class DriverCondoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();
            Connection conn = (Connection) session.getAttribute("conn");
            String username = (String) session.getAttribute("username");
            Statement st = conn.createStatement();
            
            ResultSet location = st.executeQuery("select * from locations loc join orders ord using (Order_NO) where loc.Emp_username = '" + username + "' and ord.Emp_username is null and loc.Loc_type <> 'comed';");
            if (location.next()) {
                Location loc = new Location(location.getInt("Loc_NO"), location.getFloat("Loc_lat"), location.getFloat("Loc_longt"), location.getInt("Order_NO"), location.getString("Car_ID"), location.getString("Car_country"));
                session.setAttribute("loc", loc);
                session.setAttribute("orderNo", location.getInt("Order_NO"));
                
                if(location.getString("Loc_type").equals("come")) {
                    RequestDispatcher rdsend = request.getRequestDispatcher("DriverToUser.jsp");
                    rdsend.forward(request, response);
                } else {
                    RequestDispatcher rdsend = request.getRequestDispatcher("DriverToMechanic.jsp");
                    rdsend.forward(request, response);
                }

            } else {
                location = st.executeQuery("select * "
                        + "from locations loc join orders ord using (Order_No) where loc.Emp_username is null order by Order_hiredate");

                ListLocation listLoc = new ListLocation();
                while (location.next()) {
                    Location loc = new Location(location.getInt("Loc_NO"), location.getFloat("Loc_lat"), location.getFloat("Loc_longt"), location.getInt("Order_NO"), location.getString("Car_ID"), location.getString("Car_country"));
                    listLoc.addLocation(loc);
                }
                session.setAttribute("listLoc", listLoc);
                out.println("*");
                RequestDispatcher rdsend = request.getRequestDispatcher("DriverHome.jsp");
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
            Logger.getLogger(DriverCondoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DriverCondoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
