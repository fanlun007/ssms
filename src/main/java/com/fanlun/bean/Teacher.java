package com.fanlun.bean;

import java.util.Date;

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
    private String sex;
    private String edu;
    private Date birth;
    private String nation;
    private String nativePlace;
    private String proTitle;
    private String docType;
    private String idNum;
    private String polStatus;
    private String isRet;
    private String mobille;
    private String address;
    private String rmarks;

    @Override
    public String toString() {
        return "Teacher{" +
                "tno=" + tno +
                ", tn='" + tn + '\'' +
                ", subject=" + subject +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", edu='" + edu + '\'' +
                ", birth=" + birth +
                ", nation='" + nation + '\'' +
                ", nativePlace='" + nativePlace + '\'' +
                ", proTitle='" + proTitle + '\'' +
                ", docType='" + docType + '\'' +
                ", idNum='" + idNum + '\'' +
                ", polStatus='" + polStatus + '\'' +
                ", isRet='" + isRet + '\'' +
                ", mobille='" + mobille + '\'' +
                ", address='" + address + '\'' +
                ", rmarks='" + rmarks + '\'' +
                '}';
    }

    public Teacher() {
    }

    public Teacher(int tno, String tn, Integer subject, String password, String sex, String edu, Date birth, String nation, String nativePlace, String proTitle, String docType, String idNum, String polStatus, String isRet, String mobille, String address, String rmarks) {
        this.tno = tno;
        this.tn = tn;
        this.subject = subject;
        this.password = password;
        this.sex = sex;
        this.edu = edu;
        this.birth = birth;
        this.nation = nation;
        this.nativePlace = nativePlace;
        this.proTitle = proTitle;
        this.docType = docType;
        this.idNum = idNum;
        this.polStatus = polStatus;
        this.isRet = isRet;
        this.mobille = mobille;
        this.address = address;
        this.rmarks = rmarks;
    }

    public Teacher(int tno, String tn, Integer subject, String password) {
        this.tno = tno;
        this.tn = tn;
        this.subject = subject;
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEdu() {
        return edu;
    }

    public void setEdu(String edu) {
        this.edu = edu;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getNativePlace() {
        return nativePlace;
    }

    public void setNativePlace(String nativePlace) {
        this.nativePlace = nativePlace;
    }

    public String getProTitle() {
        return proTitle;
    }

    public void setProTitle(String proTitle) {
        this.proTitle = proTitle;
    }

    public String getDocType() {
        return docType;
    }

    public void setDocType(String docType) {
        this.docType = docType;
    }

    public String getIdNum() {
        return idNum;
    }

    public void setIdNum(String idNum) {
        this.idNum = idNum;
    }

    public String getPolStatus() {
        return polStatus;
    }

    public void setPolStatus(String polStatus) {
        this.polStatus = polStatus;
    }

    public String getIsRet() {
        return isRet;
    }

    public void setIsRet(String isRet) {
        this.isRet = isRet;
    }

    public String getMobille() {
        return mobille;
    }

    public void setMobille(String mobille) {
        this.mobille = mobille;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRmarks() {
        return rmarks;
    }

    public void setRmarks(String rmarks) {
        this.rmarks = rmarks;
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
