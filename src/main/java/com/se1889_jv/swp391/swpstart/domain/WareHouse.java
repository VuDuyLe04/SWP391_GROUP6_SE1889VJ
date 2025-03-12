package com.se1889_jv.swp391.swpstart.domain;

import com.se1889_jv.swp391.swpstart.util.validator.annotation.WareHouseExist;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.*;

import java.util.List;

@Entity
@Table(name = "ware_houses")
@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class WareHouse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @WareHouseExist
    private String name;

    @ManyToOne
    @JoinColumn(name = "store_id")
    private Store store;

    @OneToMany(mappedBy = "warehouse", fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
    private List<Product> products;

    // Thêm phương thức để lấy storeName
    public String getStoreName() {
        return store != null ? store.getName() : "Không xác định";
    }
}
