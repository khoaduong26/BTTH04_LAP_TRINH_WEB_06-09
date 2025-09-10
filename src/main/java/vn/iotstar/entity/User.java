package vn.iotstar.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "Users")
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(name = "email", columnDefinition = "NVARCHAR(50)")
    private String email;
    
    @Column(name = "username", columnDefinition = "NVARCHAR(50)")
    private String username;
    
    @Column(name = "fullname", columnDefinition = "NVARCHAR(50)")
    private String fullname;
    
    @Column(name = "password", columnDefinition = "NVARCHAR(50)")
    private String password;
    
    @Column(name = "avatar", columnDefinition = "NVARCHAR(MAX)")
    private String avatar;
    
    @Column(name = "roleid", columnDefinition = "NVARCHAR(50)")
    private String roleid = "1"; // Default role is user
    
    @Column(name = "phone", columnDefinition = "NVARCHAR(50)")
    private String phone;
    
    @Column(name = "createdDate")
    private LocalDate createdDate;
    
    // One User has many Categories
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Category> categories;
    
    // Constructors
    public User() {
        this.createdDate = LocalDate.now();
        this.roleid = "1";
    }
    
    public User(String email, String username, String fullname, String password, String phone) {
        this();
        this.email = email;
        this.username = username;
        this.fullname = fullname;
        this.password = password;
        this.phone = phone;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getFullname() {
        return fullname;
    }
    
    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getAvatar() {
        return avatar;
    }
    
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    
    public String getRoleid() {
        return roleid;
    }
    
    public void setRoleid(String roleid) {
        this.roleid = roleid;
    }
    
    public String getPhone() {
        return phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public LocalDate getCreatedDate() {
        return createdDate;
    }
    
    public void setCreatedDate(LocalDate createdDate) {
        this.createdDate = createdDate;
    }
    
    public List<Category> getCategories() {
        return categories;
    }
    
    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }
}