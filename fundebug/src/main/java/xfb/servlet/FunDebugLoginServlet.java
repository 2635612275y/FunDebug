package xfb.servlet;

import xfb.bean.Applicant;
import xfb.dao.FunDebugUserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @description: FunDebug登录Servlet
 * @author: xfb
 * @time: 2020/12/26 11:58
 */
@WebServlet("/FunDebugLoginServlet")
public class FunDebugLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FunDebugLoginServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        // 获取请求参数
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String requestPath = request.getParameter("requestPath");

        // 登录验证
        FunDebugUserDAO dao = new FunDebugUserDAO();
        int applicantID = dao.login(email, password);
        if (applicantID != 0) {
            // 用户登录成功,将用户信息存入session
            Applicant applicant = new Applicant(applicantID, email, password);
            request.getSession().setAttribute("SESSION_APPLICANT", applicant);
            //判断是否已存在请求路径
            if(!"".equals(requestPath) && null!=requestPath){
                response.sendRedirect(requestPath);
            }else{
                // 判断是否以及填写过信息
                int teamID = dao.isExistResume(applicantID);
                if (teamID != 0){
                    request.getSession().setAttribute("SESSION_TEAMID", teamID);
                    // 若团队信息已存在，跳到设置界面
                    response.sendRedirect("setup.jsp");
                }else {
                    // 若团队不存在信息，跳到登录成功页面
                    response.sendRedirect("successLogin.jsp");
                }
            }
        } else {
            // 用户登录信息错误，进行错误提示
            out.print("<script type='text/javascript'>");
            out.print("alert('用户名或密码错误，请重新输入！');");
            out.print("window.location='login.jsp';");
            out.print("</script>");
        }
    }

}
