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




@WebServlet(name = "register")

public class Register extends HttpServlet {
    private DatabaseManager db = new DatabaseManager();
    private ResultSet rs = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String date = Utils.getCurrentDateTime();
        String ip = Utils.getRealRemoteIP(request);
        password = Encrypt.SHA1(password);
         db.getConnection();
        try {
            rs = db.executeQuery("select * from user where username = '"+name+"';");
            if(!rs.next())
            {
                db.executeUpdate("insert into user(username,password,email,registration_date,registration_ip)values ('" + name + "','" + password + "','"+ email +"','"+ date +"','"+ip+"');");
                request.setAttribute("stat", "registration_success");
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }
            else
            {
                request.setAttribute("stat","already_exist");
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }


        } catch (Exception e) {
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



