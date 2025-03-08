package com.se1889_jv.swp391.swpstart.domain.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class BillDetailRequest implements Serializable {
    private Long productId;
    private int quantity;
    private Long packagingId;
    private double actualSellPrice;
    private double listedPrice;
    private double liftPrice;
    private Long billId;
    private double discount;
}
