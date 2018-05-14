package com.fanlun.bean;

/**
 * Author:     反轮
 * Created in: 2017/11/22 21:42
 * Description:
 */
public class Page {
    private int page;
    private int rows;
    private int start;

    public Page(int page, int rows) {
        this.page = page;
        this.rows = rows;
    }

    public Page(int page, int rows, int start) {
        this.page = page;
        this.rows = rows;
        this.start = start;
    }

    public Page() {
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getStart() {
        return (page - 1) * rows;
    }

    public void setStart(int start) {
        this.start = start;
    }
}
