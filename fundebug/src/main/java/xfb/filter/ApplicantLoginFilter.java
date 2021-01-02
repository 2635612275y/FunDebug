package xfb.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 求职者访问权限过滤器
 *
 * @author QST青软实训
 *
 */
@WebFilter(
        urlPatterns = { "/servlet/*" },
        servletNames = {"xfb.servlet.SendEmailServlet"},
        initParams = { @WebInitParam(name = "loginPage", value = "login.jsp") },
        dispatcherTypes = { DispatcherType.REQUEST, DispatcherType.FORWARD })
public class ApplicantLoginFilter implements Filter {

    private String loginPage = "login.jsp";

    public ApplicantLoginFilter() {

    }

    public void init(FilterConfig fConfig) throws ServletException {
        // 获取当请求被拦截时转向的页面
        loginPage = fConfig.getInitParameter("loginPage");
        if (null == loginPage) {
            loginPage = "login.jsp";
        }
    }

    public void destroy() {
        this.loginPage = null;
    }

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        // 判断被拦截的请求用户是否处于登录状态
        if (session.getAttribute("SESSION_APPLICANT") == null) {
            //输出提示信息
            System.out.println("未登陆，已经被成功拦截到登陆页面，请先登录再发送邮件哦！！");
            // 获取被拦截的请求地址及参数
            String requestPath = req.getRequestURI();
            if (req.getQueryString() != null) {
                requestPath += "?" + req.getQueryString();
            }
            // 将请求地址保存到request对象中转发到登录页面
            req.setAttribute("requestPath", requestPath);
            request.getRequestDispatcher( "/" + loginPage).forward(request, response);
            return;
        } else {
            chain.doFilter(request, response);
        }
    }

}
