package logic;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;


import config.user_login;

public class User_info_imp implements User_info_in {

	List<user_login> list=null;
	Session sess=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
	
	
	
	
	public List<user_login> getEmplyee(int id) {
		Criteria c=sess.createCriteria(user_login.class);
		c.add(Restrictions.eq("id", id));
		list=c.list();
		return list;
	}
	
	public boolean updateUser(user_login ob) {
		boolean b=false;
		try {
			Transaction tr=sess.beginTransaction();
			
			user_login uob=(user_login)sess.get(user_login.class, ob.getId());
			uob.setAddress(ob.getAddress());
			uob.setAge(ob.getAge());
			uob.setAlt_mobile(ob.getAlt_mobile());
			uob.setAlt_name(ob.getAlt_name());
			uob.setCity(ob.getCity());
			uob.setEmail(ob.getEmail());
			uob.setMobile(ob.getMobile());
			uob.setUsername(ob.getUsername());
			uob.setName(ob.getName());
			uob.setPin(ob.getPin());
			
			sess.update(uob);
			tr.commit();
			b=true;
		}catch(Exception e) {
			System.out.println(e);
		}
		return b;
	}

	
	public List<user_login> getEmployees() {
		CriteriaBuilder cb=sess.getCriteriaBuilder();
		CriteriaQuery<user_login> cq=cb.createQuery(user_login.class);
		Root<user_login> r=cq.from(user_login.class);
		Query<user_login> q=sess.createQuery(cq);
		list=q.list();
		return list;
	}
	
}
