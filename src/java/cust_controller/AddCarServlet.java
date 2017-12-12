package cust_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Car;
import model.ListCar;

public class AddCarServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            request.setCharacterEncoding("UTF-8");

            String id = request.getParameter("carID");
            String country = request.getParameter("carCountry");
            String brand = request.getParameter("carBrand");
            String color = request.getParameter("carColor");
            Part picturePart = request.getPart("picture");
            
            RequestDispatcher rdsend;
            
            if (picturePart.getContentType().equals("image/png")) {
                picturePart.write(id + "-" + country + ".png");
                HttpSession session = request.getSession();
                Connection conn = (Connection) session.getAttribute("conn");
                String username = (String) session.getAttribute("username");
                Statement st = conn.createStatement();
                int numrow;
                try {
                    numrow = st.executeUpdate("INSERT INTO cars values('" + id + "', '" + country + "', '" + brand + "', '" + color + "', '" + username + "')");
                } catch (SQLException e) {
                    numrow = 0;
                }
                
                if (numrow == 1) {
                    ListCar outStock = (ListCar) session.getAttribute("outStock");
                    Car car = new Car(id, country, brand, color, outStock.getListCar().size());
                    outStock.addCar(car);
                    session.setAttribute("outStock", outStock);

                    rdsend = request.getRequestDispatcher("UpdateMyCondoServlet");
                    rdsend.forward(request, response);
                } else {
                    request.setAttribute("notice", "Error!!!");

                    rdsend = request.getRequestDispatcher("AddCar.jsp");
                    rdsend.forward(request, response);
                }
            } else {
                request.setAttribute("notice", "Your Picture isn't PNG file!!!");

                rdsend = request.getRequestDispatcher("AddCar.jsp");
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
            Logger.getLogger(AddCarServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AddCarServlet.class.getName()).log(Level.SEVERE, null, ex);
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
