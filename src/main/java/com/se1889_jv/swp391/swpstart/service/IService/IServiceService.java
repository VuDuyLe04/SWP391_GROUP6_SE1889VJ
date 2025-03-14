package com.se1889_jv.swp391.swpstart.service.IService;

import com.se1889_jv.swp391.swpstart.domain.Service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IServiceService {

    Service findServiceById(long id);

    Service createService(Service service);
    Page<Service> findAllServices(Pageable pageable);

    boolean existByName(String serviceName);

    void updateService(Service service);

    boolean existsByNameExcludingOldName(String newName, String oldName);

    List<Service> findAllServicesForHomePage();
}
