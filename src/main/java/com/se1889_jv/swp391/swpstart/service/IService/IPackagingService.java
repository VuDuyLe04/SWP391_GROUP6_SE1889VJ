package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Packaging;
import com.se1889_jv.swp391.swpstart.domain.Store;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IPackagingService {
    List<Packaging> getAllPackagingByStoreId(long storeId);
    List<Packaging> getAllPackagingForQuantityProduct(double quantity, Long storeId);
    Page<Packaging> getAllPackagingByStoreId(Long storeId, Pageable pageable);
    Packaging getPackagingById(long id);
    Packaging getPackagingByPackingType(String packingType);
    Page<Packaging> getPackagingIsActive(Pageable pageable);
    Page<Packaging> getPackagingIsInactive(Pageable pageable);
    Page<Packaging> getPackagingByInput(String input, Pageable pageable);
    void updatePackaging(Packaging packaging);
    Page<Packaging> getAllPackByUserManage(List<Long> storeId, Pageable pageable);
    List<Packaging> getAllPackagingForOwner(List<Long> storeId);
    void addPackaging(Packaging packaging);
    Page<Packaging> getPackagingByStoreAndStorage(Long storeId, boolean isActive, Pageable pageable);
    Page<Packaging> getPackagingByStoresAndStorage(List<Long> storeIds, boolean isActive, Pageable pageable);
}
