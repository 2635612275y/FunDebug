package xfb.bean;

import java.sql.Timestamp;

/**
 * @description:
 * @author: xfb
 * @time: 2021/1/1 9:34
 */
public class ItemsType {
//    商品id标识
    private int tingsID;
    private int applicantID;
    private String thingsPrice;
    private String tingsType;
    private Timestamp addTime;
    private String introduce;
    private String applicantEmail;

    public ItemsType() {
        super();
    }

    public ItemsType(String applicantEmail, int applicantID, String tingsType, String thingsPrice, String introduce) {
        this.applicantEmail = applicantEmail;
        this.applicantID = applicantID;
        this.tingsType = tingsType;
        this.thingsPrice = thingsPrice;
        this.introduce = introduce;
    }

    public int getTingsID() {
        return tingsID;
    }

    public void setTingsID(int tingsID) {
        this.tingsID = tingsID;
    }

    public String getThingsPrice() {
        return thingsPrice;
    }

    public void setThingsPrice(String thingsPrice) {
        this.thingsPrice = thingsPrice;
    }

    public String getTingsType() {
        return tingsType;
    }

    public void setTingsType(String tingsType) {
        this.tingsType = tingsType;
    }

    public Timestamp getAddTime() {
        return addTime;
    }

    public void setAddTime(Timestamp addTime) {
        this.addTime = addTime;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public int getApplicantID() {
        return applicantID;
    }

    public void setApplicantID(int applicantID) {
        this.applicantID = applicantID;
    }

    public String getApplicantEmail() {
        return applicantEmail;
    }

    public void setApplicantEmail(String applicantEmail) {
        this.applicantEmail = applicantEmail;
    }
}
