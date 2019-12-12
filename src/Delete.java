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
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "Delete" )
public class Delete {
    public DatabaseManager db = new DatabaseManager();
    private ResultSet rs = null;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("searchName");

        try {
            db.executeUpdate("delete * from asset where assetname = '"+ name + "';");


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
