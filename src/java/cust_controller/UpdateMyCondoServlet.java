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
import model.Car;
import model.ListCar;
import model.ListOrder;
import model.Order;

@WebServlet(name = "UpdateMyCondoServlet", urlPatterns = {"/UpdateMyCondoServlet"})
public class UpdateMyCondoServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            Connection conn = (Connection) session.getAttribute("conn");
            Statement st = conn.createStatement();
            
            ResultSet carSet = st.executeQuery("select *\n" +
                "from cars\n" +
                "left outer join orders\n" +
                "using (Car_ID, Car_country)\n" +
                "where orders.Order_NO is null and cars.Cust_username = '"+username+"'");
            
            ListCar outStock = new ListCar();
            
            int tmpCount = 0;
            while(carSet.next()) {
                Car car = new Car(carSet.getString("Car_ID"), carSet.getString("Car_country"), carSet.getString("Car_brand"), carSet.getString("Car_color"), tmpCount++);
                outStock.addCar(car);
            }
            session.setAttribute("outStock", outStock);
            
            carSet = st.executeQuery("select *\n" +
                "from cars\n" +
                "join orders\n" +
                "using (Car_ID, Car_country)\n" +
                "where cars.Cust_username = '"+username+"'");
            ListCar inStock = new ListCar();
            ListOrder orders = new ListOrder();
            tmpCount = 0;
            while(carSet.next()) {
                Car car = new Car(carSet.getString("Car_ID"), carSet.getString("Car_country"), carSet.getString("Car_brand"), carSet.getString("Car_color"), tmpCount++);
                Order order = new Order(carSet.getInt("Order_NO"), carSet.getDate("Order_hiredate"), carSet.getString("Car_ID"), carSet.getString("Car_country"), carSet.getString("Emp_username"));
                inStock.addCar(car);
                orders.addOrder(order);
            }
            session.setAttribute("inStock", inStock);
            
            RequestDispatcher rdsend = request.getRequestDispatcher("MyCondo.jsp");
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
            Logger.getLogger(UpdateMyCondoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UpdateMyCondoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
