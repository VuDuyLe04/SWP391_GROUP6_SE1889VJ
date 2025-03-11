package com.se1889_jv.swp391.swpstart.domain.dto.request;

import com.se1889_jv.swp391.swpstart.util.constant.DebtTypeEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DebtReceiptCreationRequest implements Serializable {
    private DebtTypeEnum debtType;
    private String debtReason;
    private double debtAmount;
    private long customerId;

}
