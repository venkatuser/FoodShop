package logic;

import java.sql.*;
import java.util.List;


import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;


import config.user_login;
import hashing.PBKDF2;

public class Login {

	Connection con;
	PreparedStatement ps;
	user_login ulog;
	
	public static String Username,mobile,email,address,pincode,city;
	private static int id;
	Session sess=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
	Transaction transaction=sess.beginTransaction();
	public String getName() {
		return Username;
	}
	public int getId() {
		return id;
	}
	public String getMobile() {
		return mobile;
	}
	public String getMail() {
		return email;
	}
	public boolean insertUserData(String uname,String email,String pass) {
		boolean b=false;
		String Password;
		try{
			
			ulog=new user_login();
			ulog.setUsername(uname);
			ulog.setEmail(email);
			Password=PBKDF2.getPassword(pass);
			ulog.setPassword(Password);
			sess.save(ulog);
			transaction.commit();
			
			b=true;
		}
		catch(Exception e){
			System.out.println(e);
		}
		return b;
	}
	
	
	public boolean checkLogin(String uname,String pass) {
		boolean b=false;
		
		try{
			
			Criteria c=sess.createCriteria(user_login.class);
			c.add(Restrictions.eq("username", uname));
			String Password=PBKDF2.getPassword(pass);
			c.add(Restrictions.eq("password",Password));
			List<user_login> list=c.list();
			if(list.iterator().hasNext()) {
				ulog=list.get(0);
				Username=ulog.getName();
				id=ulog.getId();
				mobile=ulog.getAlt_mobile();
				email=ulog.getEmail();
				pincode=ulog.getPin();
				address=ulog.getAddress();
				city=ulog.getCity();
				b=true;
			}
			transaction.commit();
			
		}
		catch(Exception e){
			System.out.println(e);
		}
		return b;
	}
	
	
	
}
