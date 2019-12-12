import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import utils.Encrypt;
import utils.DatabaseManager;
import utils.Utils;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "updateasset")
public class Updateasset {
    DatabaseManager db = new DatabaseManager();
    ResultSet rs ;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String name = request.getParameter("assetame");
         String country = request.getParameter("newCountry");
         String location = request.getParameter("newLocation");
         String latitude = request.getParameter("newLatitude");
         String longitude = request.getParameter("newLongitude");
        try{
            db.executeUpdate("update asset set country = '"+ country +"',location = '"+ location +"',latitude = '"+ latitude +"',longitude = '"+ longitude +"' where assetname = '"+ name +"'");

        }catch (Exception e){
            e.printStackTrace();
        }


    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<i>USE POST INSTEAD.</i>");
    }

}


