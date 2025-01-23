package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.WareHouse;

import javax.naming.Name;
import java.util.List;

public interface IWareHouseService {
    WareHouse createWareHouse(WareHouse warehouse, Store store);
    List<WareHouse> getAllWareHouse(Store store);
    WareHouse getWareHouseById(long id);
    boolean existsWareHouseByName(String name, Store store);
    void updateWareHouse(WareHouse warehouse);

}
