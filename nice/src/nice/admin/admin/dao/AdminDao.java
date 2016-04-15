package nice.admin.admin.dao;

import java.util.List;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import nice.admin.admin.domain.Admin;
import nice.jdbc.TxQueryRunner;
import nice.order.domain.Order;
import nice.user.domain.User;

public class AdminDao {
	private QueryRunner qr = new TxQueryRunner();
	
	/**
	 * 通过管理员登录名和登录密码查询
	 * @param adminname
	 * @param adminpwd
	 * @return
	 * @throws SQLException
	 */
	public Admin find(String adminname, String adminpwd) throws SQLException {
		String sql = "select * from t_admin where adminname=? and adminpwd=?";
		return qr.query(sql, new BeanHandler<Admin>(Admin.class), adminname, adminpwd);
	}
	
	public List<User> findAll() throws SQLException{
		String sql = "select * from t_user  ";
		return qr.query(sql, new BeanListHandler<User>(User.class));
	}
	
	public List<Order> findcomm() throws SQLException{
		String sql = "select * from t_order  ";
		return qr.query(sql, new BeanListHandler<Order>(Order.class));
	}
	
	public void delete(String uid) throws SQLException {
		String sql = "UPDATE t_user SET status = 2 WHERE uid =?";
		qr.update(sql, uid);
	}
	
	public void delete1(String uid) throws SQLException {
		String sql = "UPDATE t_user SET status = 1 WHERE uid =?";
		qr.update(sql, uid);
	}
	
	public void deletecomm(String oid) throws SQLException {
		String sql = "UPDATE t_order SET commsta = 2 WHERE oid =?";
		qr.update(sql, oid);
	}
	
	public void deletecomm1(String oid) throws SQLException {
		String sql = "UPDATE t_order SET commsta = 1 WHERE oid =?";
		qr.update(sql, oid);
	}
}
