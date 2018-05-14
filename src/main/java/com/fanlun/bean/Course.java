package com.fanlun.bean;

/**
 * Author:     反轮
 * Created in: 2017/12/17 21:53
 * Description:
 */
public class Course {
    private int cno;
    private String cn;

    public Course() {
    }

    public Course(int cno, String cn) {
        this.cno = cno;
        this.cn = cn;
    }

    public int getCno() {
        return cno;
    }

    public void setCno(int cno) {
        this.cno = cno;
    }

    public String getCn() {
        return cn;
    }

    public void setCn(String cn) {
        this.cn = cn;
    }

    @Override
    public String toString() {
        return "Course{" +
                "cno=" + cno +
                ", cn='" + cn + '\'' +
                '}';
    }
}
