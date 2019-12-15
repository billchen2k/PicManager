import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import utils.Encrypt;
import utils.DatabaseManager;
import utils.Utils;

import java.sql.*;

@WebServlet(name = "UpdateUser")
public class UpdateUser extends HttpServlet {
        DatabaseManager db = new DatabaseManager();
        ResultSet rs ;
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        db.getConnection();
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("logined_uid") == null) {
            request.setAttribute("stat", "not_logined");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }
        String type = request.getParameter("type");
        String id = request.getParameter("uid");
        try{
            switch(type)
            {
                case "setUsername":
                    String name = request.getParameter("newUsername");
                    rs = db.executeQuery("select * from user where username = '"+name+"'");
                    if(rs.next())
                    {
                        session.setAttribute("update_user_stat", "用户名已存在");
                        response.sendRedirect("/manageuser.jsp");
                        return;
                    }
                    String sql = "update user set username = '"+ name +"' where uid = '"+ id +"';";
                    db.executeUpdate(sql);

                    break;
                case "setPassword":
                    String pw = request.getParameter("newPassword");
                    pw = Encrypt.SHA1(pw);
                    db.executeUpdate("update user set password = '"+ pw +"', password_last_changed = '"+ Utils.getCurrentDateTime() +"'where uid = '"+ id +"'; ");
                    break;
                case "setRole":
                    String role = request.getParameter("newRole");
                    String sql2 = "update user set role = '"+ role +"' where uid = '"+ id +"';";
                    db.executeUpdate(sql2);
                    break;
                case "delete":
                    String sql3 = "DELETE FROM `user` WHERE `uid`='" + id + "';";
                    db.executeUpdate(sql3);
                    break;
            }
            session.setAttribute("update_user_stat","success");
            response.sendRedirect("manageuser.jsp");
            return;
        } catch (Exception e){
            e.printStackTrace();
            session.setAttribute("edit_stat", "更新失败：" + e.getStackTrace());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
