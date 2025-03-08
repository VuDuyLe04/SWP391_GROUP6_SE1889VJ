package com.se1889_jv.swp391.swpstart.domain.dto;

import com.se1889_jv.swp391.swpstart.domain.Packaging;
import lombok.Data;

import java.util.List;

@Data
public class ProductResponse {
    private long id;
    private String name;
    private String category;
    private double unitPrice;
    private String description;
    private double totalQuantity;
    private String image;
    String warehouseName;
    private List<Packaging> packagings;

}
