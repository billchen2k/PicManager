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

@WebServlet(name = "Login")
public class Login extends HttpServlet {
	private DatabaseManager db = new DatabaseManager();
	private ResultSet rs = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession();
		String identifier = request.getParameter("identifier");
		String password = request.getParameter("password");
		password = Encrypt.SHA1(password);
		session.setMaxInactiveInterval(60 * 30);
		db.getConnection();
		try{
			rs = db.executeQuery("SELECT * from `user` WHERE username='" + identifier + "';");
			if (!rs.next()){
				rs = db.executeQuery("SELECT * from `user` WHERE email='" + identifier + "';");
				if (!rs.next()){
					//邮箱和用户名都找不到
					request.setAttribute("stat", "user_not_found");
					request.getRequestDispatcher("index.jsp").forward(request, response);
					return;
				}
			}
			rs.last();
			if(password.equals(rs.getString("password"))){
				//密码正确
				session.setAttribute("to_notify_success", "true");
				//在session中记录已登录的用户信息
				session.setAttribute("logined_uid", rs.getString("uid"));
				session.setAttribute("logined_username", rs.getString("username"));
				session.setAttribute("logined_user_details", rs);
				response.sendRedirect("view");
				String ipAddress = Utils.getRealRemoteIP(request);
				//写日志
				String logSQL = "INSERT INTO `picmanager`.`log`(`uid`, `username`,  `assetid`, `assetname`, `type`, `date`, `request_ip`, `notes`) VALUES ('" + rs.getString("uid") +"', '"
						+  rs.getString("username") + "', '-1', 'N/A', 'login', '" + Utils.getCurrentDateTime() + "', '" + ipAddress + "', NULL);";
				db.executeUpdate(logSQL);
				// request.getRequestDispatcher("view.jsp").forward(request, response);
				return;
			}
			else{
				//密码错误
				request.setAttribute("stat", "wrong_password");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				return;
			}
		}
		catch (Exception e){
			e.printStackTrace();
		}
		//request.setAttribute("stat", "wrong_password");

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<i>USE POST INSTEAD.</i>");
	}
}
