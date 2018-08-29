import cn.edu.seu.agriculture.service.DatePriceService;
import cn.edu.seu.agriculture.service.TocSearchService;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

public class ServiceTest extends BaseTest{
    @Autowired
    private DatePriceService datePriceService;
    @Autowired
    private TocSearchService tocSearchService;
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Test
    public void DatePriceServiceTest(){
        String province = "山西";
        String market = "山西省太原市河西农产品有限公司";
        String type = "蔬菜";
        String name = "油麦菜";
        List<Map<String,Object>> reList = datePriceService.getPriceListByInfo(
                province,market,type,name);
        logger.info(reList.toString());
    }

    @Test
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

}
