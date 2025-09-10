package vn.iotstar.controllers.admin;

import java.io.IOException;
import java.util.List;
import vn.iotstar.entity.Category;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.services.CategoryService;
import vn.iotstar.services.impl.CategoryServiceImpl;
import jakarta.servlet.http.*;
@WebServlet(urlPatterns = {"/admin/categories"})
public class CategoryController extends HttpServlet {

	/**
	 * 
	 */
	CategoryService cateService = new CategoryServiceImpl();
	private static final long serialVersionUID = 1L;
	 @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        String action = req.getParameter("action");
	        
	        if (action != null) {
	            switch (action) {
	                case "edit":
	                    showEditForm(req, resp);
	                    break;
	                case "delete":
	                    deleteCategory(req, resp);
	                    break;
	                default:
	                    listCategories(req, resp);
	                    break;
	            }
	        } else {
	            listCategories(req, resp);
	        }
	    }

	    @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        String action = req.getParameter("action");
	        
	        if (action != null) {
	            switch (action) {
	                case "create":
	                    createCategory(req, resp);
	                    break;
	                case "update":
	                    updateCategory(req, resp);
	                    break;
	                default:
	                    listCategories(req, resp);
	                    break;
	            }
	        } else {
	            listCategories(req, resp);
	        }
	    }
	    
	    private void listCategories(HttpServletRequest req, HttpServletResponse resp) 
	            throws ServletException, IOException {
	        List<Category> listCategory = cateService.findAll();
	        req.setAttribute("listcate", listCategory);
	        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/categories.jsp");
	        rd.forward(req, resp);
	    }
	    
	    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) 
	            throws ServletException, IOException {
	        int id = Integer.parseInt(req.getParameter("id"));
	        Category category = cateService.findById(id);
	        req.setAttribute("category", category);
	        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/categories.jsp");
	        rd.forward(req, resp);
	    }
	    
	    private void createCategory(HttpServletRequest req, HttpServletResponse resp) 
	            throws ServletException, IOException {
	        String categoryname = req.getParameter("categoryname");
	        Category category = new Category();
	        category.setCategoryname(categoryname);
	        cateService.create(category);
	        resp.sendRedirect(req.getContextPath() + "/admin/categories");
	    }
	    
	    private void updateCategory(HttpServletRequest req, HttpServletResponse resp) 
	            throws ServletException, IOException {
	        int id = Integer.parseInt(req.getParameter("id"));
	        String categoryname = req.getParameter("categoryname");
	        Category category = cateService.findById(id);
	        category.setCategoryname(categoryname);
	        cateService.update(category);
	        resp.sendRedirect(req.getContextPath() + "/admin/categories");
	    }
	    
	    private void deleteCategory(HttpServletRequest req, HttpServletResponse resp) 
	            throws ServletException, IOException {
	        int id = Integer.parseInt(req.getParameter("id"));
	        cateService.delete(id);
	        resp.sendRedirect(req.getContextPath() + "/admin/categories");
	    }
}
