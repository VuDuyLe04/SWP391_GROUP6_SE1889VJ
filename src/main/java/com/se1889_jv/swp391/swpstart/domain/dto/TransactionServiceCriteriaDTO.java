package com.se1889_jv.swp391.swpstart.domain.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Optional;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TransactionServiceCriteriaDTO {
    private Optional<String> page;
    private Optional<String> status;
    private Optional<String> amount;
//    private Optional<String> currency;
}
