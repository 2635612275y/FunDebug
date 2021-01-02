package xfb.servlet;

import xfb.bean.Applicant;
import xfb.bean.change;
import xfb.dao.AccountDAO;
import xfb.dao.FunDebugUserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @description: 密码修改操作Servlet
 * @author: xfb
 * @time: 2020/12/29 8:43
 */
@WebServlet("/HandlePasswordServlet")
public class HandlePasswordServlet extends HttpServlet {
    @Override
    public  void  doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();
        String again_password = request.getParameter("again_password").trim();
        int getID = Integer.parseInt(request.getParameter("id"));
        AccountDAO accountDAO = new AccountDAO();


        PrintWriter printWriter = response.getWriter();
        if(password.equals(again_password)){
            int cot = accountDAO.update(getID, password);
            if (cot > 0){
                Applicant applicant = new Applicant(getID,email,password);
                request.getSession().setAttribute("SESSION_APPLICANT", applicant);
            }else{
                System.out.println("更新失败");
            }
            printWriter.print("<script type='text/javascript'>");
            printWriter.print("alert('修改成功！');");
            printWriter.print("window.location = 'account.jsp';");
            printWriter.print("</script>");
        }else{
            printWriter.print("<script type='text/javascript'>");
            printWriter.print("alert('两次密码输入不一致，请重新输入！');");
            printWriter.print("window.location = 'setup.jsp';");
            printWriter.print("</script>");
        }
    }
}