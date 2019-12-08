import utils.DatabaseManager;
import utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "DownloadFile")
public class DownloadFile extends HttpServlet {
	private DatabaseManager db = new DatabaseManager();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		db.getConnection();
		HttpSession session = request.getSession();
		String ipAddress = Utils.getRealRemoteIP(request);
		String logSQL = "INSERT INTO `picmanager`.`log`(`uid`, `username`,  `assetid`, `assetname`, `type`, `date`, `request_ip`, `notes`) VALUES ('" + session.getAttribute("logined_id") + "', '"
				+ session.getAttribute("logined_username") + "', '-1', 'N/A', 'login', '" + Utils.getCurrentDateTime() + "', '" + ipAddress + "', NULL);";
		db.executeUpdate(logSQL);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
