package vn.edu.hcmuaf.fit.cuahanggachmen.storage;

import java.util.List;

public interface IServerStorage<T> {
    void update();
    List<T> getAll();
    T get(int id);
}
