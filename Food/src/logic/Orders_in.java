package logic;


import java.util.List;

import config.Orders;



public interface Orders_in {
	
	public boolean addOrder(Orders or);
	public List<Orders> getOrders(int uid);
	public List<Orders> getOrders();
	public List<Orders> getOrder(int id);
	public boolean hideData(int id);
	public boolean updateOrder(int id,String Status);
	public int todayOrder();
}
