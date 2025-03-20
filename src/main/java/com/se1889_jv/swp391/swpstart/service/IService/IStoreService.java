package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.util.constant.StatusStoreEnum;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface IStoreService {
    Store findStoreById(long id);
    List<Store> getAllStores();
    Store saveStore(Store store);
    List<Store> findStoresByCreatedBy(String createdBy);
    Page<Store> findStoresByCreatedBy(String createdBy, Pageable pageable);
//    Page<Store> findStoresByStatus(StatusStoreEnum status, Pageable pageable);
    public Page<Store> findStoresByStatus(StatusStoreEnum status, String createdBy, Pageable pageable) ;
    Page<Store> findStoresbyNameOrAddressOfOwner(String createdBy, String name, String createdBy2, String address, Pageable pageable);
    Page<Store> findStoresByStatusAndNameOrAdress(
            String createdBy,StatusStoreEnum status, String name,
            String createdBy2, StatusStoreEnum status2, String address,
            Pageable pageable);


    Store findByName(String name, String createdBy);
}
