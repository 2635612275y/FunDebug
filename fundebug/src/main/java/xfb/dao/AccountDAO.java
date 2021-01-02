package xfb.dao;

import xfb.bean.AccountTeamDateInfo;
import xfb.utils.DBUtils;

import java.sql.*;

/**
 * @description: 团队信息DAO
 * @author: xfb
 * @time: 2020/12/28 22:43
 */
public class AccountDAO {
    /**
     * 团队基本信息的添加
     * @param teamInfo
     * @param applicantID
     * @return
     */
    public int add(AccountTeamDateInfo teamInfo, int applicantID) {
        int teamID = 0;
        String sql = "INSERT INTO tb_team(team_name, team_short, team_number, team_captain, team_date, applicant_id) VALUES(?,?,?,?,?,?)";
        Connection conn = null;
        try {
            conn = DBUtils.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        PreparedStatement pstmt = null;
        try {
            // 关闭自动提交
            conn.setAutoCommit(false);
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, teamInfo.getTeamName());
            pstmt.setString(2, teamInfo.getTeamShort());
            pstmt.setInt(3, teamInfo.getTeamNumber());
            pstmt.setString(4, teamInfo.getTeamCaptain());
            pstmt.setString(5, teamInfo.getTeamDate());
            pstmt.setInt(6, applicantID);
            pstmt.executeUpdate();
            pstmt.close();

            // 获取当前生成的团队
            String sql2 = "SELECT teamInfo_id FROM tb_team where applicant_id=?";
            pstmt = conn.prepareStatement(sql2);
            pstmt.setInt(1, applicantID);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                teamID = rs.getInt(1);
                System.out.println("teamInfo" + teamID);
            }
            // 事务提交
            conn.commit();
        }    catch (SQLException e) {
            try {
                // 事务回滚
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, pstmt,null );
        }
        return teamID;
    }
    /**
     * 根据根据用户团队标识查询团队信息
     * @param applicantID
     * @return
     */
    public AccountTeamDateInfo selectAccountDateInfo(int applicantID){
        AccountTeamDateInfo team = new AccountTeamDateInfo();
        String sql = "SELECT * FROM tb_team WHERE applicant_id=?";
        Connection conn = null;
        try {
            conn = DBUtils.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, applicantID);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                team.setTeamId(rs.getInt("teamInfo_id"));
                team.setTeamCaptain(rs.getString("team_captain"));
                team.setTeamName(rs.getString("team_name"));
                team.setTeamShort(rs.getString("team_short"));
                team.setTeamNumber(rs.getInt("team_number"));
                team.setTeamDate(rs.getString("team_date"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, pstmt, null);
        }
        return team;
    }

    /**
     * 修改密码
     * @param applicant_id
     * @param newPassword
     */
    public int update(int applicant_id, String newPassword) {
        String sql = "UPDATE tb_applicant SET applicant_pwd=? WHERE applicant_id=?";
        Connection conn = null;
        try {
            conn = DBUtils.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newPassword);
            pstmt.setInt(2, applicant_id);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.close(conn, pstmt,null );
            return 0;
        }
    }

}
