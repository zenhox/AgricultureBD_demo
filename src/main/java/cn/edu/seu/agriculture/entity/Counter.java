package cn.edu.seu.agriculture.entity;

import java.util.Date;

public class Counter {
    private Date crawtime;

    private Integer marketcounter;

    private Integer typecounter;

    private Integer namecounter;

    private Integer crawcounter;

    private Integer dailycounter;

    public Counter(Date crawtime, Integer marketcounter, Integer typecounter, Integer namecounter, Integer crawcounter, Integer dailycounter) {
        this.crawtime = crawtime;
        this.marketcounter = marketcounter;
        this.typecounter = typecounter;
        this.namecounter = namecounter;
        this.crawcounter = crawcounter;
        this.dailycounter = dailycounter;
    }

    public Counter() {
        super();
    }

    public Date getCrawtime() {
        return crawtime;
    }

    public void setCrawtime(Date crawtime) {
        this.crawtime = crawtime;
    }

    public Integer getMarketcounter() {
        return marketcounter;
    }

    public void setMarketcounter(Integer marketcounter) {
        this.marketcounter = marketcounter;
    }

    public Integer getTypecounter() {
        return typecounter;
    }

    public void setTypecounter(Integer typecounter) {
        this.typecounter = typecounter;
    }

    public Integer getNamecounter() {
        return namecounter;
    }

    public void setNamecounter(Integer namecounter) {
        this.namecounter = namecounter;
    }

    public Integer getCrawcounter() {
        return crawcounter;
    }

    public void setCrawcounter(Integer crawcounter) {
        this.crawcounter = crawcounter;
    }

    public Integer getDailycounter() {
        return dailycounter;
    }

    public void setDailycounter(Integer dailycounter) {
        this.dailycounter = dailycounter;
    }
}