package com.se1889_jv.swp391.swpstart.domain.dto.request;

import com.se1889_jv.swp391.swpstart.util.constant.DebtTypeEnum;
import lombok.Getter;
import java.io.Serializable;
import java.math.BigDecimal;

@Getter
public class DebtReceiptCreationRequest implements Serializable {
    private DebtTypeEnum debtType;
    private String debtReason;
    private BigDecimal amount;
    private long customerId;

}
