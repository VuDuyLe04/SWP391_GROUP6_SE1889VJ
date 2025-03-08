package com.se1889_jv.swp391.swpstart.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public enum ErrorException {
    PRODUCT_NOT_FOUND(100, "Không tìm thấy sản phẩm này"),
    PRODUCT_IS_STORAGE(101, "Sản phẩm đã lưu trữ"),
    NOT_ENOUGH_QUANTITY(102, "Không đủ số lượng"),
    CUSTOMER_EXITED(103, "Khách hàng đã tồn tại trong cửa hàng"),
    NOT_NULL(104, "Không được để trống"),

    ;
    private int code;
    private String message;
}
