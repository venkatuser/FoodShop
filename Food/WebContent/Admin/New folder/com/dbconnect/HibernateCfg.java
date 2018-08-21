package com.dbconnect;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class  HibernateCfg {

	public SessionFactory config() {
		
		SessionFactory sf = null;
		try{
			sf=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		}catch(Exception e) {
			System.out.println(e);
		}
		return sf;
	}
}
