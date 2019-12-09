import utils.DatabaseManager;
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

@WebServlet(name = "DownloadFile")
public class DownloadFile extends HttpServlet {
	private DatabaseManager db = new DatabaseManager();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		db.getConnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String ipAddress = Utils.getRealRemoteIP(request);
		String logSQL = "INSERT INTO `picmanager`.`log`(`uid`, `username`,  `assetid`, `assetname`, `type`, `date`, `request_ip`, `notes`) VALUES ('" + session.getAttribute("logined_uid") + "', '"
				+ session.getAttribute("logined_username") + "', '" + request.getParameter("assetid") + "', '" + request.getParameter("assetname") + "', 'download', '" + Utils.getCurrentDateTime() + "', '" + ipAddress + "', NULL);";
		db.executeUpdate(logSQL);
		out.print("<script language=javascript>window.close();");
		out.print("</script>");

	}
}
