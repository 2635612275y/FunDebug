package xfb.dao;

import xfb.bean.change;
import xfb.utils.DBUtils;

import java.sql.*;

import static xfb.utils.DBUtils.getConnection;

/**
 * @description:
 * @author: xfb
 * @time: 2020/12/26 8:56
 */
public class FunDebugUserDAO {
    /**
     * @description: 验证Email是否已被注册
     * @param
     * @return:
     * @author: xfb
     * @time: 2020/12/26 9:03
     */
    public boolean isExistEmail(String email) {
        Connection conn = null;
        try {
            conn = getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM tb_applicant WHERE applicant_email=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close( conn, pstmt,rs);
        }
        return false;
    }
    /**
     * @description: 注册信息保存
     * @param
     * @return:
     * @author: xfb
     * @time: 2020/12/26 9:03
     */
    public void save(String email, String password) {
        Connection conn = null;
        try {
            conn = getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO tb_applicant(applicant_email,applicant_pwd,applicant_registdate) VALUES(?,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            pstmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, pstmt,null );
        }
    }
    /**
     *
     *
     * @description: 注册用户登录
     * @param
     * @return:
     * @author: xfb
     * @time: 2020/12/26 12:03
     */
    public int login(String email, String password) {
        int applicantID = 0;
        Connection conn = null;
        try {
            conn = getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT applicant_id FROM tb_applicant WHERE applicant_email=? and applicant_pwd=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                applicantID = rs.getInt("applicant_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, pstmt,rs );
        }
        return applicantID;
    }
    /**
     *
     *
     * @description:判断是否已使用过该网站
     * @return:
     * @author: xfb
     * @time: 2020/12/26 12:44
     */
    public int isExistResume(int applicantID) {
        int resumeID = 0;
        Connection conn = null;
        try {
            conn = getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT teamInfo_id FROM tb_team WHERE applicant_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, applicantID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                resumeID = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, pstmt,rs );
        }
        return resumeID;
    }
}
