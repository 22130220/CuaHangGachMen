package vn.edu.hcmuaf.fit.cuahanggachmen.model;

public class TypeOfReceipt {
    private int id;
    private String type;
    private boolean isActive;

    public TypeOfReceipt() {
    }

    public TypeOfReceipt(int id, boolean isActive, String type) {
        this.id = id;
        this.isActive = isActive;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Override
    public String toString() {
        return "TypeOfReceipt{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", isActive=" + isActive +
                '}';
    }
}
