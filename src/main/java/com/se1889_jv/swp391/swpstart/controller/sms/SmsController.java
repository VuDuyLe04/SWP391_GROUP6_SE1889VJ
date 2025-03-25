package com.se1889_jv.swp391.swpstart.controller.sms;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SmsController {
    @GetMapping("/sendSms/{toPhoneNumber}/{text}")
    public ResponseEntity sendSms(@PathVariable("toPhoneNumber") String toPhoneNumber,@PathVariable("text") String text) {

        Twilio.init("ACa1646d50597299be12d44d42eaf55d27","d68f65e8ff17e9cc5bc3a799930eca90");
        Message.creator(new PhoneNumber(toPhoneNumber), new PhoneNumber("+18483455895"), text).create();

        return new ResponseEntity("OTP sent successfully", HttpStatus.OK);
    }

    public String generateOTP() {
        String otp = "";

        otp = Math.round(Math.random()*9+1)+"";
        return otp;
    }
    
}
