package com.se1889_jv.swp391.swpstart;

import com.se1889_jv.swp391.swpstart.domain.User;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
//@SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
public class SwpStartApplication {

    public static void main(String[] args) {
        SpringApplication.run(SwpStartApplication.class, args);

    }

}
