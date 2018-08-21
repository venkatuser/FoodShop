package process;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

import config.Orders;
import config.user_login;

public class TableJoins {
	static List list=null;
	static Session sess=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
	/*public List getOrderJoin(int id) {
		
	}*/
	public static void main(String arg[]) {
		int id=1,i=0;
		@SuppressWarnings("deprecation")
		Transaction tr=sess.beginTransaction();
		Criteria c=sess.createCriteria(Orders.class);
		c.setFetchMode("user_login", FetchMode.JOIN);
		c.add(Restrictions.eq("id", id));
		list=c.list();
		Iterator itr = list.iterator();
		Object object;
		while(itr.hasNext()) {
			object = (Object) itr.next();
			System.out.println(((user_login)object).getAlt_mobile());
		}
	}

}
