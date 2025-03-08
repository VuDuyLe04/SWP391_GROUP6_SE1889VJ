package com.se1889_jv.swp391.swpstart.exception;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AppException extends RuntimeException{
    public ErrorException errorException;
}
