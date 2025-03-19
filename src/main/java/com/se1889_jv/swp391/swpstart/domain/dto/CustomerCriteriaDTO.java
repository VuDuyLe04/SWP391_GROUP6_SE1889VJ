package com.se1889_jv.swp391.swpstart.domain.dto;

import lombok.*;

import java.util.Optional;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CustomerCriteriaDTO {
    private Optional<String> page;
    private Optional<String> name;
}
