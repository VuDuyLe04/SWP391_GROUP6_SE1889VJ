package com.se1889_jv.swp391.swpstart.domain.dto.response;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.Instant;

@Getter
@Setter
@Builder
public class DebtReceiptCreationResponse implements Serializable {
    private long id;
    private String customerName;
    private String debtReason;
    private Instant createdAt;
    private String createdBy;
    private double debtAmount;
    private double totalAmount;

}
