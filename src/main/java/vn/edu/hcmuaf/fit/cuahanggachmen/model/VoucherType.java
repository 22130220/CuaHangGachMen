package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.io.Serializable;

public class VoucherType implements Serializable {
    private int id;
    private String name;
    private boolean isActive;

    public VoucherType() {
    }
    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public VoucherType(int id, String name) {
        this.id = id;
        this.name = name;
    }
    public VoucherType(int id, boolean isActive, String name) {
        this.id = id;
        this.isActive = isActive;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "VoucherType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", isActive=" + isActive +
                '}';
    }
}
