package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.io.Serializable;

public class SpecType implements Serializable {
    private int id;
    private String name;

    public SpecType(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public SpecType() {
    }

    @Override
    public String toString() {
        return "SpecType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }

    // Getters and Setters
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

}
