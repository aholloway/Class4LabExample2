/*
 * @author aholloway
 * @created 2/2/13
 * @version 1.01 
 */
package example2;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Drew
 */
@WebServlet(name = "RtAngleSideCalculatorServlet", urlPatterns = {"/RtAngleSideCalculatorServlet"})
public class RtAngleSideCalculatorServlet extends HttpServlet {

    private static final String destination = "/home.jsp";

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {

            request.setAttribute("calculationType", CalculationType.RT_ANGLE_SIDE);
            request.setAttribute("sideLength", null);

            String strA = (String) request.getParameter("a");

            String strB = (String) request.getParameter("b");

            String strC = (String) request.getParameter("c");

            //determine which side is empty
            String emptySide=TriangleCalculator.findEmptySide(strA, strB, strC);
            
            request.setAttribute("missingSideName", emptySide);
            
            //detrming length of the missing side
            double sideLength = TriangleCalculator.calculateEmptySideLength
                    (emptySide, strA, strB, strC);
            
            request.setAttribute("sideLength", sideLength);
            
            forward(request, response);


        } finally {
            out.close();
        }
    }

    protected void forward(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher(destination);
        dispatcher.forward(request, response);
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
