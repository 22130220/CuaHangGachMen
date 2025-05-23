package vn.edu.hcmuaf.fit.cuahanggachmen.model.wrapper;

import vn.edu.hcmuaf.fit.cuahanggachmen.model.OutOfStockDetail;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.StockInDetail;

import java.util.List;

public class OutOfStockRequest {
    private List<OutOfStockDetail> outOfStocDetails;
    private int typeid;

    // Getters và Setters
    public List<OutOfStockDetail> getOutOfStockDetails() {
        return outOfStocDetails;
    }

    public void setStockInDetails(List<OutOfStockDetail> outOfStockDetails) {
        this.outOfStocDetails = outOfStockDetails;
    }

    public int getTypeid() {
        return typeid;
    }

    public void setTypeid(int typeid) {
        this.typeid = typeid;
    }
}
