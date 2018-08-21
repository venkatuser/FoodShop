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

import config.Product_info;



public class Product_info_Imp implements Product_info_In{
	
	List<Product_info> list=null;
	Session sess=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
	
	
	public boolean addProduct(Product_info ob) {
		boolean b=false;
		try {
		
		Transaction tr=sess.beginTransaction();
		sess.save(ob);
		tr.commit();
		
		}catch(Exception e) {
			System.out.println(e);
		}
		return b;
	}

	
	public List<Product_info> getList() {
		
		CriteriaBuilder cb=sess.getCriteriaBuilder();
		CriteriaQuery<Product_info> cq=cb.createQuery(Product_info.class);
		Root<Product_info> r=cq.from(Product_info.class);
		Query<Product_info> q=sess.createQuery(cq);
		list=q.list();
		return list;
		
	}


	
	public List<Product_info> getPrList(int id) {
		Criteria c=sess.createCriteria(Product_info.class);
		c.add(Restrictions.eq("produc_id", id));
		list=c.list();
		return list;
	}

	public List<Product_info> search(String q) {
		
		Criteria c=sess.createCriteria(Product_info.class);
		c.add(Restrictions.like("product_name","%"+q+"%"));
		list=c.list();
		
		return list;
	}


	public boolean updateProduct(Product_info ob) {
		
		boolean b=false;
		
		try {
			Transaction tr=sess.beginTransaction();
			
			Product_info uob=(Product_info)sess.get(Product_info.class, ob.getProduc_id());
			
			uob.setProduc_id(ob.getProduc_id());
			uob.setProduct_amount(ob.getProduct_amount());
			uob.setProduct_availability(ob.getProduct_availability());
			uob.setProduct_description(ob.getProduct_description());
			uob.setProduct_name(ob.getProduct_name());
			sess.update(uob);
			tr.commit();
			b=true;
			}catch(Exception e) {
				System.out.println(e);
			}
			
		return b;
	}


	
	public boolean deleteProduct(Product_info ob) {
		boolean b=false;
		System.out.println("gdfgdfghdfgdfgd");
		Transaction tr=sess.beginTransaction();
		Query q=sess.createQuery("delete from Product_info where id=:id");
		q.setParameter("id", ob.getProduc_id());
		int n=q.executeUpdate();
		b=n>0;
		tr.commit();
		return b;
	}



	public List<Product_info> getAvList() {
		
		Criteria c=sess.createCriteria(Product_info.class);
		c.add(Restrictions.like("product_availability","%No%"));
		list=c.list();
		
		return list;
	}
	
}
