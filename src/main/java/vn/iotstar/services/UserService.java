package vn.iotstar.services;

import java.util.List;
import vn.iotstar.entity.User;

public interface UserService {
    List<User> findAll();
    void create(User user);
    void update(User user);
    void delete(int id);
    User findById(int id);
    User findByUsername(String username);
    User findByEmail(String email);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    User login(String username, String password);
    boolean register(String email, String username, String fullname, String password, String phone);
}