package com.se1889_jv.swp391.swpstart.domain.dto.request;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.se1889_jv.swp391.swpstart.domain.common.PeriodType;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class PeriodTypeRequest {
    Integer year;
    Integer month;
    PeriodType periodType;
}
