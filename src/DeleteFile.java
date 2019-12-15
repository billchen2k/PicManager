import utils.DatabaseManager;
import utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "DeleteFile" )
public class DeleteFile extends HttpServlet{
    public DatabaseManager db = new DatabaseManager();
    private ResultSet rs = null;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        db.getConnection();
        if (session.getAttribute("logined_uid") == null) {
            request.setAttribute("stat", "not_logined");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }
        String toDeleteID = request.getParameter("aid");
        try {
          db.executeUpdate("DELETE FROM asset WHERE assetid = '" + toDeleteID + "';");
            String ipAddress = Utils.getRealRemoteIP(request);
            //todo 更新数据库日志 - 可以参考 Login 类。Log 表中的 type 为 enum 类型，具体可以在 Navicat 里看
            String logSQL = "INSERT INTO `picmanager`.`log`(`uid`, `username`,  `assetid`, `assetname`, `type`, `date`, `request_ip`, `notes`) VALUES ('" + session.getAttribute("logined_uid") + "', '"
                    + session.getAttribute("logined_username") + "', '" + request.getParameter("assetid") + "', '" + request.getParameter("assetname") + "', 'modify', '" + Utils.getCurrentDateTime() + "', '" + ipAddress + "', NULL);";
            db.executeUpdate(logSQL);

            /* todo 删除硬盘上的文件 - 图片存储目录可以从数据库获取到，url是相对路径，绝对路径的获取方式可以参考 Upload 类
            *   在写和删除有关的代码之前记得备份图片和数据库*/
            /*String url = request.getParameter("url");
            String newurl = null;
            if(toDeleteID!=null&&!toDeleteID.equals(""))
            {
                int size = url.length()-1;
                for(int i=0;i<size;i++)
                {
                    newurl = url.replace("/","//");

                }
                String  name = request.getParameter("filename");
                String absolutePath = this.getServletContext().getRealPath("/+'"+ name +"'");
                String picPath = absolutePath + "//" + newurl;
                File pic = new File(picPath);
                if(pic.exists()&&pic.isFile())
                {
                    if(pic.canWrite())
                        pic.delete();
                }
            }*/
            //删除硬盘上的文件
            session.setAttribute("delete_stat", "success");
            response.sendRedirect("/manage");


        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("delete_stat", "删除失败：" + e.getStackTrace());
        }
    }
}
