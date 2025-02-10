package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.repository.StoreRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IStoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StoreService implements IStoreService {
    @Autowired
    private StoreRepository storeRepository;


    @Override
    public Store findStoreById(long id) {
        if (this.storeRepository.findById(id).isPresent()) {
            return this.storeRepository.findById(id).get();
        }

        return null;

    }

    @Override
    public List<Store> getAllStores() {
        return storeRepository.findAll();
    }
}
