package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class User implements Serializable {
    private int id;
    private String fullname;
    private String email;
    private String phone;
    private String avatar;
    private String address;
    private LocalDateTime birthtime;
    private boolean status;
    private LocalDateTime createtime;
    private String salt;
    private int role;
    private String password;
    private String fbid; // Thêm trường fbid
    private int sex;

    public User() {}

    public User(int id, String fullname, String email, String phone, String avatar, String address,
                LocalDateTime birthtime, boolean status, LocalDateTime createtime, String salt,
                int role, String password, String fbid, int sex) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.avatar = avatar;
        this.address = address;
        this.birthtime = birthtime;
        this.status = status;
        this.createtime = createtime;
        this.salt = salt;
        this.role = role;
        this.password = password;
        this.fbid = fbid; // Thêm fbid vào constructor
        this.sex = sex;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", fullname='" + fullname + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", avatar='" + avatar + '\'' +
                ", address='" + address + '\'' +
                ", birthtime=" + birthtime +
                ", status=" + status +
                ", createtime=" + createtime +
                ", salt='" + salt + '\'' +
                ", role=" + role +
                ", password='" + password + '\'' +
                ", fbid='" + fbid + '\'' + // Thêm fbid vào toString
                ", sex=" + sex +
                '}';
    }

    // Getters và Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAvatar() { return avatar; }
    public void setAvatar(String avatar) { this.avatar = avatar; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public LocalDateTime getBirthtime() { return birthtime; }
    public void setBirthtime(LocalDateTime birthtime) { this.birthtime = birthtime; }

    public boolean isStatus() { return status; }
    public void setStatus(boolean status) { this.status = status; }

    public LocalDateTime getCreatetime() { return createtime; }
    public void setCreatetime(LocalDateTime createtime) { this.createtime = createtime; }

    public String getSalt() { return salt; }
    public void setSalt(String salt) { this.salt = salt; }

    public int getRole() { return role; }
    public void setRole(int role) { this.role = role; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getFbid() { return fbid; } // Getter cho fbid
    public void setFbid(String fbid) { this.fbid = fbid; } // Setter cho fbid

    public int getSex() { return sex; }
    public void setSex(int sex) { this.sex = sex; }
}