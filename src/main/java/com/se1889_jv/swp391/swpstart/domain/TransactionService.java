package com.se1889_jv.swp391.swpstart.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.se1889_jv.swp391.swpstart.util.constant.TransactionStatus;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@Entity
@Table(name = "transaction_services")
@Getter
@Setter
public class TransactionService {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String serviceName;
    private int durationMonths;


    private LocalDateTime transactionDate;
    private double amount;
    @Enumerated(EnumType.STRING)
    private TransactionStatus transactionStatus;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "service_id")
    private Service service;
    public String getFormattedDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return (transactionDate != null) ? transactionDate.format(formatter) : null;
    }


}
