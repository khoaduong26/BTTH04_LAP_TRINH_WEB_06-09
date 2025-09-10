package vn.iotstar.services;

import java.util.List;
import vn.iotstar.entity.Category;

public interface CategoryService {
	List<Category> findAll();
	List<Category> findByUserId(int userId);
	void create(Category category);
	void update(Category category);
	void delete(int id);
	Category findById(int id);
}