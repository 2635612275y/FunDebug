package xfb.servlet;

import xfb.bean.Applicant;
import xfb.bean.UpLoading;
import xfb.dao.UpLoadingDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@WebServlet("/UpLoadingServlet")
public class UpLoadingServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //读取请求Body
        byte[] body = readBody(request);
        //取得所有Body内容的字符串表示
        String textBody = new String(body, "ISO-8859-1");
        //取得上传的文件名称
        String fileName = getFileName(textBody);
        request.getSession().setAttribute("SESSION_PICTURE", fileName);

        //System.out.println("ffffffffffffff: "+fileName);
        //取得文件开始与结束位置
        Position p = getFilePosition(request, textBody);
        //输出至文件
        writeTo(fileName, body, p);
//        request.getSession().setAttribute("filename",fileName);
        //        获取用户的标识ID
        Applicant applicant = (Applicant)request.getSession().getAttribute("SESSION_APPLICANT");
        //            测试获取的id是否正确
        System.out.println("------------------");
        System.out.println(applicant.getApplicantId());
        System.out.println("------------------");

        UpLoadingDAO upLoading = new UpLoadingDAO();
        Integer applicantID = applicant.getApplicantId();
        try{
            upLoading.save(applicantID, fileName);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    class Position {
        int begin;
        int end;
        public Position(int begin, int end) {
            this.begin = begin;
            this.end = end;
        }
    }
    private Position getFilePosition(HttpServletRequest request, String textBody) throws IOException {
        //取得文件区段边界信息
        String contentType = request.getContentType();
        String boundaryText = contentType.substring(contentType.lastIndexOf("=") + 1, contentType.length());
        //取得实际上传文件的气势与结束位置
        int pos = textBody.indexOf("filename=\"");
        pos = textBody.indexOf("\n", pos) + 1;
        pos = textBody.indexOf("\n", pos) + 1;
        pos = textBody.indexOf("\n", pos) + 1;
        int boundaryLoc = textBody.indexOf(boundaryText, pos) - 4;
        int begin = ((textBody.substring(0, pos)).getBytes("ISO-8859-1")).length;
        int end = ((textBody.substring(0, boundaryLoc)).getBytes("ISO-8859-1")).length;

        return new Position(begin, end);
    }
    private String getFileName(String requestBody) {
        String fileName = requestBody.substring(requestBody.indexOf("filename=\"") + 10);
        fileName = fileName.substring(0, fileName.indexOf("\n"));
        fileName = fileName.substring(fileName.indexOf("\n") + 1, fileName.indexOf("\""));
        return fileName;
    }
    private void writeTo(String fileName, byte[] body, Position p) throws IOException {
        FileOutputStream fileOutputStream = new FileOutputStream("C:/Users/26356/IdeaProjects/FunDebugMaven/fundebug/src/main/webapp/img/HeadShotImage/" + fileName);
        fileOutputStream.write(body, p.begin, (p.end - p.begin));
        fileOutputStream.flush();
        fileOutputStream.close();
    }
    private byte[] readBody(HttpServletRequest request) throws IOException {
        //获取请求文本字节长度
        int formDataLength = request.getContentLength();
        //取得ServletInputStream输入流对象
        DataInputStream dataStream = new DataInputStream(request.getInputStream());
        byte body[] = new byte[formDataLength];
        int totalBytes = 0;
        while (totalBytes < formDataLength) {
            int bytes = dataStream.read(body, totalBytes, formDataLength);
            totalBytes += bytes;
        }
        return body;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        processRequest(request, response);
        response.sendRedirect("account.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
