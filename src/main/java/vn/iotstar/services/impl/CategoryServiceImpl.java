package vn.iotstar.services.impl;

import java.util.List;

import vn.iotstar.dao.CategoryDao;
import vn.iotstar.dao.impl.CategoryImpl;
import vn.iotstar.entity.Category;
import vn.iotstar.services.CategoryService;

public class CategoryServiceImpl implements CategoryService {

	CategoryDao categoryDao = new CategoryImpl();

	@Override
	public List<Category> findAll() {
		return categoryDao.findAll();
	}

	@Override
	public void create(Category category) {
		categoryDao.create(category);
	}

	@Override
	public void update(Category category) {
		categoryDao.update(category);

	}

	@Override
	public void delete(int id) {
		categoryDao.delete(id);
	}

	@Override
	public Category findById(int id) {
		return categoryDao.findById(id);
	}

	@Override
	public List<Category> findByUserId(int userId) {
		return categoryDao.findByUserId(userId);
	}

}