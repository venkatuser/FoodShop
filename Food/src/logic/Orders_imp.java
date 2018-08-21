package logic;

import java.time.LocalDate;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;

import config.Orders;
import config.Product_info;

public class Orders_imp implements Orders_in {

	List<Orders> list=null;
	Session sess=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
	Transaction tr=sess.beginTransaction();
	public boolean addOrder(Orders or) {
		
		boolean b=false;
		try {
		sess.save(or);
		tr.commit();
		
		}catch(Exception e) {
			System.out.println(e);
		}
		return b;
		
	}

	public List<Orders> getOrders(int uid) {
		
		Criteria c=sess.createCriteria(Orders.class);
		c.add(Restrictions.eq("user_id", uid));
		list=c.list();
		
		return list;
	}
	public List<Orders> getOrder(int id) {
		
		Criteria c=sess.createCriteria(Orders.class);
		c.add(Restrictions.eq("id", id));
		list=c.list();
		
		return list;
	}

	
	public List<Orders> getOrders() {
		Criteria c=sess.createCriteria(Orders.class);
		list=c.list();
		
		return list;
	}

	
	public boolean hideData(int id) {
		boolean b=false;
		
		Query qr=sess.createQuery(" delete from Orders where id=:id and order_status=:status");
		qr.setParameter("id", id);
		qr.setParameter("status", "Order Placed");
		int n=qr.executeUpdate();
		tr.commit();
		if(n>0) {
			b=true;
		}
		return b;
	}

	
	public boolean updateOrder(int id, String Status) {
		boolean b=false;
		Query qr=sess.createQuery("update Orders set order_status=:status where id=:id ");
		qr.setParameter("status", Status);
		qr.setParameter("id", id);
		int n=qr.executeUpdate();
		tr.commit();
		if(n>0) {
			b=true;
		}
		return b;
	}

	
	public int todayOrder() {
		Criteria c=sess.createCriteria(Orders.class);
		c.add(Restrictions.eq("date", LocalDate.now().toString()));
		Integer totalCount = c.setProjection(Projections.rowCount()).uniqueResult().hashCode();
		
		return totalCount;
	}




}
