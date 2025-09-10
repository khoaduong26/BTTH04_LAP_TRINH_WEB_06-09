package vn.iotstar.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.CategoryDao;
import vn.iotstar.entity.*;
public class CategoryImpl implements CategoryDao {

	@Override
	public List<vn.iotstar.entity.Category> findAll() {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			TypedQuery<vn.iotstar.entity.Category> query = enma.createNamedQuery("Category.findAll", vn.iotstar.entity.Category.class);
			return query.getResultList();
		} finally {
			enma.close();
		}
	}

	@Override
	public List<vn.iotstar.entity.Category> findByUserId(int userId) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			TypedQuery<vn.iotstar.entity.Category> query = enma.createNamedQuery("Category.findByUserId", vn.iotstar.entity.Category.class);
			query.setParameter("userId", userId);
			return query.getResultList();
		} finally {
			enma.close();
		}
	}

	@Override
	public void create(vn.iotstar.entity.Category category) {
	    EntityManager enma = JPAConfig.getEntityManager();
	    
	    EntityTransaction trans = enma.getTransaction();
	    
	    try {
	        trans.begin();
	        
	        enma.persist(category);
	        
	        trans.commit();
	    } catch (Exception e) {
	        if (trans.isActive()) {
	            trans.rollback();
	        }
	        e.printStackTrace(); 
	    } finally {
	        enma.close();
	    }
	}

	@Override
	public void update(vn.iotstar.entity.Category category) {
	    EntityManager enma = JPAConfig.getEntityManager();

	    EntityTransaction trans = enma.getTransaction();

	    try {
	        trans.begin();

	        enma.merge(category);

	        trans.commit();
	    } catch (Exception e) {
	        if (trans.isActive()) {
	            trans.rollback();
	        }
	        e.printStackTrace(); 
	    } finally {
	        enma.close();
	    }
		
	}

	@Override
	public void delete(int id) {
		   EntityManager enma = JPAConfig.getEntityManager();
		    EntityTransaction trans = enma.getTransaction();

		    try {
		        trans.begin();

		        Category category = enma.find(Category.class, id);

		        if (category == null) {
		            System.out.println("Không tìm thấy Category với id = " + id);
		            trans.rollback();  
		            return;
		        }

		        enma.remove(category);

		        trans.commit();
		        System.out.println("Xóa Category với id = " + id + " thành công.");
		    } catch (Exception e) {
		        if (trans.isActive()) {
		            trans.rollback();
		        }
		        e.printStackTrace();
		    } finally {
		        enma.close();
		    }
		
	}

	@Override
	public vn.iotstar.entity.Category findById(int id) {
		  EntityManager enma = JPAConfig.getEntityManager();
		    try {
		        return enma.find(Category.class, id);
		    } catch (Exception e) {
		        e.printStackTrace();
		        return null;
		    } finally {
		        enma.close();
		    }
	}
	

}