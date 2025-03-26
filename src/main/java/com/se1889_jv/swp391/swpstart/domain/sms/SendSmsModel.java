package com.se1889_jv.swp391.swpstart.domain.sms;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SendSmsModel {
    private String secretKey;
    private String customerPhone;
    private String customerName;
    private String customerGender;
    private String customerInfo;
}
