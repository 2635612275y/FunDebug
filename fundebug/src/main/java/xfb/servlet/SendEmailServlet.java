package xfb.servlet;



import xfb.bean.Applicant;
import xfb.bean.Email;
import xfb.dao.EmailDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/SendEmailServlet")
public class SendEmailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        // 获取请求参数
        String email = request.getParameter("email");
        String content = request.getParameter("content");
        //获取用户的账号id来判断是否处于登录状态
        Applicant applicant = (Applicant)request.getSession().getAttribute("SESSION_APPLICANT");
        EmailDAO dao = new EmailDAO();
//        将账号id插入email中
        dao.save(email, content, applicant.getApplicantId());
//        将email信息存入数据库
        Email emailDate = new Email(email, content);
        request.getSession().setAttribute("SESSION_EMAIL", emailDate);
//        显示提示信息
        if(request.getSession().getAttribute("SESSION_EMAIL") != null){
            PrintWriter printWriter = response.getWriter();
            printWriter.print("<script type='text/javascript'>");
            printWriter.print("alert('发送成功！我们收到你的邮件啦!');");
            printWriter.print("window.location = 'successLogin.jsp';");
            printWriter.print("</script>");
        }else{
            PrintWriter printWriter = response.getWriter();
            printWriter.print("<script type='text/javascript'>");
            printWriter.print("alert('邮件信息不能为空哦!');");
            printWriter.print("window.location = 'successLogin.jsp';");
            printWriter.print("</script>");
        }
//        请求重定向
//        response.sendRedirect("successLogin.jsp");
    }
}
