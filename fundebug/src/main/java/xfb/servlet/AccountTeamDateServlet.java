package xfb.servlet;

import xfb.bean.AccountTeamDateInfo;
import xfb.bean.Applicant;
import xfb.dao.AccountDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @description: 用户操作数据更新Servlet
 * @author: xfb
 * @time: 2020/12/28 22:40
 */
@WebServlet("/AccountTeamDateServlet")
public class AccountTeamDateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AccountTeamDateServlet() {
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

        // 获取请求操作类型
        String type = request.getParameter("type");
        if ("add".equals(type)) {
            // 封装请求数据
            AccountTeamDateInfo accountTeamDateInfo = this.requestDataObj(request);
            // 从会话对象中获取当前登录用户标识
            Applicant applicant = (Applicant) request.getSession().getAttribute("SESSION_APPLICANT");
//            测试获取的id是否正确
            System.out.println("------------------");
            System.out.println(applicant.getApplicantId());
            System.out.println("------------------");
            // 向数据库中添加当前用户的团队信息
            AccountDAO dao = new AccountDAO();
            int teamID = dao.add(accountTeamDateInfo, applicant.getApplicantId());
            System.out.println(teamID);
            request.getSession().setAttribute("SESSION_TEAMID", teamID);
            // 操作成功，转向我的团队信息界面,调用团队信息界面方法
            response.sendRedirect("AccountTeamDateServlet?type=select");
        }else if("select".equals(type)){
            // 从会话对象中获取当前登录用户标识
            Applicant applicant = (Applicant)request.getSession().getAttribute("SESSION_APPLICANT");
            // 根据团队标识查询团队基本信息
            AccountDAO dao = new AccountDAO();
            //根据用户团队标识查询团队信息
            AccountTeamDateInfo accountTeamDateInfo = dao.selectAccountDateInfo(applicant.getApplicantId());
            System.out.println(applicant.getApplicantId());
            // 将团队基本信息存入request对象进行请求转发
            request.setAttribute("accountTeamDateInfo", accountTeamDateInfo);
            request.getRequestDispatcher("teamNewDate.jsp").forward(request, response);
        }
    }

    /**
     * 将请求的团队信息数据封装成一个对象
     * @param request
     * @return
     * @throws
     */
    private AccountTeamDateInfo requestDataObj(HttpServletRequest request) {
        AccountTeamDateInfo teamInfo = null;
        // 获得请求数据
        String team_name = request.getParameter("name");
        String team_short = request.getParameter("short");
        int team_number = Integer.parseInt(request.getParameter("number"));
        String team_captain = request.getParameter("captain");
        String team_date = request.getParameter("date");
        // 将请求数据封装成一个团队基本信息对象
        teamInfo = new AccountTeamDateInfo(team_name, team_short, team_number, team_captain, team_date);
        return teamInfo;
    }
}