package cn.edu.seu.agriculture.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@org.springframework.stereotype.Controller
public class Controller {
    private Logger logger = LoggerFactory.getLogger(this.getClass());


    @RequestMapping(value = "/hello/{name}",method = RequestMethod.GET)
    public String showView(@PathVariable("name")String name,Model model) {
        if (name == null){
            model.addAttribute("name"," world!");
        }else{
            model.addAttribute("name",name);
        }
        return "hello";
    }
//    @RequestMapping(value = "/list", method = RequestMethod.GET)
//    private String list(Model model) {
//        List<Book> list = bookService.getList();
//        model.addAttribute("list", list);
//        // list.jsp + model = ModelAndView
//        return "list";// WEB-INF/jsp/"list".jsp
//    }
//

//    //ajax json
//    @RequestMapping(value = "/{bookId}/appoint", method = RequestMethod.POST, produces = {
//            "application/json; charset=utf-8" })
//    @ResponseBody
//    private Result<AppointExecution> appoint(@PathVariable("bookId") Long bookId, @RequestParam("studentId") Long studentId) {
//        if (studentId == null || studentId.equals("")) {
//            return new Result<>(false, "学号不能为空");
//        }
//        //AppointExecution execution = bookService.appoint(bookId, studentId);//错误写法，不能统一返回，要处理异常（失败）情况
//        AppointExecution execution = null;
//        try {
//            execution = bookService.appoint(bookId, studentId);
//        } catch (NoNumberException e1) {
//            execution = new AppointExecution(bookId, AppointStateEnum.NO_NUMBER);
//        } catch (RepeatAppointException e2) {
//            execution = new AppointExecution(bookId, AppointStateEnum.REPEAT_APPOINT);
//        } catch (Exception e) {
//            execution = new AppointExecution(bookId, AppointStateEnum.INNER_ERROR);
//        }
//        return new Result<AppointExecution>(true, execution);
//    }

}
