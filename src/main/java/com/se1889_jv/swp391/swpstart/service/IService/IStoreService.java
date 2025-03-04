package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Store;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface IStoreService {
    Store findStoreById(long id);
    List<Store> getAllStores();
    Store saveStore(Store store);
    Page<Store> findStoresByCreatedBy(String createdBy, Pageable pageable);


}
