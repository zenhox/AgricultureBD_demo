import cn.edu.seu.agriculture.dao.BookMapper;
import cn.edu.seu.agriculture.entity.Book;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.InputStream;

public class DaoTest extends BaseTest{

    @Autowired
    private BookMapper bookDao;

    @Test
    public void testInsert()throws Exception{
        Book book = new Book((long) 6666,"爱",1);
        bookDao.insert(book);
    }
}
