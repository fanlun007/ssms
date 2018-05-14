package com.fanlun.bean;

/**
 * Author:     反轮
 * Created in: 2017/12/20 13:15
 * Description:
 */
public class Banji {
    private int id;
    private int classnum;
    private int sno;

    public Banji() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public Banji(int classnum) {
        this.classnum = classnum;
    }

    public int getClassnum() {
        return classnum;
    }

    public void setClassnum(int classnum) {
        this.classnum = classnum;
    }

    @Override
    public String toString() {
        return "Banji{" +
                "id=" + id +
                ", classnum=" + classnum +
                ", sno=" + sno +
                '}';
    }
}
