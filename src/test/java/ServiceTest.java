import cn.edu.seu.agriculture.service.DatePriceService;
import com.sun.xml.internal.ws.api.ha.StickyFeature;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class ServiceTest extends BaseTest{
    @Autowired
    private DatePriceService datePriceService;
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Test
    public void DatePriceServiceTeste(){
        String province = "山西";
        String market = "山西省太原市河西农产品有限公司";
        String type = "蔬菜";
        String name = "油麦菜";
        List<Map<String,Object>> reList = datePriceService.getPriceListByInfo(
                province,market,type,name);
        logger.info(reList.toString());
    }

}
