package cust_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CarValetServlet", urlPatterns = {"/CarValetServlet"})
public class CarValetServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            request.setCharacterEncoding("UTF-8");

            String carID[] = request.getParameter("carID").split(" ");
            String service = request.getParameter("service");
            String noDrive = request.getParameter("noDrive");
            String drive = request.getParameter("drive");

            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
            out.println(dateFormat.format(date));

            out.println(carID[0] + " " + carID[1]); // กง-5678 เชียงใหม่
            out.println(service); // null, on
            out.println(noDrive); // null, on
            out.println(drive); // null, on

            HttpSession session = request.getSession();
            Connection conn = (Connection) session.getAttribute("conn");
            Statement st = conn.createStatement();

            ResultSet serviceDetail = st.executeQuery("select * from service_details");
            int price[] = new int[6];
            int i = 0;
            while (serviceDetail.next()) {
                price[i++] = serviceDetail.getInt("Service_price");
            }
            if ("on".equals(noDrive) || "on".equals(drive)) {
                String sql = "insert into orders(Order_hiredate, Order_status, Car_ID, Car_country) value('" + dateFormat.format(date) + "', 'coming', '" + carID[0] + "', '" + carID[1] + "');";
                st.executeUpdate(sql);
                int order_no = 0;
                ResultSet order = st.executeQuery("select Order_NO from orders where Car_ID = '" + carID[0] + "' and Car_country = '" + carID[1] + "';");
                if (order.next()) {
                    order_no = order.getInt("Order_NO");
                }

                if ("on".equals(noDrive)) {
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");

                    ResultSet emp = st.executeQuery("select Emp_password from employees where Emp_username = '" + username + "'");
                    if (emp.next() && password.equals(emp.getString("Emp_password"))) {
                        st.executeUpdate("update orders set Emp_username = '" + username + "', Order_status = 'caring' where Order_NO = " + order_no + ";");

                    }
                } else {
                    float lat = Float.parseFloat(request.getParameter("lat"));
                    float lgt = Float.parseFloat(request.getParameter("lon"));

                    out.println(lat);
                    out.println(lgt);

                    st.executeUpdate("insert into locations(Loc_lat, Loc_longt, Loc_type, Order_NO) value(" + lat + ", " + lgt + ", 'come', " + order_no + ")");

                }

                if (service != null) {
                    st.executeUpdate("insert into service_records(ORecord_times, ORecord_totalPrice, Service_NO, Order_NO) " +
                            "value(0, " + price[3] + ", 4, " + order_no + ")" +
                            ", (0, " + price[4] + ", 5, " + order_no + ")" +
                            ", (0, " + price[5] + ", 6, " + order_no + ")");

                }
            }

            RequestDispatcher rdsend = request.getRequestDispatcher("UpdateMyCondoServlet");
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
            Logger.getLogger(CarValetServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CarValetServlet.class.getName()).log(Level.SEVERE, null, ex);
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
