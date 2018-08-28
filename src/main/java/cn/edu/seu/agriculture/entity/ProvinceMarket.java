package cn.edu.seu.agriculture.entity;

public class ProvinceMarket {
    private String province;

    private String market;

    public ProvinceMarket(String province, String market) {
        this.province = province;
        this.market = market;
    }

    public ProvinceMarket() {
        super();
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
}