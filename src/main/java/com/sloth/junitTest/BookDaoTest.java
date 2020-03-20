package com.sloth.junitTest;



import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sloth.dao.BookDao;
import com.sloth.entity.Book;

public class BookDaoTest extends BaseTest {

	@Autowired
	private BookDao bookDao;
	
	@Test
	public void testqueryById()
	{
		long id = 1000;
		Book book = bookDao.queryById(id);
		System.out.println(book);
		
	}
	@Test
	public void testQueryAll()
	{
		List<Book> book = bookDao.queryAll(0, 4);
		for (Book book2 : book) {
			System.out.println(book2);
		}
	}
	
	@Test
	public void testReduceNumber()
	{
		long bookId = 1000;
		int update = bookDao.reduceNumber(bookId);
		System.out.println("update=" + update);
	}
}
