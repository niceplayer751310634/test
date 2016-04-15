package nice.category.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nice.category.domain.*;
import nice.category.service.*;
import nice.tools.servlet.BaseServlet;

public class CategoryServlet extends BaseServlet{


		private static final long serialVersionUID = 1L;
		private CategoryService categoryService = new CategoryService();	
		
		public String findAll(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			List<Category> parents = categoryService.findAll();
			req.setAttribute("parents", parents);
			return "f:/jsps/left.jsp";
		}
	}

