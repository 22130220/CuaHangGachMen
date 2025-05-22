package vn.edu.hcmuaf.fit.cuahanggachmen.model.wrapper;

import vn.edu.hcmuaf.fit.cuahanggachmen.model.StockInDetail;

import java.util.List;

public class StockInRequest {
    private List<StockInDetail> stockInDetails;
    private int typeid;

    // Getters và Setters
    public List<StockInDetail> getStockInDetails() {
        return stockInDetails;
    }

    public void setStockInDetails(List<StockInDetail> stockInDetails) {
        this.stockInDetails = stockInDetails;
    }

    public int getTypeid() {
        return typeid;
    }

    public void setTypeid(int typeid) {
        this.typeid = typeid;
    }
}
