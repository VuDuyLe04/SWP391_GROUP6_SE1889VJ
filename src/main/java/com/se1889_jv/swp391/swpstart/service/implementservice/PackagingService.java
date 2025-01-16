package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Packaging;
import com.se1889_jv.swp391.swpstart.repository.PackagingRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IPackagingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
}
