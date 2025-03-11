package com.se1889_jv.swp391.swpstart.domain;

import com.se1889_jv.swp391.swpstart.util.validator.annotation.ValidDouble;
import com.se1889_jv.swp391.swpstart.util.validator.annotation.ValidInteger;
import jakarta.persistence.*;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;
import java.util.List;

@Entity
@Table(name = "services")
@Getter
@Setter
public class Service {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @NotBlank(message = "Tên dịch vụ không được để trống")
    private String name;
    @ValidInteger(message = "Thời gian dịch vụ phải lớn hơn 0 và là số nguyên")
    private Integer durationMonths;
    @Column(columnDefinition = "MEDIUMTEXT")
    private String description;

    @ValidDouble(message = "Giá dịch vụ phải lớn hơn bằng 0")
    private Double price;
    private Boolean active;
    private Instant createdAt;
    private String createdBy;
    private Instant updatedAt;
    private String updatedBy;

    @OneToMany(mappedBy = "service", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<TransactionService> transactionServices;



}
