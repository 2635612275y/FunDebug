package xfb.servlet;

import xfb.bean.Applicant;
import xfb.bean.ItemsType;
import xfb.dao.ItemsTypeDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Enumeration;

@WebServlet("/ItemsTypePriceServlet")
public class ItemsTypePriceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
//        获取商品类型
        String itemsType = request.getParameter("type");
//        获取用户ID
        Applicant applicant = (Applicant)request.getSession().getAttribute("SESSION_APPLICANT");
        int applicantID = applicant.getApplicantId();
        request.getSession().setAttribute("SESSION_PRICEID", applicant.getApplicantId());
//        获取用户邮箱
        String applicantEmail = applicant.getApplicantEmail();
//        获取数据库DAO
        ItemsTypeDAO itemsTypeDAO = new ItemsTypeDAO();
//        判断获取的商品类型
        if(itemsType.equals("free")){
            String thingsType = "免费版";
            String thingsPrice = "￥ 0 /月";
            String thingsIntroduce = "3000事件数/月，1个成员，1个项目，数据保存 7天";
//            将免费版信息存入表中
            itemsTypeDAO.save(applicantID, thingsType, thingsPrice, thingsIntroduce);
//            将信息存入session中
            ItemsType itemFree = new ItemsType(applicantEmail, applicantID, thingsType, thingsPrice, thingsIntroduce);
            request.getSession().setAttribute("SESSION_PRICE", itemFree);
//            重定向到该页面
            response.sendRedirect("funDebugPrice.jsp");
        }else if(itemsType.equals("pay")){
            String thingsType = "付费版";
            String thingsPrice = "¥ 359 /月";
            String thingsIntroduce = "45万 事件数/月，20 个成员，50 个项目，数据保存 30 天";
//            将付费版信息存入表中
            itemsTypeDAO.save(applicantID, thingsType, thingsPrice, thingsIntroduce);
//            将信息存入session中
            ItemsType itemPay = new ItemsType(applicantEmail, applicantID, thingsType, thingsPrice, thingsIntroduce);
            request.getSession().setAttribute("SESSION_PRICE", itemPay);
//            重定向到该页面
            response.sendRedirect("funDebugPrice.jsp");
        }else if (itemsType.equals("native")){
            String thingsType = "本地版";
            String thingsPrice = "¥ 30万 /年起";
            String thingsIntroduce = "本地版使用Docker容器打包，快速部署到您的私有服务器";
//            将本地版信息存入表中
            itemsTypeDAO.save(applicantID, thingsType, thingsPrice, thingsIntroduce);
//            将信息存入session中
            ItemsType itemNative = new ItemsType(applicantEmail, applicantID, thingsType, thingsPrice, thingsIntroduce);
            request.getSession().setAttribute("SESSION_PRICE", itemNative);
            //            重定向到该页面
            response.sendRedirect("funDebugPrice.jsp");
        }else if (itemsType.equals("delete")){
            itemsTypeDAO.delete(applicantID);
//            清空session
            Enumeration itemSession = (Enumeration)request.getSession().getAttributeNames();
            while (itemSession.hasMoreElements()){
                String sessionName = (String)itemSession.nextElement();
                if(sessionName == "SESSION_PRICE")
                request.getSession().removeAttribute(sessionName);
            }
//            重定向到priced界面
            response.sendRedirect("priced.jsp");
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
