package vn.edu.hcmuaf.fit.cuahanggachmen.model;

import java.io.Serializable;

public class Color implements Serializable {
    private  int ID;
    private String Name;
    private String Url;

    public Color() {

    }

    public Color(int ID, String name, String Url) {
        this.ID = ID;
        this.Name = name;
        this.Url = Url;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getUrl() {
        return Url;
    }

    public void setUrl(String Url) {
        this.Url = Url;
    }

    @Override
    public String toString() {
        return "Color{" +
                "ID=" + ID +
                ", Name='" + Name + '\'' +
                ", Url='" + Url + '\'' +
                '}';
    }
}
