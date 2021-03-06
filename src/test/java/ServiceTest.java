import cn.edu.seu.agriculture.entity.CountryView;
import cn.edu.seu.agriculture.entity.DatePrice;
import cn.edu.seu.agriculture.service.*;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class ServiceTest extends BaseTest{
    @Autowired
    private DatePriceService datePriceService;
    @Autowired
    private TocSearchService tocSearchService;
    @Autowired
    private ReTypeService reTypeService;
    @Autowired
    private CountryViewService countryViewService;

    @Autowired
    private PriceForecastService priceForecastService;
    private Logger logger = LoggerFactory.getLogger(this.getClass());

//    @Test
    public void DatePriceServiceTest1(){
        String province = "山西";
        String market = "山西省太原市河西农产品有限公司";
        String type = "蔬菜";
        String name = "油麦菜";
        List<Map<String,Object>> reList = datePriceService.getPriceListByInfo(
                province,market,type,name);
        logger.info(reList.toString());
        SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
        String src = "2018-8-11";
        String dst = "2018-8-19";
        reList = datePriceService.getPriceListByInfo(
                province,market,type,name,src,dst);
        logger.info(reList.toString());
    }
//    @Test
    public void DatePriceServiceTest2(){
        String province = "山西";
        String market = "山西省太原市河西农产品有限公司";
        String type = "蔬菜";
        String name = "油麦菜";
        List<Map<String,Object>> reList = datePriceService.getPriceListByInfo(
                province,market,type,name,7);
        logger.info(reList.toString());
    }

//    @Test
    public void CategoryRelatedTest(){
//        Scanner in = new Scanner(System.in);    //Scanner类
//        while (true){
//            System.out.println("province list:"+tocSearchService.getProvinceList());
//            String province = in.next();
//            System.out.println("market list in["+province+"]:" + tocSearchService.getMarketByProvince(province));
//            String market = in.next();
//            System.out.println("type list in["+province+"|"+market+"]:" + tocSearchService.getTypeByArea(province,market));
//            String type = in.next();
//            System.out.println("name list in["+province+"|"+market+"|"+type+"]:" + tocSearchService.getNameByAreaAndType(province,market,type));
//            String name = in.next();
//            System.out.println("re list : "+ datePriceService.getPriceListByInfo(province,market,type,name));
//        }
    }

//    @Test
    public void CountryViewServiceTest(){

    }

    @Test
    public void  ForecastServiceTest() throws ParseException {
        String province = "山西";
        String market = "山西省太原市河西农产品有限公司";
        String type = "蔬菜";
        String name = "油麦菜";
        logger.info("\n原结果");
        List<Map<String,Object>> reList1 = datePriceService.getPriceListByInfo(province,market,type,name);
        logger.info(reList1.toString());
        List<Map<String,Object>> reList2 = priceForecastService.forecast(province,market,type,name);
        logger.info("\n预测结果");
        logger.info(reList2.toString());
    }

//    @Test
    public  void csvReTypeTest(){
        String province = "山西";
        String market = "山西省太原市河西农产品有限公司";
        String type = "蔬菜";
        String name = "油麦菜";
        String src = "2018-8-11";
        String dst = "2018-8-19";
        List<DatePrice> reList = datePriceService.getDetailPriceListByInfo(
                province,market,type,name,src,dst);
        logger.info("转换结果");
        System.out.println(reTypeService.toCsv(reList));
    }

//    @Test
    public  void counterTest(){
        logger.info("最新数据");
        List<DatePrice> datePrices =  datePriceService.getNewPriceList();
        logger.info(reTypeService.toCsv(datePrices));
        logger.info("最新统计");
        logger.info(datePriceService.getRecentlyCounter().toString());
    }
//    @Test
    public  void countryViewTest(){
        logger.info("\n 进行全国视图测试。。。。");
        System.out.println(countryViewService.getCountryViewPrice("2017-02-16","蔬菜","大白菜"));
    }
}
