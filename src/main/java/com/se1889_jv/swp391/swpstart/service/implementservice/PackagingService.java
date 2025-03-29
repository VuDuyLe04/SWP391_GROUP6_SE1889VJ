package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Packaging;
import com.se1889_jv.swp391.swpstart.domain.Store;
import com.se1889_jv.swp391.swpstart.repository.PackagingRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IPackagingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@Service
public class PackagingService implements IPackagingService {

    @Autowired
    PackagingRepository packagingRepository;

    @Override
    public List<Packaging> getAllPackagingByStoreId(long storeId) {
        return packagingRepository.findPackagingByStoreId(storeId);
    }

    @Override
    public List<Packaging> getAllPackagingForQuantityProduct(double quantity, Long storeId) {
        return packagingRepository.findAllPackingForProduct(quantity, storeId);
    }

    @Override
    public Page<Packaging> getAllPackagingByStoreId(Long storeId, Pageable pageable) {
        return packagingRepository.findAllByStoreId(storeId, pageable);
    }

    @Override
    public Packaging getPackagingById(long id) {
        return packagingRepository.findById(id)
                .orElseThrow(() -> new NoSuchElementException("Packaging with ID " + id + " not found"));
    }

    @Override
    public Packaging getPackagingByPackingType(String packingType) {
        return packagingRepository.getPackagingByPackageType(packingType);

    }

    @Override
    public Page<Packaging> getPackagingIsActive(Pageable pageable) {
        return packagingRepository.findAllByStorageIsTrue(pageable);
    }

    @Override
    public Page<Packaging> getPackagingIsInactive(Pageable pageable) {
        return packagingRepository.findAllByStorageIsFalse(pageable);
    }

    @Override
    public Page<Packaging> getPackagingByInput(String input, Pageable pageable) {
        return packagingRepository.findAllByPackageTypeContaining(input, pageable);
    }

    @Override
    public void updatePackaging(Packaging packaging) {
        Optional<Packaging> packagingOptional = packagingRepository.findById(packaging.getId());
        if (packagingOptional.isPresent()) {
            Packaging pNew = packagingOptional.get();
            pNew.setPackageType(packaging.getPackageType());
            pNew.setLiftCost(packaging.getLiftCost());
            pNew.setStorage(packaging.isStorage());
            pNew.setQuantityPerPackage(packaging.getQuantityPerPackage());
            packagingRepository.save(pNew);
        }
    }

    @Override
    public Page<Packaging> getAllPackByUserManage(List<Long> storesId, Pageable pageable) {
        return packagingRepository.findAllByStoreIdIn(storesId, pageable);
    }

    @Override
    public List<Packaging> getAllPackagingForOwner(List<Long> storeId) {
        return packagingRepository.findAllByStoreIdIn(storeId);
    }

    @Override
    public void addPackaging(Packaging packaging) {
        packagingRepository.save(packaging);
    }

    @Override
    public Page<Packaging> getAllPackagingByStoresIdAndStorage(Long storeId, Pageable pageable, boolean storage) {
        if(storage){
            return packagingRepository.findAllByStoreIdAndStorageIsTrue(storeId, pageable);
        } else {
            return packagingRepository.findAllByStoreIdAndStorageIsFalse(storeId, pageable);
        }
    }

    @Override
    public Page<Packaging> getAllPackagingByStorage(List<Long> storeId, Pageable pageable, boolean storage) {
        if(storage){
            return packagingRepository.findAllByStoreIdInAndStorageIsTrue(storeId, pageable);
        } else {
            return packagingRepository.findAllByStoreIdInAndStorageIsFalse(storeId, pageable);
        }
    }
    public boolean isExistedByPackNameAndStore(String packType, long storeId) {
        return packagingRepository.existsByPackageTypeAndStoreId(packType, storeId);
    }
}
