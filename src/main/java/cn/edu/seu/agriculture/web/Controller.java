package cn.edu.seu.agriculture.web;

import cn.edu.seu.agriculture.entity.DatePrice;
import cn.edu.seu.agriculture.service.*;
import cn.edu.seu.agriculture.service.DatePriceService;
import cn.edu.seu.agriculture.service.ReTypeService;
import cn.edu.seu.agriculture.service.TocSearchService;
import cn.edu.seu.agriculture.service.CountryViewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@org.springframework.stereotype.Controller
public class Controller {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private DatePriceService datePriceService;
    @Autowired
    private ReTypeService reTypeService;
    @Autowired
    private TocSearchService tocSearchService;
    @Autowired
    private CountryViewService countryViewService;
    @Autowired
    private PriceForecastService priceForecastService;

    @RequestMapping(value = "/datePrice/{province}/{market}/{type}/{name}",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String datePriceHandler(@PathVariable("province")String province,
                                       @PathVariable("market")String market,
                                       @PathVariable("type")String type,
                                       @PathVariable("name")String name ) {
        List<Map<String,Object>> reList = datePriceService.getPriceListByInfo(
                province,market,type,name);
        logger.info(reList.toString());
        return reTypeService.toJson(reList).toString();
    }

    @RequestMapping(value = "/datePrice",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public ModelAndView datePricePage(){
        ModelAndView retMap = new ModelAndView();  //返回新的ModelAndView
        retMap.setViewName("/datePrice.jsp");
        return retMap;
    }

    //下拉栏获取市场名
    @RequestMapping(value = "/getMarket",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String getMarket(String province) {
        System.out.println(province);
        ArrayList reList = tocSearchService.getMarketByProvince(province);
        logger.info(reList.toString());
        System.out.println(reList.toString());
        return reList.toString().replace(" ","");
    }

    //下拉栏获取品类名
    @RequestMapping(value = "/getType",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String getType(String province, String market) {
        System.out.println(market+" "+province);
        ArrayList reList = tocSearchService.getTypeByArea(province,market);
        logger.info(reList.toString());
        System.out.println(reList.toString());
        return reList.toString().replace(" ","");
    }

    //下拉栏获取品种名
    @RequestMapping(value = "/getName",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String getName(String province, String market, String type) {
        System.out.println(type+" "+market+" "+province);
        ArrayList reList = tocSearchService.getNameByAreaAndType(province,market,type);
        logger.info(reList.toString());
        System.out.println(reList.toString());
        return reList.toString().replace(" ","");
    }

    //获取监控的抓取数据
    @RequestMapping(value="/monitor",method =RequestMethod.GET,produces = {"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String Monitor(){
        List<DatePrice> datePrices =  datePriceService.getNewPriceList();
        logger.info(datePrices.toString());
        return reTypeService.toCsv(datePrices).toString();
    }
    //获取name,market,price,date
    @RequestMapping(value = "/AllData",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String AllData() {
        List<String> AllDataList = datePriceService.getRecentlyCounter();
        return AllDataList.toString().replace(" ","");
    }

    //用于比较页面查询相应数据
    @RequestMapping(value = "/getDataForContrast",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String getDataForContrast(String province, String market, String type, String name, String startDate,String endDate) {
        System.out.println(type+" "+market+" "+province+" "+name+" "+startDate+" "+endDate+"正在对比查询查询******");
        List<DatePrice> reList = datePriceService.getDetailPriceListByInfo(province,market,type,name,startDate,endDate);
        return reTypeService.toCsv(reList).toString();
    }


    //获取区域行情品名
    @RequestMapping(value = "/areaGetName",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String areaGetName(String type,String date) {
        ArrayList reList = tocSearchService.getNameByType(date,type);
        logger.info(reList.toString());
        return reList.toString().replace(" ","");
    }

    //获取局域数据
    @RequestMapping(value = "/areaGetAllData",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String areaGetAllData(String date,String type, String name){
        return countryViewService.getCountryViewPrice(date,type,name);
    }

    //获取过去30天及未来7天的预测价格
    @RequestMapping(value = "/getForecastPrice",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String getForecast(String province,String market,String type,String name ) {
        List<Map<String, Object>> reList = null;
        try{
            reList = priceForecastService.forecast(province, market, type, name);
        }catch (ParseException exception){
            System.out.println("价格预测服务出错");
            exception.printStackTrace();
        }
        logger.info(reList.toString());
        return reTypeService.toJson(reList).toString();
    }

    //监控市场
    @RequestMapping(value = "/getMarketCount",method = RequestMethod.GET,produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String getMarketCount(String province,String market,String type){
        return reTypeService.toJson(datePriceService.getCounter(province,market,type)).toString();
    }


}
