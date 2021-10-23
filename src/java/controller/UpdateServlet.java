/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CaSiDAO;
import dal.SongDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.CaSi;
import model.Song;

/**
 *
 * @author ADMIN
 */
public class UpdateServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session= request.getSession();
        Account account=null;
        Object a= session.getAttribute("account"); 
        account= (Account) a;
        String raw_id= request.getParameter("sid");
        int id= Integer.parseInt(raw_id);
        SongDAO sdb= new SongDAO();
        Song s= sdb.getBySId(id);
        request.setAttribute("account", a);
        request.setAttribute("song", s);
        request.getRequestDispatcher("update.jsp").forward(request, response);
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
        String raw_id= request.getParameter("sid");
        int id= Integer.parseInt(raw_id);
        String name = request.getParameter("name");
        String singer= request.getParameter("singer");
        CaSiDAO cdb= new CaSiDAO();
        CaSi c= cdb.getByName(name);
        if(c!=null){
            String mp3= request.getParameter("mp3");
            String img=request.getParameter("img");
            String date= request.getParameter("date");
            SongDAO sdb= new SongDAO();
            Song s= new Song(id, name, mp3, 0, 0, date, img, c);
            int rs= sdb.update(s);
            if(rs>0){
                response.sendRedirect("upsong");
            } else{
                request.getRequestDispatcher("update?sid="+id).forward(request, response);
            }
        }else{
            response.sendRedirect("addsinger?type=1");
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
