package cn.edu.seu.agriculture.web;

import cn.edu.seu.agriculture.exception.DataNotExistException;
import cn.edu.seu.agriculture.exception.PathInvalidException;
import cn.edu.seu.agriculture.service.DatePriceService;
import cn.edu.seu.agriculture.service.ReTypeService;
import cn.edu.seu.agriculture.service.TocSearchService;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Type;
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
}
