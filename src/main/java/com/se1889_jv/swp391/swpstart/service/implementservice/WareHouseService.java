package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.domain.WareHouse;
import com.se1889_jv.swp391.swpstart.repository.WareHouseRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IWareHouseService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class WareHouseService implements IWareHouseService {
    @Autowired
    private WareHouseRepository wareHouseRepository;

    @Override
    public WareHouse createWareHouse(WareHouse warehouse, Store store) {
        warehouse.setStore(store);
        return this.wareHouseRepository.save(warehouse);
    }

    @Override
    public List<WareHouse> getAllWareHouse(Store store) {
        return this.wareHouseRepository.findByStore(store);
    }

    @Override
    public WareHouse getWareHouseById(long id) {
        Optional<WareHouse> warehouse = this.wareHouseRepository.findById(id);
        if (warehouse.isPresent()) {
            return warehouse.get();
        }
        return null;

    }

    @Override
    public boolean existsWareHouseByName(String name, Store store) {
        return this.wareHouseRepository.existsByNameAndStore(name, store);
    }

    @Override
    public void updateWareHouse(WareHouse warehouse) {
        WareHouse oldWarehouse = this.getWareHouseById(warehouse.getId());
        if (oldWarehouse != null) {
            oldWarehouse.setName(warehouse.getName());
        }
        assert oldWarehouse != null;
        this.wareHouseRepository.save(oldWarehouse);
    }

    @Override
    public List<WareHouse> getAllWareHouseByListStore(List<Store> store) {
        return wareHouseRepository.findAllByStoreIn(store);
    }



}
