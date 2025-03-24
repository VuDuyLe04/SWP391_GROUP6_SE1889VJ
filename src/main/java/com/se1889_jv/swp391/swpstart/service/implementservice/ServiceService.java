package com.se1889_jv.swp391.swpstart.service.implementservice;

import com.se1889_jv.swp391.swpstart.domain.Service;
import com.se1889_jv.swp391.swpstart.domain.Service_;
import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.domain.dto.ServiceCriteriaDTO;
import com.se1889_jv.swp391.swpstart.repository.ServiceRepository;
import com.se1889_jv.swp391.swpstart.service.IService.IServiceService;
import com.se1889_jv.swp391.swpstart.service.specification.ServiceSpecs;
import com.se1889_jv.swp391.swpstart.util.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import java.time.Instant;
import java.util.List;
import java.util.Optional;

@org.springframework.stereotype.Service
public class ServiceService implements IServiceService {
    @Autowired
    private ServiceRepository serviceRepository;

    @Override
    public Service findServiceById(long id) {
        Optional<Service> service = serviceRepository.findById(id);
        if (service.isPresent()) {
            return service.get();
        }
        return null;
    }

    @Override
    public Service createService(Service service) {
        User user = Utility.getUserInSession();
        service.setCreatedAt(Instant.now());
        service.setCreatedBy(user.getName());
        return this.serviceRepository.save(service);
    }

    @Override
    public Page<Service> findAllServices(Pageable pageable) {
        return null;
    }




    
    public Page<Service> findAllServices(Pageable pageable, ServiceCriteriaDTO serviceCriteriaDTO) {
        if (serviceCriteriaDTO.getName() == null
                && serviceCriteriaDTO.getStatus() == null
                && serviceCriteriaDTO.getDurationMonths() == null) {
            return this.serviceRepository.findAll(pageable);
        }


        Specification<Service> combined = Specification.where(null);
        if ( serviceCriteriaDTO.getName() != null && serviceCriteriaDTO.getName().isPresent()) {
            Specification<Service> currentSpecs = ServiceSpecs.nameLike(serviceCriteriaDTO.getName().get());
            combined = combined.and(currentSpecs);
        }
        if (serviceCriteriaDTO.getStatus() != null && serviceCriteriaDTO.getStatus().isPresent()) {
            Specification<Service> currentSpecs = ServiceSpecs.statusEqual(serviceCriteriaDTO.getStatus().get());
            combined = combined.and(currentSpecs);
        }
        if (serviceCriteriaDTO.getDurationMonths() != null && serviceCriteriaDTO.getDurationMonths().isPresent()) {
            Specification<Service> currentSpecs = ServiceSpecs.durationMonthsEqual(serviceCriteriaDTO.getDurationMonths().get());
            combined = combined.and(currentSpecs);
        }
        return this.serviceRepository.findAll(combined,pageable);
    }

    @Override
    public boolean existByName(String serviceName) {
        return this.serviceRepository.existsByName(serviceName);
    }

    @Override
    public void updateService(Service service) {
        Service oldService = this.findServiceById(service.getId());
        if (oldService != null) {
            oldService.setName(service.getName());
            oldService.setDescription(service.getDescription());
            oldService.setActive(service.getActive());
            oldService.setPrice(service.getPrice());
            oldService.setDurationMonths(service.getDurationMonths());
        }
        this.serviceRepository.save(oldService);
    }

    @Override
    public boolean existsByNameExcludingOldName(String newName, String oldName) {
        return this.serviceRepository.existsByNameExcludingOldName(newName, oldName);
    }

    @Override
    public List<Service> findAllServicesForHomePage() {
        return this.serviceRepository.findAllByActive(true);
    }


}
