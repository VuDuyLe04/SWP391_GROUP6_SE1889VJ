package com.se1889_jv.swp391.swpstart.exception;

import com.se1889_jv.swp391.swpstart.domain.dto.ApiResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ResourceException {
    @ExceptionHandler
    public ResponseEntity<ApiResponse> checkRunTimeException(AppException appException) {
        ErrorException errorException = appException.getErrorException();
        ApiResponse apiResponse = new ApiResponse();
        apiResponse.setCode(errorException.getCode());
        apiResponse.setMessage(errorException.getMessage());
        return ResponseEntity.badRequest().body(apiResponse);
    }
}
