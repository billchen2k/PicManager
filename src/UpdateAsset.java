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
public class UpdateAsset extends HttpServlet{
    DatabaseManager db = new DatabaseManager();
    ResultSet rs ;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        db.getConnection();
        //判断是否登录
        HttpSession session = request.getSession();
        if (session.getAttribute("logined_uid") == null) {
            request.setAttribute("stat", "not_logined");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }
        //设置编码
        request.setCharacterEncoding("UTF-8");
        String aid = request.getParameter("assetid");
        String name = request.getParameter("assetname");
        String country = request.getParameter("newCountry");
        String location = request.getParameter("newLocation");
        String latitude = request.getParameter("newLatitude");
        String longitude = request.getParameter("newLongitude");
        try{
            db.executeUpdate("UPDATE asset SET last_modified_date='"+ Utils.getCurrentDateTime() +"', assetname='" + name + "', country = '"+ country +"',location = '"+ location +"',latitude = '"+ latitude +"',longitude = '"+ longitude +"' where assetid = '"+ aid +"';");
            //日志
            String ipAddress = Utils.getRealRemoteIP(request);
            String logSQL = "INSERT INTO `picmanager`.`log`(`uid`, `username`,  `assetid`, `assetname`, `type`, `date`, `request_ip`, `notes`) VALUES ('" + session.getAttribute("logined_uid") + "', '"
                    + session.getAttribute("logined_username") + "', '" + request.getParameter("assetid") + "', '" + request.getParameter("assetname") + "', 'modify', '" + Utils.getCurrentDateTime() + "', '" + ipAddress + "', NULL);";
            db.executeUpdate(logSQL);


            //消息回调
            session.setAttribute("edit_stat", "success");
            response.sendRedirect("/manage");
        }catch (Exception e){
            e.printStackTrace();
            session.setAttribute("edit_stat", "编辑失败：" + e.getStackTrace());
        }


    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<i>USE POST INSTEAD.</i>");
    }

}


