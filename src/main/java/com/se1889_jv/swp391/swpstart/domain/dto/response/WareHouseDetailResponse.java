package com.se1889_jv.swp391.swpstart.domain.dto.response;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class WareHouseDetailResponse {
    private long id;
    private String name;
    private long storeId;
    private String storeName;
}
