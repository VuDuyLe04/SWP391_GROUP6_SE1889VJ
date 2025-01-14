package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.repository.StoreRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IStoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreService implements IStoreService {
    @Autowired
    private StoreRepository storeRepository;
    @Override
    public Store findStoreById(long id) {
        return storeRepository.findById(id).orElseThrow(() -> new RuntimeException("Not found Store"));
    }
}
