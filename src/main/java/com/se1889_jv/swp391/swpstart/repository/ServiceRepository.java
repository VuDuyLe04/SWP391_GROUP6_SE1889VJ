package com.se1889_jv.swp391.swpstart.repository;

import com.se1889_jv.swp391.swpstart.domain.Service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ServiceRepository extends JpaRepository<Service, Long>, JpaSpecificationExecutor<Service> {

    boolean existsByName(String name);

    @Query("SELECT CASE WHEN COUNT(s) > 0 THEN true ELSE false END " +
            "FROM Service s " +
            "WHERE s.name = :newName " +
            "AND s.name != :oldName")
    boolean existsByNameExcludingOldName(@Param("newName") String newName,
                                         @Param("oldName") String oldName);

    List<Service> findAllByActive(boolean active);

    Page<Service> findAll(Pageable pageable);
    Page<Service> findAll(Specification<Service> specification, Pageable pageable);
}
