package vn.edu.hcmuaf.fit.cuahanggachmen.model.view_model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

public class ProductFilter {
    private List<Integer[]> priceRanges = new ArrayList<>();
    private int[] sizes = null;
    private int[] origins = null;


    public List<Integer[]> getPriceRanges() {
        return priceRanges;
    }

    public boolean havePriceRangeFilter() {
        return priceRanges != null && !priceRanges.isEmpty();
    }

    public boolean haveSizesFilter() {
        return sizes != null;
    }

    public boolean haveOriginsFilter() {
        return origins != null;
    }

    public void setPriceRanges(String[] priceRanges) {
        if (priceRanges == null || Objects.equals(priceRanges[0], "")) return;
        List<Integer[]> temp = new ArrayList<>();

        for (String s : priceRanges) {
            String[] split = s.split("-");
            Integer[] temp1 = new Integer[2];
            temp1[0] = Integer.valueOf(split[0]);
            temp1[1] = Integer.valueOf(split[1]);
            temp.add(temp1);
        }

        this.priceRanges = temp;
    }

    public int[] getSizes() {
        return sizes;
    }

    public void setSizes(String[] sizes) {
        if (sizes == null || Objects.equals(sizes[0], "")) return;
        this.sizes = convertToInt(sizes);
    }

    public int[] getOrigins() {
        return origins;
    }

    public void setOrigins(String[] origins) {
        if (origins == null || Objects.equals(origins[0], "")) return;
        this.origins = convertToInt(origins);
    }

    public boolean isManufacturer(int id) {
        return Arrays.stream(origins).anyMatch(i -> i == id);
    }

    public boolean isSize(int id) {
        return Arrays.stream(sizes).anyMatch(i -> i == id);
    }

    public boolean isPrice(int price) {
        return priceRanges.stream().anyMatch(i -> {
            return price >= i[0] && price <= i[1];
        });
    }

    private int[] convertToInt(String[] values) {
        return Arrays.stream(values).mapToInt(str -> {
            try{
                return Integer.parseInt(str);
            } catch (NumberFormatException e){
                System.out.println("Invalid number: " + str);
                return 0;
            }
        }).toArray();
    }

}
