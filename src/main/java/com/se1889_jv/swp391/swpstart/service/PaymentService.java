package com.se1889_jv.swp391.swpstart.service;

import com.se1889_jv.swp391.swpstart.domain.TransactionPayment;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.repository.TransactionPaymentRepository;
import com.se1889_jv.swp391.swpstart.repository.UserRepository;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import com.se1889_jv.swp391.swpstart.util.constant.TransactionStatus;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Queue;
import java.util.concurrent.LinkedBlockingQueue;

@Service
public class PaymentService {
    private final RestTemplate restTemplate = new RestTemplate();

    private final Queue<TransactionPayment> transactionQueue = new LinkedBlockingQueue<>();

    @Autowired
    private UserService userService;
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TransactionPaymentRepository transactionPaymentRepository;
    // Gọi API mỗi 5 giây để lấy dữ liệu
    @Scheduled(fixedRate = 5000) // 5,000ms = 5 giây
    public void fetchPayments() {
        try {
            String url = "http://localhost:3000/payments";

            // Gửi request GET
            HttpHeaders headers = new HttpHeaders();
            HttpEntity<String> entity = new HttpEntity<>(headers);
            ResponseEntity<List> response = restTemplate.exchange(url, HttpMethod.GET, entity, List.class);

            // Xử lý dữ liệu trả về
            List<Map<String, Object>> payments = response.getBody();

            for (Map<String, Object> payment : payments) {
                if ((Integer) payment.get("amount") >= 50000) {
                    // Check if the transaction already exists in DB
                    String transactionId = (String) payment.get("transaction_id");
                    Optional<TransactionPayment> existingTransaction = transactionPaymentRepository.findByTransactionId(transactionId);

                    if (!existingTransaction.isPresent()) {
                        // If not, save it in DB with "PENDING" status
                        TransactionPayment transactionPayment = new TransactionPayment();
                        transactionPayment.setTransactionId(transactionId);
                        transactionPayment.setAmount((Integer) payment.get("amount"));
                        transactionPayment.setContent((String) payment.get("content"));

                        String dateString = (String) payment.get("date");
                        DateTimeFormatter formatter = DateTimeFormatter.ISO_OFFSET_DATE_TIME;
                        ZonedDateTime dateTime = ZonedDateTime.parse(dateString, formatter);
                        //Chuyển sang múi giờ Việt Nam
                        ZonedDateTime vietnamTime = dateTime.withZoneSameInstant(ZoneOffset.ofHours(7));

                        transactionPayment.setDate(vietnamTime.toLocalDateTime());


                        transactionPayment.setAccountReceiver((String) payment.get("account_receiver"));
                        transactionPayment.setGate((String) payment.get("gate"));
                        transactionPayment.setTransactionStatus(TransactionStatus.PENDING);

                        // Save the transaction in DB
                        transactionPaymentRepository.save(transactionPayment);

                        // Push to the Java queue
                        transactionQueue.offer(transactionPayment);
                    } else {
                        // If the transaction exists and has "PENDING" status
                        TransactionPayment existingPayment = existingTransaction.get();
                        if (existingPayment.getTransactionStatus() == TransactionStatus.PENDING) {
                            // Check if the transaction is already in the queue
                            if (!transactionQueue.contains(existingPayment)) {
                                // If not, push it into the queue for processing
                                transactionQueue.offer(existingPayment);
                            }
                        }
                    }
                }
            }

        } catch (Exception e) {
            System.err.println("Error fetching payments: " + e.getMessage());
        }

    }

    @PostConstruct
    public void initQueueAndStartProcessor() {
        // Tạo thread để xử lý queue
        new Thread(this::processQueue).start();
    }

    // Process the queue and update transaction status
    public void processQueue() {
        while (true) {
            try {
                // Pop the transaction from the queue
                TransactionPayment transactionPayment = transactionQueue.poll();

                if (transactionPayment != null) {
                    String content = transactionPayment.getContent();
                    String[] strings = content.split("\\.");
                    String id1 = "";
                    for (String string : strings) {
                        if (string.contains("rice")){
                            id1 = string;
                        }
                    }
                    String[] strings1 = id1.split(" ");
                    String id2 = "";
                    for (String string : strings1) {
                        if (string.contains("rice")){
                            id2 = string;
                        }
                    }

                    id2 = id2.replaceAll("[^0-9]", "").trim();


                    // Check if id is not empty or null
                    if (id2.isEmpty() || id2.equals("")) {
                        transactionPayment.setTransactionStatus(TransactionStatus.FAILURE);

                        transactionPaymentRepository.save(transactionPayment);

                        System.out.println("Invalid content: No valid id found in content: " + content);
                        continue; // Skip this transaction if no valid id
                    }

                    try {
                        // Parse the userId and find the user
                        long userId = Long.parseLong(id2);
                        User user = userService.findById(userId);

                        if (user != null) {
                            // Process the transaction (mark it as completed)
                            user.setBalance(user.getBalance() + (double) transactionPayment.getAmount());
                            transactionPayment.setTransactionStatus(TransactionStatus.COMPLETED);
                            transactionPayment.setUser(user);
                            transactionPaymentRepository.save(transactionPayment);
                            userRepository.save(user);
                        } else {
                            transactionPayment.setTransactionStatus(TransactionStatus.FAILURE);
                            transactionPaymentRepository.save(transactionPayment);
                            System.out.println("User not found for id: " + userId);
                        }

                    } catch (NumberFormatException e) {
                        // Handle the case where the id is not a valid number
                        transactionPayment.setTransactionStatus(TransactionStatus.FAILURE);
                        transactionPaymentRepository.save(transactionPayment);
                        System.out.println("Invalid userId format: " + id2);
                    }



                    System.out.println("Processed and updated transaction: " + transactionPayment.getTransactionId());
                }

                // Sleep before checking the queue again
                Thread.sleep(5000); // Sleep for 5 seconds
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

}
