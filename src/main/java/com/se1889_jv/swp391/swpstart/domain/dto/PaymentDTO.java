package com.se1889_jv.swp391.swpstart.domain.dto;


import com.se1889_jv.swp391.swpstart.util.validator.annotation.ValidInteger;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PaymentDTO {
    @NotNull(message = "Bạn phải chọn cổng thanh toán bất kỳ")
    private String gate;

    @ValidInteger(message = "Không được để trống")
    private Integer amount;

    private String content;
}
