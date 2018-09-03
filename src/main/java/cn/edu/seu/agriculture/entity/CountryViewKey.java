package cn.edu.seu.agriculture.entity;

import java.util.Date;

public class CountryViewKey {
    private Date date;

    private String type;

    private String name;

    public CountryViewKey(Date date, String type, String name) {
        this.date = date;
        this.type = type;
        this.name = name;
    }

    public CountryViewKey() {
        super();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}