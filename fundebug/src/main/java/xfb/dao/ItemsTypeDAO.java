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
 * @time: 2021/1/1 9:42
 */
public class ItemsTypeDAO {
    /**
     * @description: 商品信息的存储
     * @param
     * @return:
     * @author: xfb
     * @time: 2021/1/1 9:44
     */
    public void save(int applicantID, String tingsType, String thingsPrice, String introduce) {
        Connection conn = null;
        try {
            conn = getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO tb_things(applicant_id, tb_thingsType, tb_thingsPrice, tb_addTimeDate, tb_introduce) VALUES(?,?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, applicantID);
            pstmt.setString(2, tingsType);
            pstmt.setString(3, thingsPrice);
            pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            pstmt.setString(5, introduce);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, pstmt,null );
        }
    }

    public void delete(int applicantID){
        Connection conn = null;
        try {
            conn = getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        PreparedStatement pstmt = null;
        String sql = "DELETE FROM tb_things WHERE applicant_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, applicantID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, pstmt,null );
        }
    }
}
