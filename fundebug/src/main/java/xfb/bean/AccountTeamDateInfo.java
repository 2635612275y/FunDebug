package xfb.bean;

/**
 * @description:
 * @author: xfb
 * @time: 2020/12/29 13:59
 */

import xfb.dao.AccountDAO;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @description:
 * @author: xfb
 * @time: 2020/12/28 22:42
 */
public class AccountTeamDateInfo {
    // 标识
    private int teamId;
    private String teamName;
    private String teamShort;
    private int teamNumber;
    private String teamCaptain;
    private String teamDate;

    public AccountTeamDateInfo() {
        super();
    }

    public AccountTeamDateInfo(String teamName, String teamShort, int teamNumber, String teamCaptain, String teamDate) {
        this.teamShort = teamShort;
        this.teamName = teamName;
        this.teamNumber = teamNumber;
        this.teamCaptain = teamCaptain;
        this.teamDate = teamDate;
    }

    public String getTeamShort() {
        return teamShort;
    }

    public void setTeamShort(String teamShort) {
        this.teamShort = teamShort;
    }

    public int getTeamId() {
        return teamId;
    }

    public void setTeamId(int teamId) {
        this.teamId = teamId;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public int getTeamNumber() {
        return teamNumber;
    }

    public void setTeamNumber(int teamNumber) {
        this.teamNumber = teamNumber;
    }

    public String getTeamCaptain() {
        return teamCaptain;
    }

    public void setTeamCaptain(String teamCaptain) {
        this.teamCaptain = teamCaptain;
    }

    public String getTeamDate() {
        return teamDate;
    }

    public void setTeamDate(String teamDate) {
        this.teamDate = teamDate;
    }
}