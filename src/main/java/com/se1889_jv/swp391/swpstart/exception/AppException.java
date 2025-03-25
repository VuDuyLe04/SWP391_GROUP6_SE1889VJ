package com.se1889_jv.swp391.swpstart.exception;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data

@NoArgsConstructor
public class AppException extends RuntimeException{
    public ErrorException errorException;
    public AppException(ErrorException error) {
        super(error.getMessage());
    }
}
