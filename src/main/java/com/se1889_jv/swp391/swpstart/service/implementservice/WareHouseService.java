package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.WareHouse;
import com.se1889_jv.swp391.swpstart.repository.WareHouseRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IWareHouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WareHouseService implements IWareHouseService {
    @Autowired
    private WareHouseRepository wareHouseRepository;
    @Override
    public WareHouse getWareHouseById(Long id) {
        return wareHouseRepository.findById(id).orElse(null);
    }
}
