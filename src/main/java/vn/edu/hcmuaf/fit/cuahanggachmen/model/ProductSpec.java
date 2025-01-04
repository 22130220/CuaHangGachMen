package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.io.Serializable;

public class ProductSpec implements Serializable {
    private int procuctId;
    private int specId;
    private String value;
    private String specName;

    public ProductSpec(int procuctId, int specId, String value) {
        this.procuctId = procuctId;
        this.specId = specId;
        this.value = value;
    }

    public ProductSpec() {
    }

    public int getProcuctId() {
        return procuctId;
    }

    public void setProcuctId(int procuctId) {
        this.procuctId = procuctId;
    }

    public int getSpecId() {
        return specId;
    }

    public void setSpecId(int specId) {
        this.specId = specId;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getSpecName() {
        return specName;
    }

    public void setSpecName(String specName) {
        this.specName = specName;
    }
}
