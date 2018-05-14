package com.fanlun.bean;

/**
 * Author:     反轮
 * Created in: 2017/12/4 15:03
 * Description:
 */
public class Teacher {
    private int tno;
    private String tn;
    private Integer subject;
    private String password;

    @Override
    public String toString() {
        return "Teacher{" +
                "tno=" + tno +
                ", tn='" + tn + '\'' +
                ", subject=" + subject +
                ", password='" + password + '\'' +
                '}';
    }

    public Teacher() {
    }

    public Teacher(int tno, String tn, Integer subject, String password) {
        this.tno = tno;
        this.tn = tn;
        this.subject = subject;
        this.password = password;
    }

    public int getTno() {
        return tno;
    }

    public void setTno(int tno) {
        this.tno = tno;
    }

    public String getTn() {
        return tn;
    }

    public void setTn(String tn) {
        this.tn = tn;
    }

    public Integer getSubject() {
        return subject;
    }

    public void setSubject(Integer subject) {
        this.subject = subject;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
