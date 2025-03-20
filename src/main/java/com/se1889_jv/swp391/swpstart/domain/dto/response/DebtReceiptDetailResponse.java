package com.se1889_jv.swp391.swpstart.domain.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import java.io.Serializable;
import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DebtReceiptDetailResponse implements Serializable {
    private long id;
    private String customerName;
    private String debtReason;
    private String debtType;
    @JsonFormat(pattern = "EEEE, dd-MM-yyyy")
    private LocalDate createdAt;
    private String createdBy;
    private double debtAmount;
    private double totalAmount;
}
