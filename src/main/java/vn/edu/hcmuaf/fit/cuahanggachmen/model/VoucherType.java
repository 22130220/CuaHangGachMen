package vn.edu.hcmuaf.fit.cuahanggachmen.model;

public class VoucherType {
    private int id;
    private String name;


    public VoucherType() {
    }

    public VoucherType(int id, String name) {
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
        return "VoucherType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
