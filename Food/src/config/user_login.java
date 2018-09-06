package config;

import javax.persistence.*;

@Entity
@Table(name = "user_login")
public class user_login{
	 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	int id;
	
	@Column(name = "Name")
	String name;
	
	@Column(name = "Age")
	int Age;
	
	@Column(name = "Email")
	String Email;
	
	@Column(name = "Mobile")
	String Mobile;
	
	@Column(name = "Username")
	String username;
	
	@Column(name = "Password")
	String password;
	
	@Column(name = "Address")
	String Address;
	String city;
	
	@Column(name = "Pin")
	String pin;
	
	@Column(name = "Alt_name")
	String Alt_name;
	
	@Column(name = "Alt_mobile")
	String Alt_mobile;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return Age;
	}

	public void setAge(int age) {
		Age = age;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getMobile() {
		return Mobile;
	}

	public void setMobile(String mobile) {
		Mobile = mobile;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
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

	public String getAlt_name() {
		return Alt_name;
	}

	public void setAlt_name(String alt_name) {
		Alt_name = alt_name;
	}

	public String getAlt_mobile() {
		return Alt_mobile;
	}

	public void setAlt_mobile(String alt_mobile) {
		Alt_mobile = alt_mobile;
	}
	
}
