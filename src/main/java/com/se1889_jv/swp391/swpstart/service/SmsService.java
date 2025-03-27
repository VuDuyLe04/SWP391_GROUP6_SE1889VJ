package com.se1889_jv.swp391.swpstart.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.se1889_jv.swp391.swpstart.domain.Customer;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.sms.ResponseView;
import com.se1889_jv.swp391.swpstart.domain.sms.SendSmsModel;
import com.se1889_jv.swp391.swpstart.repository.CustomerRepository;
import com.se1889_jv.swp391.swpstart.repository.UserRepository;
import com.se1889_jv.swp391.swpstart.service.implementservice.CustomerService;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.http.HttpHeaders;
import java.util.Random;

@Service
public class SmsService {

    private static final String API_URL = "https://api.smsmarketing.vn/campaign/sendone/";
    private static final String SECRET_KEY = "WW+AdICuRuo9mpJLYp5I95xfIEYGlZJjRjZTi+ag3r8=";
    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    private final ObjectMapper objectMapper;

    public SmsService(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }

    public ResponseView sendSms(String phoneNumber) throws Exception {
        User user = this.userRepository.findByPhone(phoneNumber);
        SendSmsModel smsModel = new SendSmsModel();
        smsModel.setCustomerPhone(phoneNumber);
        smsModel.setSecretKey(SECRET_KEY);
        smsModel.setCustomerName(user.getName());
        smsModel.setCustomerInfo(genOTP());
        String jsonRequest = objectMapper.writeValueAsString(smsModel);

        URL url = new URL(API_URL);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setDoOutput(true);

        try (OutputStream os = connection.getOutputStream()) {
            byte[] input = jsonRequest.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        int responseCode = connection.getResponseCode();
        if (responseCode != HttpURLConnection.HTTP_OK) {
            throw new IOException("HTTP request failed with code: " + responseCode);
        }

        try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"))) {
            StringBuilder response = new StringBuilder();
            String responseLine;
            while ((responseLine = br.readLine()) != null) {
                response.append(responseLine.trim());
            }

            return objectMapper.readValue(response.toString(), ResponseView.class);
        }
    }

    public static String genOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000); // Sinh một số từ 100000 đến 999999
        return String.valueOf(otp); // Trả về OTP dưới dạng chuỗi
    }


}
