package com.se1889_jv.swp391.swpstart.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.Instant;
import java.util.List;

@Entity
@Table(name = "products")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank(message = "Tên sản phẩm không được để trống")
    @Size(max = 50, message = "Tên sản phẩm không được vượt quá 50 ký tự")
    private String name;

    @NotBlank(message = "Loại sản phẩm không được để trống")
    @Size(max = 30, message = "Loại sản phẩm không được vượt quá 30 ký tự")
    private String category;

    @NotEmpty(message = "Mô tả không được để trống")
    @Size(max = 255, message = "Mô tả sản phẩm không được vượt quá 255 ký tự")
    private String description;

    @NotNull(message = "Giá sản phẩm không được để trống")
    @Min(value = 1, message = "Giá phải lớn hơn 0")
    private double unitPrice;

    private double totalQuantity;
    private String image;
    private boolean storage;

    @CreationTimestamp
    @Column(updatable = false)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @JsonFormat(pattern = "dd-MM-yyyy", timezone = "Asia/Ho_Chi_Minh")
    private Instant createdAt;

    @UpdateTimestamp
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @JsonFormat(pattern = "dd-MM-yyyy", timezone = "Asia/Ho_Chi_Minh")
    private Instant updatedAt;

    private String createdBy;
    private String updatedBy;

    @NotNull(message = "Phải chọn cửa hàng và kho")
    @ManyToOne
    @JoinColumn(name = "store_id")
    private Store store;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "warehouse_id")
    private WareHouse warehouse;

    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<BillDetail> billDetails;

}
