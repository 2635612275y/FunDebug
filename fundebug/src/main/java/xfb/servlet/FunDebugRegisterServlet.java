package xfb.servlet;

import xfb.dao.FunDebugUserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @description: FunDebug注册界面
 * @author: xfb
 * @time: 2020/12/26 8:40
 */
@WebServlet("/FunDebugRegisterServlet")
public class FunDebugRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public FunDebugRegisterServlet(){
        super();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        // 获取请求参数
        String type = request.getParameter("type");
        String email = request.getParameter("email");
        // 判断是否是使用Ajax请求进行email唯一性验证
        if("emailAjaxValidate".equals(type)){
            FunDebugUserDAO funDebugUserDAO = new FunDebugUserDAO();
            boolean flag = funDebugUserDAO.isExistEmail(email);
            if(flag) {
                out.print("邮箱已被注册！");
            } else {
                out.print("邮箱可以使用！");
            }
        }else{
            String password = request.getParameter("password");
            //判断邮箱是否被注册
            FunDebugUserDAO funDebugUserDAO = new FunDebugUserDAO();
            boolean flag = funDebugUserDAO.isExistEmail(email);
            if(flag){
                // 邮箱已注册,进行错误提示
                out.print("<script type='text/javascript'>");
                out.print("alert('邮箱已被注册，请重新输入！');");
                out.print("window.location='register.jsp';");
                out.print("</script>");
            }else{
                // 邮箱未被注册，保存注册用户信息
                funDebugUserDAO.save(email,password);
                // 注册成功，重定向到登录页面
                response.sendRedirect("login.jsp");
            }
        }
    }
}
