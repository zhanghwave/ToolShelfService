package com.james.test;

import com.james.pojo.Orders;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.util.List;


public class TestOrders {
	
	private SqlSession session;
	
	@Before
	public void setUp(){
		try {
			session = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("mybatis.xml")).openSession(true);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@After
	public void tearDown(){
		if(session != null){
			session.close();
			session = null;
		}
	}

	@Test
	public void testGetAllOrders(){
		List<Orders> list = session.selectList("com.james.pojo.OrderMapper.getAllOrders");
		
		if(list != null){
			for (Orders orders : list) {
				System.out.println(orders);
			}
		}
	}
}
