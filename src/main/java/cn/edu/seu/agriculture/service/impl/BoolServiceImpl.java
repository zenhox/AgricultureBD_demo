package cn.edu.seu.agriculture.service.impl;

import cn.edu.seu.agriculture.dao.AppointmentMapper;
import cn.edu.seu.agriculture.dao.BookMapper;
import cn.edu.seu.agriculture.dto.AppointExecution;
import cn.edu.seu.agriculture.entity.Appointment;
import cn.edu.seu.agriculture.entity.Book;
import cn.edu.seu.agriculture.entity.BookExample;
import cn.edu.seu.agriculture.service.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class BoolServiceImpl implements BookService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    // 注入Service依赖
    @Autowired
    private BookMapper bookDao;

    @Autowired
    private AppointmentMapper appointmentDao;

    @Override
    public Book getById(long bookId) {
        return bookDao.selectByPrimaryKey(bookId);
    }

    @Override
    public List<Book> getList() {
        return null;
    }

    @Override
    @Transactional
    public AppointExecution appoint(long bookId, long studentId) {
        return null;
    }
}
