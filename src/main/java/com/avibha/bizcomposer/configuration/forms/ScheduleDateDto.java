package com.avibha.bizcomposer.configuration.forms;

import java.util.Date;
import java.util.Vector;

public class ScheduleDateDto {
    private int id;
    private int type;
    private Date date;
    private int storeID = -1;
    private Vector<Date> vTimes = null;
    private String time = "";
    private int isCompleted = -1;
    private String period;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getStoreID() {
        return storeID;
    }

    public void setStoreID(int storeID) {
        this.storeID = storeID;
    }

    public Vector<Date> getvTimes() {
        return vTimes;
    }

    public void setvTimes(Vector<Date> vTimes) {
        this.vTimes = vTimes;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getIsCompleted() {
        return isCompleted;
    }

    public void setIsCompleted(int isCompleted) {
        this.isCompleted = isCompleted;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }
}
