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




@WebServlet(name = "registered")

public class register extends HttpServlet {
    private DatabaseManager db = new DatabaseManager();
    private ResultSet rs = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        password = Encrypt.SHA1(password);
        Connection con = db.getConnection();
        int num = 0;
        try {
            PreparedStatement regist = con.prepareStatement("insert into user (username,password,email)values (?,?,?)");
            regist.setString(1, name);
            regist.setString(2, password);
            regist.setString(3, email);
            num = regist.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (num == 0) {
            //注册失败
            request.setAttribute("re","registration_failed");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }
        db.close();
        ;
    }
}



