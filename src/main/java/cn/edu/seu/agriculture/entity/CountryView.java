package cn.edu.seu.agriculture.entity;

import java.util.Date;

public class CountryView extends CountryViewKey {
    private String averagePrice;

    public CountryView(Date date, String type, String name, String averagePrice) {
        super(date, type, name);
        this.averagePrice = averagePrice;
    }

    public CountryView() {
        super();
    }
    public CountryView(Date date, String type, String name) {
        super(date, type, name);
    }

    public String getAveragePrice() {
        return averagePrice;
    }

    public void setAveragePrice(String averagePrice) {
        this.averagePrice = averagePrice == null ? null : averagePrice.trim();
    }
}