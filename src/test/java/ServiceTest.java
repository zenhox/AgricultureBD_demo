import cn.edu.seu.agriculture.service.DatePriceService;
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
    public List<Map<Date,Double>> testDatePriceService() throws Exception{
    }
}
