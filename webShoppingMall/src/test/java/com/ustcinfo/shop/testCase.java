package com.ustcinfo.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.ustcinfo.shop.dao.UserDao;
import com.ustcinfo.shop.entity.User;





public class testCase {
	
	private UserDao dao;


	@Test
	public void test2() {
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring-mvc.xml");
		dao=ac.getBean("userDao",UserDao.class);
		User user=new User();
		user.setUsername("李林w");
		user.setPassword("123456");
		user.setEmail("1142114078@qq.com");
		dao.saveUser(user);
		
	}
	
	@Test
	public void test3() {
		ApplicationContext ac=new ClassPathXmlApplicationContext("spring-mvc.xml");
		MongoOperations mongoOperation =(MongoOperations)ac.getBean("mongoTemplate"); 
		DBCollection testdb  =  mongoOperation.getCollection("userprofile");
//		BasicDBObject aa = new BasicDBObject();
//		aa.put("country", "美国");
//		aa.put("capital", "华盛顿");
//		aa.put("president","Trump");
//		BasicDBObject bb = new BasicDBObject();
//		bb.put("country", "英国");
//		bb.put("capital", "伦敦");
//		bb.put("president","Theresa");
//		testdb.insert(aa);
//		testdb.insert(bb);
		
		DBCursor cur = testdb.find();
		List<DBObject> li = cur.toArray();
		for (DBObject dbObject : li) {
			System.out.println(dbObject);
			System.out.println(dbObject.get("country"));
		}
		
		 
	
	}  
	
}
