package com.se1889_jv.swp391.swpstart.controller.admin;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class DebtRequest implements Serializable {
    private Long debtId;
}
