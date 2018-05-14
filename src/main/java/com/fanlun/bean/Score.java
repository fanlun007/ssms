package com.fanlun.bean;

/**
 * Author:     反轮
 * Created in: 2017/11/26 14:31
 * Description:
 */
public class Score {
    private Integer id;
    private Integer sno;
    private Integer cno;
    private Integer tno;
    private Integer year;
    private String semester;
    private Integer chapter;
    private float grade;

    public Score(Integer sno, Integer cno, Integer tno, Integer year, String semester, Integer chapter, float grade) {
        this.sno = sno;
        this.cno = cno;
        this.tno = tno;
        this.year = year;
        this.semester = semester;
        this.chapter = chapter;
        this.grade = grade;
    }

    public Score(Integer sno) {
        this.sno = sno;
    }

    @Override
    public String toString() {
        return "Score{" +
                "id=" + id +
                ", sno=" + sno +
                ", cno=" + cno +
                ", tno=" + tno +
                ", year=" + year +
                ", semester='" + semester + '\'' +
                ", chapter=" + chapter +
                ", grade=" + grade +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTno() {
        return tno;
    }

    public void setTno(Integer tno) {
        this.tno = tno;
    }

    public Score() {
    }

    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    public Integer getCno() {
        return cno;
    }

    public void setCno(Integer cno) {
        this.cno = cno;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public Integer getChapter() {
        return chapter;
    }

    public void setChapter(Integer chapter) {
        this.chapter = chapter;
    }

    public float getGrade() {
        return grade;
    }

    public void setGrade(float grade) {
        this.grade = grade;
    }
}
