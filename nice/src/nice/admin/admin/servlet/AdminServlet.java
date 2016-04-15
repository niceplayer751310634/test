package nice.admin.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nice.commons.CommonUtils;
import nice.admin.admin.domain.Admin;
import nice.admin.admin.service.AdminService;
import nice.servlet.BaseServlet;

public class AdminServlet extends BaseServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();
	
	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setAttribute("user",adminService.findAll());
		return "f:/adminjsps/admin/user/list.jsp";
	}
	
	public String delete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String uid = req.getParameter("uid");
		adminService.delete(uid);
		return findAll(req, resp);
	}
	
	public String delete1(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String uid = req.getParameter("uid");
		adminService.delete1(uid);
		return findAll(req, resp);
	}
	
	public String deletecomm(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid = req.getParameter("oid");
		adminService.deletecomm(oid);
		return findcomm(req, resp);
	}
	
	public String deletecomm1(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid = req.getParameter("oid");
		adminService.deletecomm1(oid);
		return findcomm(req, resp);
	}
	
	public String findcomm(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setAttribute("order",adminService.findcomm());
		return "f:/adminjsps/admin/comment/comm.jsp";
	}
	
	public String login(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Admin form = CommonUtils.toBean(req.getParameterMap(), Admin.class);
		Admin admin = adminService.login(form);
		if(admin == null) {
			req.setAttribute("msg", "用户名或密码错误！");
			return "/adminjsps/login.jsp";
		}
		req.getSession().setAttribute("admin", admin);
		return "r:/adminjsps/admin/index.jsp";
	}
}
