package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Packaging;
import com.se1889_jv.swp391.swpstart.repository.PackagingRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IPackagingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;

@Service
public class PackagingService implements IPackagingService {
    @Autowired
    PackagingRepository packagingRepository;
    @Override
    public List<Packaging> getAllPackaging() {
        return packagingRepository.findAll();
    }

    @Override
    public List<Packaging> getAllPackagingForQuantityProduct(double quantity) {
        return packagingRepository.findAllPackingForProduct(quantity);
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
}
