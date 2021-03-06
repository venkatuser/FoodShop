package config;

import javax.persistence.*;

@Entity
@Table(name = "orders")
public class Orders {
	
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	int id;
	
	@Column(name = "user_id")
	int user_id;
	
	@Column(name = "product_id")
	int product_id;
	
	@Column(name = "quantity")
	int quantity;
	
	@Column(name = "Product_name")
	String Product_name;
	
	@Column(name = "order_status")
	String order_status;
	
	@Column(name = "date")
	String date;
	
	@Column(name = "time")
	String time;
	
	@Column(name = "address")
	String address;
	
	@Column(name = "City")
	String city;
	
	@Column(name = "pin")
	String pin;
	
	@Column(name = "Mobile")
	String mobile;
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPin() {
		return pin;
	}
	public void setPin(String pin) {
		this.pin = pin;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	double total_price;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getProduct_name() {
		return Product_name;
	}
	public void setProduct_name(String product_name) {
		Product_name = product_name;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}
}
