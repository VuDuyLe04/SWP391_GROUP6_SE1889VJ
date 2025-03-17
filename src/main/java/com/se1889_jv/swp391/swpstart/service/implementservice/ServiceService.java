package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Service;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.repository.ServiceRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IServiceService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.time.Instant;

@org.springframework.stereotype.Service
public class ServiceService implements IServiceService {
    @Autowired
    private ServiceRepository serviceRepository;

    @Override
    public Service createService(Service service) {
        User user = Utility.getUserInSession();
        service.setCreatedAt(Instant.now());
        service.setCreatedBy(user.getName());
        service.setActive(true);
        return this.serviceRepository.save(service);
    }

    @Override
    public Page<Service> findAllServices(Pageable pageable) {
        return this.serviceRepository.findAll(pageable);
    }
}
