package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.time.LocalDateTime;

public class Contact {
    private int id;
    private String fullname;
    private String email;
    private String title;
    private String content;
    private LocalDateTime date;
    private boolean isReply;





    public Contact( String content, LocalDateTime date, String title, String email, String fullname) {
        this.content = content;
        this.date = date;
        this.title = title;
        this.email = email;
        this.fullname = fullname;
    }

    public Contact() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public boolean isReply() {
        return isReply;
    }

    public void setReply(boolean reply) {
        isReply = reply;
    }


    @Override
    public String toString() {
        return "Contact{" +
                "id=" + id +
                ", fullname='" + fullname + '\'' +
                ", email='" + email + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", date=" + date +
                ", isReply=" + isReply +
                '}';
    }
}
