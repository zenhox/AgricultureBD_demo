package cn.edu.seu.agriculture.entity;

public class UserInfo {
    private Integer userid;

    private String province;

    private String market;

    private String type;

    private String name;

    public UserInfo(Integer userid, String province, String market, String type, String name) {
        this.userid = userid;
        this.province = province;
        this.market = market;
        this.type = type;
        this.name = name;
    }

    public UserInfo() {
        super();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
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
}