import utils.DatabaseManager;
import utils.Encrypt;
import utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "ChangePassword")
public class ChangePassword extends HttpServlet {
	private DatabaseManager db = new DatabaseManager();
	private ResultSet rs = null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String oldPassword = request.getParameter("old_password");
		String newPassword = request.getParameter("new_password");
		oldPassword = Encrypt.SHA1(oldPassword);
		newPassword = Encrypt.SHA1(newPassword);
		String currentUID = session.getAttribute("logined_uid").toString();
		db.getConnection();
		String sqlQ;
		try {
			sqlQ = "SELECT * FROM `user` WHERE `user`.uid=" + currentUID;
			rs = db.executeQuery(sqlQ);
			rs.next();
			if (oldPassword.equals(rs.getString("password"))){
				//密码匹配
				sqlQ = "UPDATE `user` SET `user`.`password`='" + newPassword + "' WHERE `user`.`uid`=" + currentUID;
				db.executeUpdate(sqlQ);
				sqlQ = "UPDATE `user` SET `user`.`password_last_changed`='" + Utils.getCurrentDateTime() +"' WHERE `user`.`uid`=" + currentUID;
				request.setAttribute("stat", "change_success");
				request.getRequestDispatcher("/me.jsp").forward(request, response);
			}
			else{
				//密码不匹配
				request.setAttribute("stat", "wrong_old_password");
				request.getRequestDispatcher("/me.jsp").forward(request, response);
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
