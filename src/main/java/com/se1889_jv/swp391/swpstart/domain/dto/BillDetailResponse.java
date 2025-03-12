package com.se1889_jv.swp391.swpstart.domain.dto;

import com.se1889_jv.swp391.swpstart.domain.BillDetail;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BillDetailResponse {
    private Long id;
    private double quantity;
    private double listedPrice;
    private double actualSellPrice;
    private double liftPrice;
    private boolean lift;
    private String nameProduct;
    private double totalLiftProductPrice;
    private double totalProductPrice;
    private Long billId;
    private Long productId;
    private Long packagingId;
    private String packagingName;
    public BillDetailResponse(BillDetail billDetail) {
        this.id = billDetail.getId();
        this.quantity = billDetail.getQuantity();
        this.listedPrice = billDetail.getListedPrice();
        this.actualSellPrice = billDetail.getActualSellPrice();
        this.liftPrice = billDetail.getLiftPrice();
        this.lift = billDetail.isLift();
        this.nameProduct = billDetail.getNameProduct();
        this.totalLiftProductPrice = billDetail.getTotalLiftProductPrice();
        this.totalProductPrice = billDetail.getTotalProductPrice();
        this.billId = billDetail.getBill().getId();
        this.productId = billDetail.getProduct().getId();
        this.packagingId = billDetail.getPackaging().getId();
        this.packagingName = billDetail.getPackaging().getPackageType();
    }
}
