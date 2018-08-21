package logic;

import java.util.List;

import config.user_login;

public interface User_info_in {
	public List<user_login> getEmplyee(int id);
	public boolean updateUser(user_login ob);
	public List<user_login> getEmployees();
}
