package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.io.Serializable;

public class Size implements Serializable {
    private int id;
    private String name;

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

    @Override
    public String toString() {
        return "Size{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}

