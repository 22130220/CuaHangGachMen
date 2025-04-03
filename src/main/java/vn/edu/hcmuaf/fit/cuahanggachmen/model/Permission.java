package vn.edu.hcmuaf.fit.cuahanggachmen.model;

public class Permission {
    private int id;
    private String name;

    public Permission() {}

    public Permission(int id, String name) {
        this.id = id;
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
        return "Permission{id=" + id + ", name='" + name + "'}";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Permission permission = (Permission) o;
        return id == permission.id;
    }

    @Override
    public int hashCode() {
        return Integer.hashCode(id);
    }
}
