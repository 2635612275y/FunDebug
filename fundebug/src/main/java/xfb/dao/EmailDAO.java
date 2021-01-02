package xfb.dao;

import xfb.utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import static xfb.utils.DBUtils.getConnection;

/**
 * @description:
 * @author: xfb
 * @time: 2020/12/30 14:50
 */
public class EmailDAO {
    /**
     * @description: Email信息保存
     * @param
     * @return:
     * @author: xfb
     * @time: 2020/12/26 9:03
     */
    public void save(String emailTitle, String emailContent, int applicantID) {
        Connection conn = null;
        try {
            conn = getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO tb_email(tb_emailTitle, tb_emailContent, applicant_id, tb_emailRegisterDate) VALUES(?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, emailTitle);
            pstmt.setString(2, emailContent);
            pstmt.setInt(3, applicantID);
            pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, pstmt,null );
        }
    }
}
