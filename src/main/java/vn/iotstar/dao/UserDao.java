package vn.iotstar.dao;

import java.util.List;
import vn.iotstar.entity.User;

public interface UserDao {
    List<User> findAll();
    void create(User user);
    void update(User user);
    void delete(int id);
    User findById(int id);
    User findByUsername(String username);
    User findByEmail(String email);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
}