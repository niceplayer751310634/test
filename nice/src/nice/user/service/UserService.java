package nice.user.service;

import java.io.IOException;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;

import nice.commons.CommonUtils;
import nice.user.dao.UserDao;
import nice.user.domain.User;
import nice.user.service.exception.UserException;
import nice.mail.MailUtils;
import nice.mail.Mail;

public class UserService {
	private UserDao userDao = new UserDao();
	
	public void updatePassword(String uid, String newPass, String oldPass) throws UserException {

		try {
			boolean bool = userDao.findByUidAndPassword(uid, oldPass);
			if(!bool) {
				throw new UserException("老密码错误！");
			}
			userDao.updatePassword(uid, newPass);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public User login(User user) {
		try {
			return userDao.findByLoginnameAndLoginpass(user.getLoginname(), user.getLoginpass());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void activatioin(String code) throws UserException {
		try {
			User user = userDao.findByCode(code);
			if(user == null) throw new UserException("无效的激活码！");
			if(user.getStatus()==1) throw new UserException("您已经激活过了，不要二次激活！");
			userDao.updateStatus(user.getUid(), true);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public boolean ajaxValidateLoginname(String loginname) {
		try {
			return userDao.ajaxValidateLoginname(loginname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public boolean ajaxValidateEmail(String email) {
		try {
			return userDao.ajaxValidateEmail(email);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void regist(User user) throws SQLException, IOException, MessagingException {
		user.setUid(CommonUtils.uuid());
		user.setStatus(0);
		user.setActivationCode(CommonUtils.uuid() + CommonUtils.uuid());
		userDao.add(user);
		Properties prop = new Properties();
		prop.load(this.getClass().getClassLoader().getResourceAsStream("email_template.properties"));
		String host = prop.getProperty("host");
		String name = prop.getProperty("username");
		String pass = prop.getProperty("password");
		Session session = MailUtils.createSession(host, name, pass);
		String from = prop.getProperty("from");
		String to = user.getEmail();
		String subject = prop.getProperty("subject");
		String content = MessageFormat.format(prop.getProperty("content"), user.getActivationCode());
		Mail mail = new Mail(from, to, subject, content);
		MailUtils.send(session, mail);
		}
}
