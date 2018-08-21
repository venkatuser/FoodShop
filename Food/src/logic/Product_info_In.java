package logic;

import java.util.List;

import config.Product_info;

public interface Product_info_In {
	public boolean addProduct(Product_info ob);
	public List<Product_info> getList();
	public List<Product_info> getPrList(int id);
	public List<Product_info> search(String q);
	public boolean updateProduct(Product_info ob);
	public boolean deleteProduct(Product_info ob);
	public List<Product_info> getAvList();
}
