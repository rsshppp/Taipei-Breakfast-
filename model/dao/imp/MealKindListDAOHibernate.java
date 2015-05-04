package model.dao.imp;

import java.util.Iterator;
import java.util.List;

import model.bean.MealKindListBean;
import model.dao.MealKindListDAO;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
//建立-Gary
public class MealKindListDAOHibernate implements MealKindListDAO {
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public MealKindListBean selectOne(int mklID) {
		MealKindListBean bean=(MealKindListBean)this.getSession().get(MealKindListBean.class, mklID);
		return bean;
	}

	@Override
	public List<MealKindListBean> selectAll() {
		List<MealKindListBean> list=this.getSession().createQuery("from MealKindListBean").list();
		return list;
	}

	@Override
	public boolean insert(MealKindListBean bean) {
		Criteria criteria=this.getSession().createCriteria(MealKindListBean.class);
		criteria.add(Restrictions.eq("mealKindName", bean.getMealKindName()));
		Iterator<MealKindListBean> iterator=criteria.list().iterator();
		if(iterator.hasNext()){
			return false;
		}else{
			this.getSession().save(bean);
			return true;
		}
	}

	@Override
	public boolean update(MealKindListBean bean) {
		MealKindListBean result=(MealKindListBean)this.getSession().get(MealKindListBean.class, bean.getMealKindID());
		if(result==null){
			return false;
		}else{
			result.setMealKindName(bean.getMealKindName());
			result.setDefaultImage(bean.getDefaultImage());
			return true;
		}
	}

}