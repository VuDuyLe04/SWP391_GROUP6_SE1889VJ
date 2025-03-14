package com.se1889_jv.swp391.swpstart.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
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
