package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Packaging;

import java.util.List;

public interface IPackagingService {
    List<Packaging> getAllPackaging();
    List<Packaging> getAllPackagingForQuantityProduct(double quantity);
}
