package com.dbLogic;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Product_info;
import com.dbconnect.HibernateCfg;

public class HibernateProduct_info {

	HibernateCfg cfg=new HibernateCfg();
	Session session=cfg.config().openSession();
	Transaction tx=session.beginTransaction();
	
	
	public boolean AddProducts(Product_info pi) {
		boolean b=false;
		
		
		pi.getProduct_image();
		pi.getProduct_name();
		pi.getProduct_amount();
		pi.getProduct_availability();
		pi.getProduct_description();
		pi.getProduct_size();
		pi.getCategory_id();
		session.save(pi);
		tx.commit();
		
		return b=true;
	}
	
	
}
