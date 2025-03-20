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
    BILL_DETAIL_NOT_FOUND(105, "Không tìm thấy thông tin bill này"),
    BILL_NOT_FOUND(106, "Bill này không tồn tại"),
    PACK_NOT_FOUND(107, "Không thấy đóng gói này"),
    NOT_POSITIVE(108, "Số lượng không thể âm"),
    DEBT_DONT_HAVE_CUSTOMER(109,"Hãy thêm khách hàng vào phiếu nợ"),
    ACTUAL_PRICE_NOT_POSITIVE(110, "Gía bán thực tế không thể âm"),
    ;
    private int code;
    private String message;


}
