import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class DaoTest extends BaseTest{

    @Autowired
    private BookMapper bookDao;

    @Test
    public void testInsert()throws Exception{
        Book book = new Book((long) 6666,"爱",1);
        bookDao.insert(book);
    }
}
