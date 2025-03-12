package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.WareHouse;
import com.se1889_jv.swp391.swpstart.domain.dto.request.WareHouseCreationRequest;
import com.se1889_jv.swp391.swpstart.domain.dto.response.WareHouseDetailResponse;


import java.util.List;

public interface IWareHouseService {
    void createWareHouse(WareHouseCreationRequest request);
    List<WareHouse> getAllWareHouse(Store store);
    WareHouse getWareHouseById(long id);
    boolean existsWareHouseByName(String name, Store store);
    void updateWareHouse(WareHouse warehouse);
    List<WareHouse> getAllWareHouseByListStore(List<Store> store);
    List<WareHouseDetailResponse> getAll();
}
