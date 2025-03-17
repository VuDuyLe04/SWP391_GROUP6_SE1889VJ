package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface IServiceService {
    Service createService(Service service);
    Page<Service> findAllServices(Pageable pageable);
}
