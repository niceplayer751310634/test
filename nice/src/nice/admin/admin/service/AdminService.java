package nice.admin.admin.service;

import java.util.List;
import java.sql.SQLException;

import nice.admin.admin.dao.AdminDao;
import nice.admin.admin.domain.Admin;
import nice.order.domain.Order;
import nice.user.domain.User;

public class AdminService {
	private AdminDao adminDao = new AdminDao();
	
	/**
	 * 登录功能
	 * @param admin
	 * @return
	 */
	public Admin login(Admin admin) {
		try {
			return adminDao.find(admin.getAdminname(), admin.getAdminpwd());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public  List<User> findAll() {
		try {
			return adminDao.findAll();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public  List<Order> findcomm() {
		try {
			return adminDao.findcomm();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public  void delete(String uid) {
		try {
			adminDao.delete(uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public  void delete1(String uid) {
		try {
			adminDao.delete1(uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public  void deletecomm(String oid) {
		try {
			adminDao.deletecomm(oid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public  void deletecomm1(String oid) {
		try {
			adminDao.deletecomm1(oid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
