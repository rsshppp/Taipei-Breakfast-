package model.UnitTest;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import model.bean.ShopBean;
import model.dao.ShopDAO;
import model.dao.imp.ShopDAOHibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ShopDAOHibernateTestWeng {                  //宗鈺
    private ApplicationContext context;
    private SessionFactory sessionFactory;
    private Session session;
    private ShopDAO dao;
	
	@Before
	public void setUp() throws Exception {
		context=new ClassPathXmlApplicationContext("beans.config.xml");
		sessionFactory=(SessionFactory)context.getBean("sessionFactory");
		session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		dao=(ShopDAOHibernate)context.getBean("shopDAOHibernate");
	}

	@After
	public void tearDown() throws Exception {
		session.getTransaction().commit();
	    sessionFactory.close();
	   ((ConfigurableApplicationContext)context).close();
	}

	@Test
	public void testSelect() {
		ShopBean bean=dao.select(3);                       //select
		System.out.println(bean); //假設session裡的shopID為3
	}

//	@Test
	public void testSelectAll() {
		List<ShopBean> list=dao.selectAll();              //selectAll
		System.out.println(list);
	}

//	@Test
	public void testGetShops() {
		List<ShopBean> list=dao.getShops(4);              //getshops
		System.out.println(list);  //假設session裡的ownID為4
	}

//	@Test
	public void testInsert() throws ParseException {
		ShopBean bean=new ShopBean();                     //insert
		bean.setShopName("Jackbox");
		bean.setShopPhone("02-87654321");
		bean.setShopCity("台北");
		bean.setShopArea("中山區");
		bean.setShopAddr("濱江路");
		SimpleDateFormat sdf = new SimpleDateFormat("k:mm");
		java.sql.Time time1=new java.sql.Time(sdf.parse("12:30").getTime());
		bean.setLastOrderNoon(time1);
		java.sql.Time time2=new java.sql.Time(sdf.parse("00:30").getTime());
		bean.setLastOrderNight(time2);
		bean.setOwnID(4);    //此處如何給值待前端做完再想或修改方法
		//bean.setLogoImage(logoImage);   //這裡還未完成!!!!!!!
		//bean.setShopSuspend(shopSuspend);//已有預設
		//bean.setShopCondID(1); //已有預設
		java.sql.Time time3=new java.sql.Time(sdf.parse("8:30").getTime());
		bean.setBeginBusinessTime(time3);
		java.sql.Time time4=new java.sql.Time(sdf.parse("12:30").getTime());
		bean.setEndBusinessTime(time4);
		bean.setBusinessTimeNote("星期二公休");
		if(dao.insert(bean)){
			session.getTransaction().commit();
			session=sessionFactory.getCurrentSession();
			session.beginTransaction();
			dao=(ShopDAOHibernate)context.getBean("shopDAOHibernate");
			ShopBean bean2=dao.selectByPhone(bean.getShopPhone());
			System.out.println(bean2);
		}else{
			System.out.println("insert失敗");
		}
	}

//	@Test
	public void testUpdate() throws ParseException {
		ShopBean bean=new ShopBean();                      //update
		bean.setShopID(12);  //假設session裡的shopID為12
		bean.setShopName("dogfood");
		bean.setShopPhone("02-77777777");
		bean.setShopCity("台北");
		bean.setShopArea("中山區");
		bean.setShopAddr("公園路123號");
		SimpleDateFormat sdf = new SimpleDateFormat("k:mm");
		java.sql.Time time1=new java.sql.Time(sdf.parse("11:30").getTime());
		bean.setLastOrderNoon(time1);
		java.sql.Time time2=new java.sql.Time(sdf.parse("23:30").getTime());
		bean.setLastOrderNight(time2);
		bean.setOwnID(4);    //此處如何給值待前端做完再想或修改方法
		//bean.setLogoImage(logoImage);   //這裡還未完成!!!!!!!
		java.sql.Time time3=new java.sql.Time(sdf.parse("7:30").getTime());
		bean.setBeginBusinessTime(time3);
		java.sql.Time time4=new java.sql.Time(sdf.parse("13:30").getTime());
		bean.setEndBusinessTime(time4);
		bean.setBusinessTimeNote("星期四公休");
		ShopBean bean2=dao.update(bean);
		System.out.println(bean2);
	}

//	@Test
	public void testChangeShopCondID() {
		ShopBean bean=new ShopBean();                  //更改店鋪狀態ID
		bean.setShopID(12);//假設session裡的shopID為12
		boolean b=dao.changeShopCondID(2,bean.getShopID());
		System.out.println("店鋪狀態設定是否成功:"+b);
	}

//	@Test
	public void testSuspendOrCancel() {
		boolean b=dao.suspendOrCancel(12);       //為後台管理停權所使用,可以停權,也可以取消停權    //假設session裡的shopID為12
      System.out.println("停權設定是否成功:"+b);
	}

}