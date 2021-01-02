package xfb.bean;

/**
 * @description:
 * @author: xfb
 * @time: 2020/12/30 14:43
 */
public class Email {
    //    邮件标识
    private String emailID;
    private String emailTitle;
    private String content;


    public Email() {
        super();
    }
    public Email(String emailTitle, String content) {
        this.emailTitle = emailTitle;
        this.content = content;
    }

    public String getEmailID() {
        return emailID;
    }

    public void setEmailID(String emailID) {
        this.emailID = emailID;
    }

    public String getEmail() {
        return emailTitle;
    }

    public void setEmail(String email) {
        this.emailTitle = email;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
