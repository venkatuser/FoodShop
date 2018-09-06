package config;


import javax.persistence.*;

@Entity
@Table(name = "product_info")
public class Product_info {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id")
	int produc_id;
	
	@Column(name = "product_name")
	String product_name;
	
	@Column(name = "product_amount")
	String product_amount;
	
	@Column(name = "product_description")
	String product_description;
	
	@Column(name = "product_image")
	String product_image;
	
	@Column(name = "product_availability")
	String product_availability;
	
	@Column(name = "category_type")
	String category_type;
	
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_amount() {
		return product_amount;
	}
	public void setProduct_amount(String product_amount) {
		this.product_amount = product_amount;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public String getProduct_availability() {
		return product_availability;
	}
	public void setProduct_availability(String product_availability) {
		this.product_availability = product_availability;
	}
	public String getCategory_type() {
		return category_type;
	}
	public void setCategory_type(String category_type) {
		this.category_type = category_type;
	}
	public int getProduc_id() {
		return produc_id;
	}
	public void setProduc_id(int produc_id) {
		this.produc_id = produc_id;
	}
	
}
