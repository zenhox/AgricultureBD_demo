package cn.edu.seu.agriculture.entity;

public class CountryView extends CountryViewKey {
    private String averagePrice;

    public CountryView(String type, String name, String averagePrice) {
        super(type, name);
        this.averagePrice = averagePrice;
    }

    public CountryView() {
        super();
    }

    public String getAveragePrice() {
        return averagePrice;
    }

    public void setAveragePrice(String averagePrice) {
        this.averagePrice = averagePrice == null ? null : averagePrice.trim();
    }
}