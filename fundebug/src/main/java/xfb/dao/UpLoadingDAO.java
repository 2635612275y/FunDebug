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
 * @time: 2020/12/30 16:18
 */
public class UpLoadingDAO {
    /**
     * @description: 个人信息图片的更新保存
     * @param
     * @return:
     * @author: xfb
     * @time: 2020/12/26 9:03
     */
    public void save(int applicantID, String pic_directoryName) {
        Connection conn = null;
        try {
            conn = getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO tb_picture(applicant_id, pic_directoryName, pic_UpRegisterDate) VALUES(?,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, applicantID);
            pstmt.setString(2, pic_directoryName);
            pstmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, pstmt,null );
        }
    }
}
