package com.se1889_jv.swp391.swpstart.domain.dto;

import com.se1889_jv.swp391.swpstart.domain.BillDetail;
import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.Product;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class BillDTO {
    private List<BillDetail> billDetails;
    private double paid;
    private double inDebt;
    private double totalPrice;
    private double totalLift;
    private String customerInformation;
    private String customerAddress;
    private String des;
    private int storeId;
    public BillDTO() {
    }

    public List<BillDetail> getBillDetails() {
        return billDetails;
    }

    public void setBillDetails(List<BillDetail> billDetails) {
        this.billDetails = billDetails;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public double getTotalLift() {
        return totalLift;
    }

    public void setTotalLift(double totalLift) {
        this.totalLift = totalLift;
    }



    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }
}
