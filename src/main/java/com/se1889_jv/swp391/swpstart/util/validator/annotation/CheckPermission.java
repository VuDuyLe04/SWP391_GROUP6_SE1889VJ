package com.se1889_jv.swp391.swpstart.util.validator.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface CheckPermission {
    String condition() default "";  // Tham số condition có thể là một điều kiện tùy chỉnh (ví dụ: ID của khách hàng, trạng thái của đơn hàng, v.v...)
}

