package cn.edu.seu.agriculture.entity;

import java.util.Date;

public class DatePrice {
    private Date date;

    private String province;

    private String market;

    private String type;

    private String name;

    private Double price;

    public DatePrice(Date date, String province, String market, String type, String name, Double price) {
        this.date = date;
        this.province = province;
        this.market = market;
        this.type = type;
        this.name = name;
        this.price = price;
    }

    public DatePrice() {
        super();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getMarket() {
        return market;
    }

    public void setMarket(String market) {
        this.market = market == null ? null : market.trim();
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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}