package nice.admin.book.servlet;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import nice.commons.CommonUtils;
import nice.book.domain.Book;
import nice.book.service.BookService;
import nice.category.domain.Category;
import nice.category.service.CategoryService;


public class AdminAddBookServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setFileSizeMax(80 * 1024);
		List<FileItem> fileItemList = null;
		try {
			fileItemList = sfu.parseRequest(request);
		} catch (FileUploadException e) {
			error("上传的文件超出了80KB", request, response);
			return;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		for (FileItem fileItem : fileItemList) {
			if (fileItem.isFormField()) {// 如果是普通表单字段
				map.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
			}
		}
		Book book = CommonUtils.toBean(map, Book.class);// 把Map中大部分数据封装到Book对象中
		Category category = CommonUtils.toBean(map, Category.class);// 把Map中cid封装到Category中
		book.setCategory(category);
		FileItem fileItem = fileItemList.get(1);
		String filename = fileItem.getName();
		int index = filename.lastIndexOf("\\");
		if (index != -1) {
			filename = filename.substring(index + 1);
		}
		filename = CommonUtils.uuid() + "_" + filename;
		if (!filename.toLowerCase().endsWith(".jpg")) {
			error("上传的图片扩展名必须是JPG", request, response);
			return;
		}
		String savepath = this.getServletContext().getRealPath("/book_img");
		File destFile = new File(savepath, filename);
		try {
			fileItem.write(destFile);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		ImageIcon icon = new ImageIcon(destFile.getAbsolutePath());
		Image image = icon.getImage();
		if (image.getWidth(null) > 350 || image.getHeight(null) > 350) {
			error("您上传的图片尺寸超出了350*350！", request, response);
			destFile.delete();// 删除图片
			return;
		}
		book.setImage_w("book_img/" + filename);
		fileItem = fileItemList.get(2);
		filename = fileItem.getName();
		index = filename.lastIndexOf("\\");
		if (index != -1) {
			filename = filename.substring(index + 1);
		}
		filename = CommonUtils.uuid() + "_" + filename;
		if (!filename.toLowerCase().endsWith(".jpg")) {
			error("上传的图片扩展名必须是JPG", request, response);
			return;
		}
		savepath = this.getServletContext().getRealPath("/book_img");
		destFile = new File(savepath, filename);
		try {
			fileItem.write(destFile);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		icon = new ImageIcon(destFile.getAbsolutePath());
		image = icon.getImage();
		if (image.getWidth(null) > 350 || image.getHeight(null) > 350) {
			error("您上传的图片尺寸超出了350*350！", request, response);
			destFile.delete();
			return;
		}
		book.setImage_b("book_img/" + filename);
		book.setBid(CommonUtils.uuid());
		BookService bookService = new BookService();
		bookService.add(book);
		request.setAttribute("msg", "添加商品成功！");
		request.getRequestDispatcher("/adminjsps/msg.jsp").forward(request,
				response);
	}

	private void error(String msg, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("msg", msg);
		request.setAttribute("parents", new CategoryService().findParents());// 所有一级分类
		request.getRequestDispatcher("/adminjsps/admin/book/add.jsp").forward(
				request, response);
	}
}
