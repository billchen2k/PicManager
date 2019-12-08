import bean.Asset;
import utils.DatabaseManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;


@WebServlet(name = "ViewSearch")
public class ViewSearch extends HttpServlet {
	DatabaseManager db = new DatabaseManager();
	ResultSet rs;

	//三种类型
	Map<Integer, Asset> assetMap = new HashMap<Integer, Asset>();

	private Asset parseAsset(ResultSet rs){
		try{
			Asset one = new Asset(rs.getInt("assetid"),
								  rs.getString("assetname"),
								  rs.getString("assettype").equals("pic") ? 0 : 1,
								  rs.getString("category"),
								  rs.getString("url"),
								  rs.getString("acq_date"),
								  rs.getString("upload_date"),
								  rs.getString("uploader_uid"),
								  rs.getString("last_modified_date"),
								  rs.getString("scale"),
								  rs.getString("country"),
								  rs.getString("location"),
								  rs.getString("latitude"),
								  rs.getString("longitude"));
			return one;
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if(session.getAttribute("logined_uid") == null){
			request.setAttribute("stat", "not_logined");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		db.getConnection();
		String sqlQ = "";
		String filterNote = "";
		String s = request.getParameter("searchName");
		assetMap.clear();
		try{
			if (request.getParameter("searchName") == null) {
				//未设置筛选器
				sqlQ = "SELECT * FROM `asset`";
				rs = db.executeQuery(sqlQ);
				while(rs.next()){
					assetMap.put(rs.getInt("assetid"), parseAsset(rs));
				}
				filterNote = "当前未设置过滤器";
			}
			else{
				filterNote = "";
				if(request.getParameter("searchName") != null){
					if(!request.getParameter("searchName").equals("")){
						sqlQ = "SELECT * FROM `asset` WHERE CONCAT(assetname,location,country,scale,assetid,uploader_uid,longitude,latitude) LIKE '%" + request.getParameter("searchName") + "%'";
						filterNote += "全局查找：" + request.getParameter("searchName") + "；";
					}
				}
				if(request.getParameter("searchCountry") != null){
					if (!request.getParameter("searchCountry").toString().equals("")) {
						sqlQ = sqlQ + "AND `asset`.`country`='" + request.getParameter("searchCountry") + "'";
						filterNote += "国家：" + request.getParameter("searchCountry") + "；";
					}
				}
				if(request.getParameter("searchScale") != null){
					if (!request.getParameter("searchScale").equals("all")) {
						sqlQ = sqlQ + "AND `asset`.`scale`='" + request.getParameter("searchScale") + "'";
						filterNote += "比例尺： " + request.getParameter("searchScale") + "；";
					}
				}
				if(sqlQ.equals("")){
					//未选择任何过滤器但提交了
					sqlQ = "SELECT * FROM `asset`";
					filterNote = "当前未设置过滤器";
				}
				rs = db.executeQuery(sqlQ);
				while(rs.next()){
					assetMap.put(rs.getInt("assetid"), parseAsset(rs));
				}
			}
			request.setAttribute("filterNote", filterNote);
			request.setAttribute("assetMap", assetMap);
			request.getRequestDispatcher("/view.jsp").forward(request, response);
		}
		catch (Exception e){
			e.printStackTrace();
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
